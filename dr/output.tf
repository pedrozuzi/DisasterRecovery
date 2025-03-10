
output "secondary_vnet_id" {
  value = azurerm_virtual_network.secondary_vnet.id
}

#### secondary PostgreSQL #####
output "secondary_postgresql_id" {
  value = azurerm_postgresql_flexible_server.secondary_flexdb.id
}

output "secondary_postgresql_name" {
  value = azurerm_postgresql_flexible_server.secondary_flexdb.name
}

output "secondary_postgresql_resource_group_name" {
  value = azurerm_postgresql_flexible_server.secondary_flexdb.resource_group_name
}


#### secondary gateway #####
output "secondary_app_gateway_id" {
  value = azurerm_application_gateway.secondary_appgw.id
}

output "secondary_app_gateway_name" {
  value = azurerm_application_gateway.secondary_appgw.name
}

output "secondary_app_gateway_resource_group_name" {
  value = azurerm_application_gateway.secondary_appgw.resource_group_name
}

#### secondary mssql #####
output "secondary_mssql_server_resource_group_name" {
  value = azurerm_mssql_server.sql_server_secondary.resource_group_name
}

output "secondary_mssql_server_name" {
  value = azurerm_mssql_server.sql_server_secondary.name
}

output "secondary_mssql_server_id" {
  value = azurerm_mssql_server.sql_server_secondary.id
}


# output "vm_app_asr_replicated_vm_ids" {
#   description = "List of IDs for the replicated VMs."
#   value       = module.replication_vm_app.asr_replicated_vm_ids
# }

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
