resource "azurerm_site_recovery_replication_recovery_plan" "asr_recovery_plan" {
  name                      = var.name
  recovery_vault_id         = var.recovery_vault_id
  source_recovery_fabric_id = var.source_recovery_fabric_id
  target_recovery_fabric_id = var.target_recovery_fabric_id

  shutdown_recovery_group {}

  failover_recovery_group {}

  boot_recovery_group {
    replicated_protected_items = var.replicated_protected_items

    dynamic "pre_action" {
      for_each = var.pre_actions
      content {
        name                 = pre_action.value.name
        type                 = pre_action.value.type
        runbook_id           = pre_action.value.runbook_id
        fabric_location      = pre_action.value.fabric_location
        fail_over_types      = pre_action.value.fail_over_types
        fail_over_directions = pre_action.value.fail_over_directions
      }
    }

    dynamic "post_action" {
      for_each = var.post_actions
      content {
        name                 = post_action.value.name
        type                 = post_action.value.type
        runbook_id           = post_action.value.runbook_id
        fabric_location      = post_action.value.fabric_location
        fail_over_types      = post_action.value.fail_over_types
        fail_over_directions = post_action.value.fail_over_directions
      }
    }
  }
}