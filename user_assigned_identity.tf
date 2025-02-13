resource "azurerm_user_assigned_identity" "user_identity" {
  location            = azurerm_resource_group.rg_secondary.location
  name                = "automation_account_identity"
  resource_group_name = azurerm_resource_group.rg_secondary.name
}