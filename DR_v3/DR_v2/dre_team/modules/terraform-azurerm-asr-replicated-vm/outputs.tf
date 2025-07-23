#------------------------------------------------------------
# Output values to be used by other Terraform configurations
#------------------------------------------------------------

output "asr_replicated_vm_ids" {
  description = "List of IDs for the replicated VMs."
  value       = azurerm_site_recovery_replicated_vm.asr_replicated_vm[*].id
}