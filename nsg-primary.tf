resource "azurerm_network_security_group" "primary_nsg" {
  name                = "primary_nsg"
  location            = azurerm_resource_group.rg_primary.location
  resource_group_name = azurerm_resource_group.rg_primary.name
}