output "vms" {
  description = "List of VM resources that are created"
  value       = azurerm_linux_virtual_machine.rhel_vm
}

output "vm_ids" {
  description = "List of VM resource IDs that are created"
  value       = azurerm_linux_virtual_machine.rhel_vm.*.id
}

output "vm_names" {
  description = "List of VM names that are created"
  value       = azurerm_linux_virtual_machine.rhel_vm.*.name
}

output "vm_count" {
  description = "Number of VMs deployed"
  value       = var.vm_count
}

output "vm_ip_addresses" {
  description = "List of VM's private IP addresses"
  value       = azurerm_network_interface.network_interfaces.*.private_ip_address
}

output "vm_password" {
  description = "The password for the VM(s) created in the module (if multiple, one password is used for all)"
  value       = random_string.password.result
}

output "nics" {
  description = "List of NIC resources that are created"
  value       = azurerm_network_interface.network_interfaces
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

output "os_disk_ids" {
  description = "List of OS disk IDs for the VMs."
  value       = azurerm_linux_virtual_machine.rhel_vm[*].os_disk[0].id
}

output "os_disk_types" {
  description = "List of OS disk types for the VMs."
  value       = azurerm_linux_virtual_machine.rhel_vm[*].os_disk[0].storage_account_type
}

output "managed_disk_ids" {
  description = "List of managed disk IDs for the VMs."
  value       = azurerm_managed_disk.server_managed_disk[*].id
}

output "managed_disk_types" {
  description = "List of managed disk types for the VMs."
  value       = azurerm_managed_disk.server_managed_disk[*].storage_account_type
}