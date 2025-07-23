resource "azurerm_network_security_group" "nsg" {
  count               = local.create_nsg ? 1 : 0
  name                = format("nsg-%s", local.ngs_name)
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_network_security_rule" "rules" {
  for_each = {
    for rule in local.effective_rules : rule.name => rule
  }

  name                        = each.value.name
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  resource_group_name         = local.effective_nsg_rg_name
  network_security_group_name = local.effective_nsg_name

  # Support both single and multiple address prefixes
  source_address_prefix            = lookup(each.value, "source_address_prefix", null)
  source_address_prefixes          = lookup(each.value, "source_address_prefixes", null)
  destination_address_prefix       = lookup(each.value, "destination_address_prefix", null)
  destination_address_prefixes     = lookup(each.value, "destination_address_prefixes", null)

  # Support ASG references
  source_application_security_group_ids      = lookup(each.value, "source_application_security_group_ids", null)
  destination_application_security_group_ids = lookup(each.value, "destination_application_security_group_ids", null)
}

resource "azurerm_application_security_group" "asg" {
  for_each = {
    for asg_name, nic_ids in var.asg_nic_map :
    asg_name => nic_ids
    if !contains(keys(var.asg_id_overrides), asg_name)
  }

  name                = each.key
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_network_interface_application_security_group_association" "asg_attach" {
  for_each = {
    for pair in flatten([
      for asg_name, nic_ids in var.asg_nic_map : [
        for idx, nic_id in nic_ids : {
          key      = "${asg_name}-${idx}"
          asg_name = asg_name
          nic_id   = nic_id
        }
      ]
    ]) : pair.key => {
      asg_name = pair.asg_name
      nic_id   = pair.nic_id
    }
  }

  network_interface_id          = each.value.nic_id
  application_security_group_id = azurerm_application_security_group.asg[each.value.asg_name].id
}
