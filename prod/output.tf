
output "primary_vnet_id" {
  value = azurerm_virtual_network.primary_vnet.id
}

output "cache_storage_account_id" {
  value = azurerm_storage_account.primary_storage_account.id
}

output "vm_app_ids" {
  value = module.vm_app.vm_ids
}

output "vm_app_vm_ids" {
  value = module.vm_app.vm_ids
}

output "vm_app_managed_disk_ids" {
  value = module.vm_app.managed_disk_ids
}

output "vm_app_managed_disk_types" {
  value = module.vm_app.managed_disk_types
}

output "vm_app_nic_ids" {
  value = module.vm_app.nic_ids
}

output "vm_app_os_disk_ids" {
  value = module.vm_app.os_disk_ids
}

output "vm_app_vm_names" {
  value = module.vm_app.vm_names
}



# output "vm_names" {
#   description = "Concatenated names of all Web and App VMs"
#   value       = join(", ", concat(module.vm_web[*].vm_name, module.vm_app[*].vm_name))
# }

# output "vm_managed_disk_types" {
#   description = "Concatenated managed disk types of all Web and App VMs"
#   value       = join(", ", concat(module.vm_web[*].vm_managed_disk_type, module.vm_app[*].vm_managed_disk_type))
# }

# output "vm_managed_disk_ids" {
#   value = concat(module.vm_web[*].vm_managed_disk_id, module.vm_app[*].vm_managed_disk_id)
# }

# output "vm_ids" {
#   value = concat(module.vm_web[*].vm_id, module.vm_app[*].vm_id)
# }

# output "vm_nic_ids" {
#   value = concat(module.vm_web[*].vm_nic_id, module.vm_app[*].vm_nic_id)
# }

# output "vm_os_disk_ids" {
#   value = concat(module.vm_web[*].vm_os_disk_id, module.vm_app[*].vm_os_disk_id)
# }
