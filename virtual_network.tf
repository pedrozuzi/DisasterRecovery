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

resource "azurerm_virtual_network_peering" "primary_vnet_to_secondary_vnet" {
  name                      = "primary_vnet_to_secondary_vnet"
  resource_group_name       = azurerm_resource_group.rg_primary.name
  virtual_network_name      = azurerm_virtual_network.primary_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.secondary_vnet.id
}

resource "azurerm_virtual_network_peering" "secondary_vnet_to_primary_vnet" {
  name                      = "secondary_vnet_to_primary_vnet"
  resource_group_name       = azurerm_resource_group.rg_secondary.name
  virtual_network_name      = azurerm_virtual_network.secondary_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.primary_vnet.id
}