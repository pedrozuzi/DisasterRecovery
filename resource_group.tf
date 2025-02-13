resource "azurerm_resource_group" "rg_primary" {
  name     = var.rg_primary_name
  location = var.rg_primary_location
}

resource "azurerm_resource_group" "rg_secondary" {
  name     = var.rg_secondary_name
  location = var.rg_secondary_location
}