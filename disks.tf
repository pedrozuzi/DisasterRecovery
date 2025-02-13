resource "azurerm_managed_disk" "primary_vm_app_os_disk" {
  name                 = "${var.primary_vm_app_name}-osdisk"
  location             = azurerm_resource_group.rg_primary.location
  resource_group_name  = azurerm_resource_group.rg_primary.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "127"
}