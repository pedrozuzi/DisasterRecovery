# Create Network Security Group and rule
resource "azurerm_network_security_group" "nsg" {
  name                = format("nsg-%s",
                          local.ngs_name)
  location            = var.location
  resource_group_name = var.resource_group_name  
  tags                = var.tags
}

resource "azurerm_network_security_rule" "rules" {
  for_each = {
      for index, rule in var.rules:
      rule.name => rule
  }

  name                        = each.value.name
  access                      = each.value.access
  direction                   = each.value.direction
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name

  source_application_security_group_ids = (
    lookup(each.value, "source_application_security_group_ids", null)
  )

  source_address_prefix = (
    lookup(each.value, "source_application_security_group_ids", null) == null ?
    lookup(each.value, "source_address_prefix", null) : null
  )

  destination_application_security_group_ids = (
    lookup(each.value, "destination_application_security_group_ids", null)
  )

  destination_address_prefix = (
    lookup(each.value, "destination_application_security_group_ids", null) == null ?
    lookup(each.value, "destination_address_prefix", null) : null
  )
}



# resource "azurerm_network_security_rule" "rules" {
#   for_each = {
#       for index, rule in var.rules:
#       rule.name => rule
#   }
#   name                        = each.value.name
#   access                      = each.value.access
#   destination_address_prefix  = each.value.destination_address_prefix
#   destination_port_range      = each.value.destination_port_range
#   direction                   = each.value.direction
#   priority                    = each.value.priority
#   protocol                    = each.value.protocol
#   source_address_prefix       = each.value.source_address_prefix
#   source_port_range           = each.value.source_port_range
#   resource_group_name         = var.resource_group_name
#   network_security_group_name = azurerm_network_security_group.nsg.name
# }