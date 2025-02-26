resource "azurerm_site_recovery_protection_container" "primary_protection_container" {
  name                 = "primary-protection-container"
  resource_group_name  = azurerm_resource_group.rg_secondary.name
  recovery_vault_name  = azurerm_recovery_services_vault.secondary_vault.name
  recovery_fabric_name = azurerm_site_recovery_fabric.primary_fabric.name
}

resource "azurerm_site_recovery_protection_container" "secondary_protection_container" {
  name                 = "secondary-protection-container"
  resource_group_name  = azurerm_resource_group.rg_secondary.name
  recovery_vault_name  = azurerm_recovery_services_vault.secondary_vault.name
  recovery_fabric_name = azurerm_site_recovery_fabric.secondary_fabric.name
}