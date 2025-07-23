# App ASG
# resource "azurerm_application_security_group" "dre_team_app_asg" {
#   name                = lower("dre_team_asg_app")
#   location            = var.dre_primary_region
#   resource_group_name = azurerm_resource_group.dre_team_rg_primary_app.name
# }

# # Web ASG
# resource "azurerm_application_security_group" "dre_team_web_asg" {
#   name                = lower("dre_team_asg_web")
#   location            = var.dre_primary_region
#   resource_group_name = azurerm_resource_group.dre_team_rg_primary_web.name
# }