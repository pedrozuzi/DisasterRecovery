resource "azurerm_recovery_services_vault" "primary_vault" {
  name                = var.primary_vault_name
  location            = azurerm_resource_group.rg_primary.location
  resource_group_name = azurerm_resource_group.rg_primary.name
  sku                 = "Standard"

  soft_delete_enabled = false
}

resource "azurerm_recovery_services_vault" "secondary_vault" {
  name                = var.secondary_vault_name
  location            = azurerm_resource_group.rg_secondary.location
  resource_group_name = azurerm_resource_group.rg_secondary.name
  sku                 = "Standard"

  soft_delete_enabled = false
}