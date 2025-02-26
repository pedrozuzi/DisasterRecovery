#-----------------
# Code variables
#-----------------

// azurerm_site_recovery_replication_recovery_plan variables

variable "name" {
  description = "The name of the recovery plan."
  type        = string
  default     = "recover-plan"
}

variable "recovery_vault_id" {
  description = "The ID of the Recovery Services Vault."
  type        = string
}

variable "source_recovery_fabric_id" {
  description = "The ID of the source recovery fabric."
  type        = string
}

variable "target_recovery_fabric_id" {
  description = "The ID of the target recovery fabric."
  type        = string
}

variable "replicated_protected_items" {
  description = "List of IDs for the replicated protected items, provided by the output of the replicated VM module."
  type        = list(string)
}

variable "pre_actions" {
  description = "List of pre-actions to be executed."
  type = list(object({
    name                 = string
    type                 = string
    runbook_id           = string
    fabric_location      = string
    fail_over_types      = list(string) // ["TestFailover", "PlannedFailover", "UnplannedFailover"]
    fail_over_directions = list(string) // e.g. ["PrimaryToRecovery", "RecoveryToPrimary"]
  }))
  default = []
}

variable "post_actions" {
  description = "List of post-actions to be executed."
  type = list(object({
    name                 = string
    type                 = string
    runbook_id           = string
    fabric_location      = string
    fail_over_types      = list(string) // ["TestFailover", "PlannedFailover", "UnplannedFailover"]
    fail_over_directions = list(string) // e.g. ["PrimaryToRecovery", "RecoveryToPrimary"]
  }))
  default = []
}