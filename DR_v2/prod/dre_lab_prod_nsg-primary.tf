resource "azurerm_network_security_group" "dre_team_primary_nsg" {
  name                = "dre_team_primary_nsg"
  location            = azurerm_resource_group.dre_team_rg_primary.location
  resource_group_name = azurerm_resource_group.dre_team_rg_primary.name

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