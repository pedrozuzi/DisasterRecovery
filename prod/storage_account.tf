resource "azurerm_storage_account" "primary_storage_account" {
  name                     = "primaryzuzicache001"
  location                 = azurerm_resource_group.rg_primary.location
  resource_group_name      = azurerm_resource_group.rg_primary.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}