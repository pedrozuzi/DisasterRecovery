
output "primary_vnet_id" {
  value = azurerm_virtual_network.primary_vnet.id
}

output "cache_storage_account_id" {
  value = azurerm_storage_account.primary_storage_account.id
}


#### vm app #####
output "primary_app_gateway_id" {
  value = azurerm_application_gateway.primary_appgw.id
}

output "primary_app_gateway_name" {
  value = azurerm_application_gateway.primary_appgw.name
}

output "primary_app_gateway_resource_group_name" {
  value = azurerm_application_gateway.primary_appgw.resource_group_name
}



#### vm app #####
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

output "vm_app_disks_info" {
  value = module.vm_app.vm_disks_info
}



#### vm web #####
output "vm_web_ids" {
  value = module.vm_web.vm_ids
}

output "vm_web_vm_ids" {
  value = module.vm_web.vm_ids
}

output "vm_web_managed_disk_ids" {
  value = module.vm_web.managed_disk_ids
}

output "vm_web_managed_disk_types" {
  value = module.vm_web.managed_disk_types
}

output "vm_web_nic_ids" {
  value = module.vm_web.nic_ids
}

output "vm_web_os_disk_ids" {
  value = module.vm_web.os_disk_ids
}

output "vm_web_vm_names" {
  value = module.vm_web.vm_names
}

output "vm_web_disks_info" {
  value = module.vm_web.vm_disks_info
}
