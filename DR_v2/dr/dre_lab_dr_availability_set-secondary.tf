resource "azurerm_availability_set" "dre_team_secondary_availability_set_vm_app" {
  name                = "dre_team_secondary_availability_set_vm_app"
  location            = azurerm_resource_group.dre_team_rg_secondary_app.location
  resource_group_name = azurerm_resource_group.dre_team_rg_secondary_app.name
    
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

resource "azurerm_availability_set" "dre_team_secondary_availability_set_vm_web" {
  name                = "secondary_availability_set_vm_web"
  location            = azurerm_resource_group.dre_team_rg_secondary_web.location
  resource_group_name = azurerm_resource_group.dre_team_rg_secondary_web.name
    
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