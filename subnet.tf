resource "azurerm_subnet" "primary_snet_app" {
  name                 = var.primary_snet_app_name
  resource_group_name  = azurerm_resource_group.rg_primary.name
  virtual_network_name = azurerm_virtual_network.primary_vnet.name
  address_prefixes     = var.primary_snet_app_address_space
}

resource "azurerm_subnet" "primary_snet_db" {
  name                 = var.primary_snet_db_name
  resource_group_name  = azurerm_resource_group.rg_primary.name
  virtual_network_name = azurerm_virtual_network.primary_vnet.name
  address_prefixes     = var.primary_snet_db_address_space
}

resource "azurerm_subnet" "primary_snet_app_gateway" {
  name                 = var.primary_snet_app_gateway
  resource_group_name  = azurerm_resource_group.rg_primary.name
  virtual_network_name = azurerm_virtual_network.primary_vnet.name
  address_prefixes     = var.primary_snet_app_gateway_address_space
}


resource "azurerm_subnet" "secondary_snet_app" {
  name                 = var.secondary_snet_app_name
  resource_group_name  = azurerm_resource_group.rg_secondary.name
  virtual_network_name = azurerm_virtual_network.secondary_vnet.name
  address_prefixes     = var.secondary_snet_app_address_space
}

resource "azurerm_subnet" "secondary_snet_db" {
  name                 = var.secondary_snet_db_name
  resource_group_name  = azurerm_resource_group.rg_secondary.name
  virtual_network_name = azurerm_virtual_network.secondary_vnet.name
  address_prefixes     = var.secondary_snet_db_address_space
}

resource "azurerm_subnet" "secondary_snet_app_gateway" {
  name                 = var.secondary_snet_app_gateway
  resource_group_name  = azurerm_resource_group.rg_secondary.name
  virtual_network_name = azurerm_virtual_network.secondary_vnet.name
  address_prefixes     = var.secondary_snet_app_gateway_address_space
}