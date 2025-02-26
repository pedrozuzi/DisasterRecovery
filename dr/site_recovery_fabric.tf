resource "azurerm_site_recovery_fabric" "primary_fabric" {
  name                = "primary-fabric"
  resource_group_name = azurerm_resource_group.rg_secondary.name
  recovery_vault_name = azurerm_recovery_services_vault.secondary_vault.name
  location            = var.primary_location
}

resource "azurerm_site_recovery_fabric" "secondary_fabric" {
  name                = "secondary-fabric"
  resource_group_name = azurerm_resource_group.rg_secondary.name
  recovery_vault_name = azurerm_recovery_services_vault.secondary_vault.name
  location            = azurerm_resource_group.rg_secondary.location
}