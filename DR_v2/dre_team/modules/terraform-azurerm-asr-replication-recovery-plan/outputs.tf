#------------------------------------------------------------
# Output values to be used by other Terraform configurations
#------------------------------------------------------------

output "asr_recovery_plan_name" {
  description = "The name of the recovery plan."
  value       = azurerm_site_recovery_replication_recovery_plan.asr_recovery_plan.name
}

output "asr_recovery_plan_id" {
  description = "The ID of the recovery plan."
  value       = azurerm_site_recovery_replication_recovery_plan.asr_recovery_plan.id
}