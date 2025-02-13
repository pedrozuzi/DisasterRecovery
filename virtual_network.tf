resource "azurerm_virtual_network" "primary_vnet" {
  name                = var.primary_vnet_name
  location            = azurerm_resource_group.rg_primary.location
  resource_group_name = azurerm_resource_group.rg_primary.name
  address_space       = var.primary_vnet_address_space
}

resource "azurerm_virtual_network" "secondary_vnet" {
  name                = var.secondary_vnet_name
  location            = azurerm_resource_group.rg_secondary.location
  resource_group_name = azurerm_resource_group.rg_secondary.name
  address_space       = var.secondary_vnet_address_space
}