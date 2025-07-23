
output "azurerm_automation_runbook_id" {
  description = "ID of the Runbook."
  value       = azurerm_automation_runbook.asg_association.id
}