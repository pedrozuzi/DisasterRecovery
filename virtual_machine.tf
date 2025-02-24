# resource "azurerm_windows_virtual_machine" "primary_vm_app" {
#   name                = var.primary_vm_app_name
#   location            = azurerm_resource_group.rg_primary.location
#   resource_group_name = azurerm_resource_group.rg_primary.name
#   size                = "Standard_B2ms"
#   admin_username      = var.admin_username
#   admin_password      = var.admin_password

#   network_interface_ids = [
#     azurerm_network_interface.primary_vm_app_nic.id,
#   ]
#   encryption_at_host_enabled = true
#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "MicrosoftWindowsServer"
#     offer     = "WindowsServer"
#     sku       = "2019-datacenter-gensecond"
#     version   = "latest"
#   }
# }

# resource "azurerm_windows_virtual_machine" "primary_vm_web" {
#   name                = var.primary_vm_web_name
#   location            = azurerm_resource_group.rg_primary.location
#   resource_group_name = azurerm_resource_group.rg_primary.name
#   size                = "Standard_B2ms"
#   admin_username      = var.admin_username
#   admin_password      = var.admin_password

#   network_interface_ids = [
#     azurerm_network_interface.primary_vm_web_nic.id,
#   ]
#   encryption_at_host_enabled = true
#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "MicrosoftWindowsServer"
#     offer     = "WindowsServer"
#     sku       = "2019-datacenter-gensecond"
#     version   = "latest"
#   }
# }

# resource "azurerm_windows_virtual_machine" "primary_vm_db" {
#   name                = var.primary_vm_db_name
#   location            = azurerm_resource_group.rg_primary.location
#   resource_group_name = azurerm_resource_group.rg_primary.name
#   size                = "Standard_B2ms"
#   admin_username      = var.admin_username
#   admin_password      = var.admin_password

#   network_interface_ids = [
#     azurerm_network_interface.primary_vm_db_nic.id,
#   ]
#   encryption_at_host_enabled = true
#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "microsoftsqlserver"
#     offer     = "sql2019-ws2019"
#     sku       = "sqldev-gen2"
#     version   = "latest"
#   }
# }

# resource "azurerm_managed_disk" "vm_primary_data_disk1" {
#   name                 = "${var.primary_vm_app_name}-disk1"
#   location             = azurerm_resource_group.rg_primary.location
#   resource_group_name  = azurerm_resource_group.rg_primary.name
#   storage_account_type = "Standard_LRS"
#   create_option        = "Empty"
#   disk_size_gb         = 20
# }

# resource "azurerm_virtual_machine_data_disk_attachment" "example" {
#   managed_disk_id    = azurerm_managed_disk.vm_primary_data_disk1.id
#   virtual_machine_id = azurerm_windows_virtual_machine.primary_vm_app.id
#   lun                = "2"
#   caching            = "ReadWrite"
# }


# module "vm_web" {
#   source                  = "../../Terraform/DisasterRecovery/modules/terraform-azurerm-windows-vm"
#   resource_group_name     = azurerm_resource_group.rg_primary_web.name
#   region                  = azurerm_resource_group.rg_primary_web.location
#   subnet_id               = azurerm_subnet.primary_snet_app.id
#   nsg_id                  = azurerm_network_security_group.primary_nsg.id
#   hostname                = var.primary_vm_web_name
#   vm_count                = 1
#   vm_size                 = "Standard_B2ms"
#   vm_image_id             = "/subscriptions/d0eff89d-ff78-4c52-be45-e46370c50d94/resourceGroups/rg-images/providers/Microsoft.Compute/galleries/win2019/images/image-definition-standard/versions/0.0.1"
#   vm_storage_os_disk_type = "Standard_LRS"
#   vm_storage_os_disk_size = "128"
#   vm_timezone             = "Eastern Standard Time"
#   tag_environment_type    = "test"
#   tag_maintenance_window  = ["test"]
#   tag_npi                 = "test"
#   tag_solution_central_id = "test"
#   tag_app_group_email     = "test"
#   tag_tier                = "test"
#   tag_description         = "test"
#   tag_on_hours            = ["test"]
#   tag_expiration_date     = "test"
#   tag_sla                 = "test"
#   tag_webhook             = "test"
#   tag_support_group       = "test"

# }

module "vm_app" {
  source                  = "../../Terraform/DisasterRecovery/modules/terraform-azurerm-windows-vm"
  resource_group_name     = azurerm_resource_group.rg_primary_app.name
  region                  = azurerm_resource_group.rg_primary_app.location
  subnet_id               = azurerm_subnet.primary_snet_app.id
  nsg_id                  = azurerm_network_security_group.primary_nsg.id
  hostname                = var.primary_vm_app_name
  managed_disk_sizes      = [ "128", "120" ]
  vm_count                = 1
  vm_size                 = "Standard_B2ms"
  vm_image_id             = "/subscriptions/d0eff89d-ff78-4c52-be45-e46370c50d94/resourceGroups/rg-images/providers/Microsoft.Compute/galleries/win2019/images/image-definition-standard/versions/0.0.1"
  vm_storage_os_disk_type = "Standard_LRS"
  vm_storage_os_disk_size = "128"
  vm_timezone             = "Eastern Standard Time"
  tag_environment_type    = "test"
  tag_maintenance_window  = ["test"]
  tag_npi                 = "test"
  tag_solution_central_id = "test"
  tag_app_group_email     = "test"
  tag_tier                = "test"
  tag_description         = "test"
  tag_on_hours            = ["test"]
  tag_expiration_date     = "test"
  tag_sla                 = "test"
  tag_webhook             = "test"
  tag_support_group       = "test"

}