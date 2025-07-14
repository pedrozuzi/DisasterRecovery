resource "azurerm_user_assigned_identity" "dre_team_user_identity" {
  location            = azurerm_resource_group.dre_team_rg_secondary_automation.location
  name                = "dre_team_lab_dr_mgmt"
  resource_group_name = azurerm_resource_group.dre_team_rg_secondary_automation.name

   tags = {
    BUC             = var.tag_buc
    SupportGroup    = var.tag_support_group
    AppGroupEmail   = var.tag_app_group_email
    EnvironmentType = var.tag_environment_type
    CustomerCRMID   = var.tag_customer_crmid
    ExpirationDate  = "Never"
    Webhook         = "N/A"
  }
}