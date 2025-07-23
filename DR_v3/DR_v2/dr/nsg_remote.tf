module "nsg_remote" {
  source              = "../dre_team/modules/nsg_module"
  resource_group_name = azurerm_resource_group.dre_team_rg_secondary.name
  location            = azurerm_resource_group.dre_team_rg_secondary.location
  nsg_type            = "vm"

  # Use existing NSG and only create rules
  existing_nsg_name           = azurerm_network_security_group.dre_team_secondary_nsg.name
  existing_nsg_id             = azurerm_network_security_group.dre_team_secondary_nsg.id
  existing_nsg_resource_group = azurerm_network_security_group.dre_team_secondary_nsg.resource_group_name

  asg_nic_map = {
    "asg-app" = []
    "asg-web" = []
  }


  naming_convention = {
    os      = "linux"
    prj     = "web"
    firm_id = "123"
    env     = "dr"
    reg     = "eus2"
    app     = "frontend"
    no      = 1
    nic_no  = 0
  }

  use_remote_rules = false

  rules = local.dr_rules

 }
