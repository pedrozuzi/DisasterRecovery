# module "recovery_plan" {
#   source                    = "../test/dre_team/modules/terraform-azurerm-asr-replication-recovery-plan"
#   name                      = "${var.client_name}-plan"
#   source_recovery_fabric_id = module.dre_team_dr_replication_vault.primary_fabric_id
#   tag_app_group_email       = var.tag_app_group_email
#   recovery_vault_id         = module.dre_team_dr_replication_vault.recovery_vault_id
#   tag_support_group         = var.tag_support_group
#   tag_environment_type      = var.tag_environment_type
#   target_recovery_fabric_id = module.dre_team_dr_replication_vault.secondary_fabric_id
#   replicated_protected_items = module.dre_team_replication_vm_app.asr_replicated_vm_ids

#   #Combine both VM module outputs
#   # replicated_protected_items = concat(
#   #   module.replication_vm_app.asr_replicated_vm_ids,
#   #   module.replication_vm_web.asr_replicated_vm_ids
#   # )

# boot_post_actions = [
#     {
#       name                 = "asg_association"
#       type                 = "AutomationRunbookActionDetails"
#       runbook_id           = module.dre_team_asr_asg_association.azurerm_automation_runbook_id
#       fabric_location      = "Primary"
#       fail_over_types      = ["PlannedFailover", "UnplannedFailover"]
#       fail_over_directions = ["PrimaryToRecovery", "RecoveryToPrimary"]
#     }
#   ]
# }