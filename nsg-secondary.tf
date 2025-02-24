resource "azurerm_network_security_group" "secondary_nsg" {
  name                = "secondary_nsg"
  location            = azurerm_resource_group.rg_secondary.location
  resource_group_name = azurerm_resource_group.rg_secondary.name
}