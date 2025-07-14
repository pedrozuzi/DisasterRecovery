output "vm_ids" {
  description = "List of VM resource IDs that are created"
  value       = azurerm_windows_virtual_machine.windows.*.id
}

output "vm_names" {
  description = "List of VM names that are created"
  value       = azurerm_windows_virtual_machine.windows.*.name
}

output "vm_ip_addresses" {
  description = "List of VM's private IP addresses"
  value       = azurerm_network_interface.network_interfaces.*.private_ip_address
}

output "vm_password" {
  description = "The password for the VM(s) created in the module (if multiple, one password is used for all)"
  value       = random_string.password.result
}

output "vm_count" {
  description = "The number of VMs created (output to reference that doesn't depend on 'computed')"
  value       = var.vm_count
}

output "nic_ids" {
  description = "List of NIC ids that are created"
  value       = azurerm_network_interface.network_interfaces.*.id
}

output "nic_names" {
  description = "List of NIC names that are created"
  value       = azurerm_network_interface.network_interfaces.*.name
}

output "nic_ip_config_names" {
  description = "List of NIC IP configuration names (1 per NIC)"
  value       = azurerm_network_interface.network_interfaces.*.ip_configuration.0.name
}

output "vm_principal_ids" {
  description = "List of VM principal ids which contain the Managed Service Identity information for the VMs"
  value       = azurerm_windows_virtual_machine.windows.*.identity.0.principal_id
}

output "os_disk_ids" {
  description = "List of OS disk IDs for the VMs."
  value       = azurerm_windows_virtual_machine.windows[*].os_disk[0].id
}

output "os_disk_types" {
  description = "List of OS disk types for the VMs."
  value       = azurerm_windows_virtual_machine.windows[*].os_disk[0].storage_account_type
}

output "managed_disk_ids" {
  description = "List of managed disk IDs for the VMs."
  value       = azurerm_managed_disk.server_managed_disk[*].id
}

output "managed_disk_types" {
  description = "List of managed disk types for the VMs."
  value       = azurerm_managed_disk.server_managed_disk[*].storage_account_type
}

output "vm_disks_info" {
  value = [
    for idx, vm in azurerm_windows_virtual_machine.windows : {
      vm_name    = vm.name
      os_disk_id = vm.os_disk[0].id
      data_disk_ids = [
        for disk in azurerm_managed_disk.server_managed_disk :
        disk.id if startswith(disk.name, "${vm.name}-disk-")
      ]
    }
  ]
}

output "vm_resource_group_name" {
  description = "Resource group name where VMs are deployed"
  value       = azurerm_windows_virtual_machine.windows[0].resource_group_name
}

output "vm_location" {
  description = "Location of the VMs"
  value       = azurerm_windows_virtual_machine.windows[0].location
}

output "vm_availability_set_id" {
  description = "Availability Set ID (if used)"
  value       = azurerm_windows_virtual_machine.windows[0].availability_set_id
}

output "vm_zones" {
  description = "Availability zones of the VMs"
  value       = azurerm_windows_virtual_machine.windows[*].zone
}

output "vm_sizes" {
  description = "List of VM sizes that are created"
  value       = azurerm_windows_virtual_machine.windows[*].size
}