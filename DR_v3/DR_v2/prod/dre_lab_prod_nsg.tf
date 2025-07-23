# ##Call module
# module "nsg_prod" {
#   source              = "../dre_team/modules/terraform-azurerm-network-nsg"
#   resource_group_name = azurerm_resource_group.dre_team_rg_primary_app.name
#   rules = [
#     {
#       name                                       = "allow-app1"
#       access                                     = "Allow"
#       direction                                  = "Inbound"
#       priority                                   = 100
#       protocol                                   = "Tcp"
#       source_port_range                          = "*"
#       destination_port_range                     = "443"
#       #source_address_prefix                      = "10.0.0.0/8"
#       #destination_address_prefix                 = "10.0.0.0/8"
#       source_application_security_group_ids      = [azurerm_application_security_group.dre_team_app_asg.id]
#       destination_application_security_group_ids = [azurerm_application_security_group.dre_team_app_asg.id]
#     }
#   ]
#   nsg_type = "vm"
#   naming_convention = {
#     os      = "windows"
#     prj     = "app"
#     firm_id = "123"
#     env     = "prd"
#     reg     = "eus2"
#     app     = "frontend"
#     no      = 1
#     nic_no  = 0
#   }

#     depends_on = [
#     azurerm_application_security_group.dre_team_app_asg]
# }
