output "dre_team_primary_vnet_id" {
  value = azurerm_virtual_network.dre_team_primary_vnet.id
}

#### vm app #####
# output "dre_team_vm_app_ids" {
#   value = module.dre_team_vm_app.vm_ids
# }

# output "dre_team_vm_app_managed_disk_ids" {
#   value = module.dre_team_vm_app.managed_disk_ids
# }

# output "dre_team_vm_app_managed_disk_types" {
#   value = module.dre_team_vm_app.managed_disk_types
# }

# output "dre_team_vm_app_nic_ids" {
#   value = module.dre_team_vm_app.nic_ids
# }

# output "dre_team_vm_app_os_disk_ids" {
#   value = module.dre_team_vm_app.os_disk_ids
# }

# output "dre_team_vm_app_vm_names" {
#   value = module.dre_team_vm_app.vm_names
# }

# output "dre_team_vm_app_disks_info" {
#   value = module.dre_team_vm_app.vm_disks_info
# }

# output "dre_team_vm_app_sizes" {
#   value = module.dre_team_vm_app.vm_sizes
# }

#Resource Groups

output "dre_team_resource_group_primary_storage_name" {
  value = azurerm_resource_group.dre_team_rg_primary_storage.name
}

#Subnets
output "dre_team_primary_snet_app_id" {
  value = azurerm_subnet.dre_team_primary_snet_app.id
}
