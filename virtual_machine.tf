resource "azurerm_windows_virtual_machine" "primary_vm_app" {
  name                = var.primary_vm_app_name
  location            = azurerm_resource_group.rg_primary.location
  resource_group_name = azurerm_resource_group.rg_primary.name
  size                = "Standard_B2ms"
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  network_interface_ids = [
    azurerm_network_interface.primary_vm_app_nic.id,
  ]
  encryption_at_host_enabled = true
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-datacenter-gensecond"
    version   = "latest"
  }
}

resource "azurerm_windows_virtual_machine" "primary_vm_web" {
  name                = var.primary_vm_web_name
  location            = azurerm_resource_group.rg_primary.location
  resource_group_name = azurerm_resource_group.rg_primary.name
  size                = "Standard_B2ms"
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  network_interface_ids = [
    azurerm_network_interface.primary_vm_web_nic.id,
  ]
  encryption_at_host_enabled = true
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-datacenter-gensecond"
    version   = "latest"
  }
}

resource "azurerm_windows_virtual_machine" "primary_vm_db" {
  name                = var.primary_vm_db_name
  location            = azurerm_resource_group.rg_primary.location
  resource_group_name = azurerm_resource_group.rg_primary.name
  size                = "Standard_B2ms"
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  network_interface_ids = [
    azurerm_network_interface.primary_vm_db_nic.id,
  ]
  encryption_at_host_enabled = true
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "microsoftsqlserver"
    offer     = "sql2019-ws2019"
    sku       = "sqldev-gen2"
    version   = "latest"
  }
}

resource "azurerm_managed_disk" "vm_primary_data_disk1" {
  name                 = "${var.primary_vm_app_name}-disk1"
  location             = azurerm_resource_group.rg_primary.location
  resource_group_name  = azurerm_resource_group.rg_primary.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 20
}

resource "azurerm_virtual_machine_data_disk_attachment" "example" {
  managed_disk_id    = azurerm_managed_disk.vm_primary_data_disk1.id
  virtual_machine_id = azurerm_windows_virtual_machine.primary_vm_app.id
  lun                = "2"
  caching            = "ReadWrite"
}