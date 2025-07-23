output "cache_storage_account_name" {
  description = "Name of the cache storage account"
  value       = azurerm_storage_account.primary.name
}

output "cache_storage_account_id" {
  description = "ID of the cache storage account"
  value       = azurerm_storage_account.primary.id
}

output "cache_storage_account_primary_blob_endpoint" {
  description = "Primary blob endpoint of the cache storage account"
  value       = azurerm_storage_account.primary.primary_blob_endpoint
}

output "secondary_replication_vault_name" {
  description = "The name of the Recovery Vault"
  value       = module.secondary_replication_vault.recovery_vault_name
}

output "secondary_replication_vault_id" {
  description = "The ID of the Recovery Vault"
  value       = module.secondary_replication_vault.recovery_vault_id
}

/*** Replication ***/

output "primary_fabric_name" {
  description = "Name of the primary region fabric"
  value       = azurerm_site_recovery_fabric.primary.name
}

output "primary_fabric_id" {
  description = "ID of the primary region fabric"
  value       = azurerm_site_recovery_fabric.primary.id
}

output "primary_protection_container_name" {
  description = "Name of the primary region protection container"
  value       = azurerm_site_recovery_protection_container.primary.name
}

output "primary_protection_container_id" {
  description = "ID of the primary region protection container"
  value       = azurerm_site_recovery_protection_container.primary.id
}

output "secondary_fabric_name" {
  description = "Name of the secondary region fabric"
  value       = azurerm_site_recovery_fabric.secondary.name
}

output "secondary_fabric_id" {
  description = "ID of the secondary region fabric"
  value       = azurerm_site_recovery_fabric.secondary.id
}

output "secondary_protection_container_name" {
  description = "Name of the secondary region protection container"
  value       = azurerm_site_recovery_protection_container.secondary.name
}

output "secondary_protection_container_id" {
  description = "ID of the secondary region protection container"
  value       = azurerm_site_recovery_protection_container.secondary.id
}

output "replication_policy_name" {
  description = "Name of the replication policy"
  value       = azurerm_site_recovery_replication_policy.policy.name
}

output "replication_policy_id" {
  description = "ID of the replication policy"
  value       = azurerm_site_recovery_replication_policy.policy.id
}

output "container_mapping_name" {
  description = "Name of the container mapping"
  value       = azurerm_site_recovery_protection_container_mapping.container_mapping.name
}

output "container_mapping_id" {
  description = "ID of the container mapping"
  value       = azurerm_site_recovery_protection_container_mapping.container_mapping.id
}

output "network_mapping_id" {
  description = "ID of the recovery network mapping"
  value       = azurerm_site_recovery_network_mapping.recovery_mapping.id
}

output "network_mapping_name" {
  description = "Name of the recovery network mapping"
  value       = azurerm_site_recovery_network_mapping.recovery_mapping.name
}

# Vault outputs

output "recovery_vault_id" {
  value = module.secondary_replication_vault.recovery_vault_id
}
output "recovery_vault_name" {
  value = module.secondary_replication_vault.recovery_vault_name
}

output "recovery_vault_location" {
  value = module.secondary_replication_vault.recovery_vault_location
}

output "recovery_vault_rg" {
  value = module.secondary_replication_vault.recovery_vault_rg
}
