module "recovery_plan" {
  source                     = "../../DisasterRecovery/modules/terraform-azurerm-asr-replication-recovery-plan"
  name                       = "recover-plan"
  source_recovery_fabric_id  = azurerm_site_recovery_fabric.primary_fabric.id
  tag_app_group_email        = "test"
  recovery_vault_id          = azurerm_recovery_services_vault.secondary_vault.id
  tag_support_group          = "test"
  tag_environment_type       = "test"
  target_recovery_fabric_id  = azurerm_site_recovery_fabric.secondary_fabric.id
  #replicated_protected_items = module.replication_vm_app.asr_replicated_vm_ids

  #Combine both VM module outputs
  replicated_protected_items = concat(
    module.replication_vm_app.asr_replicated_vm_ids,
    module.replication_vm_web.asr_replicated_vm_ids
  )

  boot_post_actions = [
    {
      name                 = "appGw_Start"
      type                 = "AutomationRunbookActionDetails"
      runbook_id           = azurerm_automation_runbook.runbook_app_gateway.id
      fabric_location      = "Primary"
      fail_over_types      = ["PlannedFailover", "UnplannedFailover"]
      fail_over_directions = ["PrimaryToRecovery", "RecoveryToPrimary"]
    }
  ]
}


# resource "azurerm_site_recovery_replication_recovery_plan" "replication_recovery_plan" {
#   name                      = "recover-plan"
#   recovery_vault_id         = azurerm_recovery_services_vault.secondary_vault.id
#   source_recovery_fabric_id = azurerm_site_recovery_fabric.primary_fabric.id
#   target_recovery_fabric_id = azurerm_site_recovery_fabric.secondary_fabric.id

#   shutdown_recovery_group {}

#   failover_recovery_group {

#     pre_action {
#       name            = "script"
#       type            = "AutomationRunbookActionDetails"
#       runbook_id      = azurerm_automation_runbook.runbook_app_gateway.id
#       fabric_location = "Primary"
#       fail_over_types = [
#         "TestFailover", "PlannedFailover", "UnplannedFailover"
#       ]
#       fail_over_directions = [
#         "PrimaryToRecovery", "RecoveryToPrimary"
#       ]
#     }
#   }

#   boot_recovery_group {
#     replicated_protected_items = [azurerm_site_recovery_replicated_vm.vm_web_replication.id,
#     azurerm_site_recovery_replicated_vm.vm_db_replication.id]

#     post_action {
#       name            = "script"
#       type            = "AutomationRunbookActionDetails"
#       runbook_id      = azurerm_automation_runbook.runbook_app_gateway.id
#       fabric_location = "Primary"
#       fail_over_types = [
#         "TestFailover", "PlannedFailover", "UnplannedFailover"
#       ]
#       fail_over_directions = [
#         "PrimaryToRecovery", "RecoveryToPrimary"
#       ]
#     }

#   }
# }