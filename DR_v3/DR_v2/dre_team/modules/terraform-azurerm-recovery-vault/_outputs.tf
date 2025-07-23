output "recovery_vault_id" {
  description = "The ID of the Recovery Vault"
  value       = azurerm_recovery_services_vault.vault.id
}

output "recovery_vault_name" {
  description = "The name of the Recovery Vault"
  value       = azurerm_recovery_services_vault.vault.name
}
output "recovery_vault_rg" {
  description = "The name of the Recovery Vault Resource Group"
  value = azurerm_recovery_services_vault.vault.resource_group_name
}

output "recovery_vault_location" {
  description = "The name of the Recovery Vault Resource Group"
  value = azurerm_recovery_services_vault.vault.location
}
