resource "azurerm_availability_set" "secondary_availability_set_vm_app" {
  name                = "secondary_availability_set_vm_app"
  location            = azurerm_resource_group.rg_secondary_app.location
  resource_group_name = azurerm_resource_group.rg_secondary_app.name
}