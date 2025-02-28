resource "azurerm_virtual_network" "primary_vnet" {
  name                = var.primary_vnet_name
  location            = azurerm_resource_group.rg_primary.location
  resource_group_name = azurerm_resource_group.rg_primary.name
  address_space       = var.primary_vnet_address_space
}

resource "azurerm_virtual_network_peering" "primary_vnet_to_secondary_vnet" {
  name                      = "primary_vnet_to_secondary_vnet"
  resource_group_name       = azurerm_resource_group.rg_primary.name
  virtual_network_name      = azurerm_virtual_network.primary_vnet.name
  remote_virtual_network_id = data.terraform_remote_state.dr.outputs.secondary_vnet_id
}