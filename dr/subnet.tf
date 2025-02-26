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

resource "azurerm_subnet" "secondary_snet_postgre" {
  name                 = var.secondary_snet_postgre
  resource_group_name  = azurerm_resource_group.rg_secondary.name
  virtual_network_name = azurerm_virtual_network.secondary_vnet.name
  address_prefixes     = var.secondary_snet_postgre_address_space

  delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}