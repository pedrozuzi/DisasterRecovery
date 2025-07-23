# module "dre_team_dr_automation_account" {
#   source                   = "vlmaztform01.fisdev.local/FIS-Cloud-Services/automation-account/azurerm"
#   version                  = "0.1.6"
#   resource_group_name      = azurerm_resource_group.dre_team_rg_secondary_automation.name
#   region                   = var.dre_secondary_region
#   automation_account_name  = "${lower(var.client_name)}-eus2-cus"
#   automation_identity_type = "UserAssigned"
#   automation_identity_ids  = [azurerm_user_assigned_identity.dre_team_user_identity.id]
#   tag_support_group        = var.tag_support_group
#   tag_app_group_email      = var.tag_app_group_email
#   tag_environment_type     = var.tag_environment_type
# }

# /*** Runbooks ***/
# module "dre_team_asr_asg_association" {
#   source                  = "../test/dre_team/modules/terraform-azurerm-asr-runbook-asg-association"
#   resource_group_name     = azurerm_resource_group.dre_team_rg_secondary_automation.name
#   region                  = var.dre_secondary_region
#   automation_account_name = module.dre_team_dr_automation_account.automation_account_name
#   subscription_id         = data.azurerm_subscription.primary.subscription_id
#   client_id               = azurerm_user_assigned_identity.dre_team_user_identity.client_id
#   tag_support_group       = var.tag_support_group
#   tag_app_group_email     = var.tag_app_group_email
#   tag_environment_type    = var.tag_environment_type
# }

# module "dre_team_asr_appgw_start" {
#   source                  = "vlmaztform01.fisdev.local/FIS-Cloud-Services/asr-runbook-appgw-start/azurerm"
#   version                 = "0.1.7"
#   resource_group_name     = azurerm_resource_group.dre_team_rg_secondary_automation.name
#   region                  = var.dre_secondary_region
#   automation_account_name = module.dre_team_dr_automation_account.automation_account_name
#   subscription_id         = data.azurerm_subscription.primary.subscription_id
#   appgw_name_start        = "test"
#   appgw_name_stop         = "test"
#   appgw_rg_name_start     = "test"
#   appgw_rg_name_stop      = "test"
#   client_id               = azurerm_user_assigned_identity.dre_team_user_identity.client_id
#   tag_support_group       = var.tag_support_group
#   tag_app_group_email     = var.tag_app_group_email
#   tag_environment_type    = var.tag_environment_type
# }

# module "dre_team_asr_initiate_jit" {
#   source                  = "vlmaztform01.fisdev.local/FIS-Cloud-Services/asr-runbook-initiate-jit/azurerm"
#   version                 = "0.2.2"
#   resource_group_name     = azurerm_resource_group.dre_team_rg_secondary_automation.name
#   region                  = var.dre_secondary_region
#   automation_account_name = module.dre_team_dr_automation_account.automation_account_name
#   subscription_id         = data.azurerm_subscription.primary.subscription_id
#   client_id               = azurerm_user_assigned_identity.dre_team_user_identity.client_id
#   tag_support_group       = var.tag_support_group
#   tag_app_group_email     = var.tag_app_group_email
#   tag_environment_type    = var.tag_environment_type
# }