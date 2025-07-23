module "nsg_local" {
  source              = "../dre_team/modules/nsg_module"
  resource_group_name = azurerm_resource_group.dre_team_rg_primary_app.name
  location            = azurerm_resource_group.dre_team_rg_primary_app.location
  nsg_type            = "vm"

  # Use existing NSG and only create rules
  existing_nsg_name           = azurerm_network_security_group.dre_team_primary_nsg.name
  existing_nsg_id             = azurerm_network_security_group.dre_team_primary_nsg.id
  existing_nsg_resource_group = azurerm_network_security_group.dre_team_primary_nsg.resource_group_name

  naming_convention = {
    os      = "linux"
    prj     = "web"
    firm_id = "123"
    env     = "prod"
    reg     = "eus"
    app     = "frontend"
    no      = 1
    nic_no  = 0
  }

  use_remote_rules = false

  asg_nic_map = {
    "asg-web" = module.dre_team_vm_web.nic_ids
    "asg-app" = module.dre_team_vm_app_2.nic_ids
  }

  rules = local.app_nsg_rules
}
