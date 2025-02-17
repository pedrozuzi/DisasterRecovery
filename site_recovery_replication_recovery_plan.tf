resource "azurerm_site_recovery_replication_recovery_plan" "replication_recovery_plan" {
  name                      = "recover-plan"
  recovery_vault_id         = azurerm_recovery_services_vault.secondary_vault.id
  source_recovery_fabric_id = azurerm_site_recovery_fabric.primary_fabric.id
  target_recovery_fabric_id = azurerm_site_recovery_fabric.secondary_fabric.id

  shutdown_recovery_group {}

  failover_recovery_group {
  }

  boot_recovery_group {
    replicated_protected_items = [azurerm_site_recovery_replicated_vm.vm_web_replication.id,
    azurerm_site_recovery_replicated_vm.vm_db_replication.id]

    post_action {
      name            = "script"
      type            = "AutomationRunbookActionDetails"
      runbook_id      = azurerm_automation_runbook.runbook_app_gateway.id
      fabric_location = "Primary"
      fail_over_types = [
        "TestFailover", "PlannedFailover", "UnplannedFailover"
      ]
      fail_over_directions = [
        "PrimaryToRecovery", "RecoveryToPrimary"
      ]
    }

  }
}