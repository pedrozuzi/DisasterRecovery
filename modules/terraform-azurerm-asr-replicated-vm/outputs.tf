#------------------------------------------------------------
# Output values to be used by other Terraform configurations
#------------------------------------------------------------

output "asr_replicated_vm_ids" {
  description = "List of IDs for the replicated VMs."
  value       = azurerm_site_recovery_replicated_vm.asr_replicated_vm[*].id
}

# output "recovery_network_id" {
#   description = "ID of the recovery virtual network"
#   value       = azurerm_virtual_network.recovery.id
# }

# output "recovery_subnet_id" {
#   description = "ID of the recovery subnet"
#   value       = azurerm_subnet.recovery.id
# }

# output "secondary_replication_vault_location" {
#   description = "Location of the Recovery Vault"
#   value       = module.secondary_replication_vault.recovery_vault_location
# }

# output "network_mapping_name" {
#   description = "Name of the recovery network mapping"
#   value       = azurerm_site_recovery_network_mapping.recovery_mapping.name
# }