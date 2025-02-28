
resource "azurerm_automation_account" "automatin_account" {
  name                = "dr-account"
  location            = azurerm_resource_group.rg_secondary.location
  resource_group_name = azurerm_resource_group.rg_secondary.name
  sku_name            = "Basic"

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.user_identity.id]
  }
}

resource "azurerm_role_assignment" "automatin_account_role_assignment" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.user_identity.principal_id
}

resource "azurerm_automation_variable_string" "appgw_subscription_id" {
  name                    = "appgw_subscription_id"
  resource_group_name     = azurerm_resource_group.rg_secondary.name
  automation_account_name = azurerm_automation_account.automatin_account.name
  value                   = data.azurerm_subscription.primary.subscription_id
}

resource "azurerm_automation_variable_string" "appgw_name_start" {
  name                    = "appgw_name_start"
  resource_group_name     = azurerm_resource_group.rg_secondary.name
  automation_account_name = azurerm_automation_account.automatin_account.name
  value                   = azurerm_application_gateway.secondary_appgw.name
}

resource "azurerm_automation_variable_string" "appgw_rg_name_start" {
  name                    = "appgw_rg_name_start"
  resource_group_name     = azurerm_resource_group.rg_secondary.name
  automation_account_name = azurerm_automation_account.automatin_account.name
  value                   = azurerm_application_gateway.secondary_appgw.resource_group_name
}

resource "azurerm_automation_variable_string" "appgw_name_stop" {
  name                    = "appgw_name_stop"
  resource_group_name     = azurerm_resource_group.rg_secondary.name
  automation_account_name = azurerm_automation_account.automatin_account.name
  value                   = data.terraform_remote_state.prod.outputs.primary_app_gateway_name
}

resource "azurerm_automation_variable_string" "appgw_rg_name_stop" {
  name                    = "appgw_rg_name_stop"
  resource_group_name     = azurerm_resource_group.rg_secondary.name
  automation_account_name = azurerm_automation_account.automatin_account.name
  value                   = data.terraform_remote_state.prod.outputs.primary_app_gateway_resource_group_name
}