#-----------------
# Code variables
#-----------------

// azurerm_site_recovery_replicated_vm variables

variable "name" {
  description = "The name of the recovery plan."
  type        = string
  default     = "recover-plan"
}

variable "recovery_vault_id" {
  description = "The ID of the Recovery Services Vault."
  type        = string
  #default     = azurerm_recovery_services_vault.secondary_vault.id
}

variable "source_recovery_fabric_id" {
  description = "The ID of the source recovery fabric."
  type        = string
  #default     = azurerm_site_recovery_fabric.primary_fabric.id
}

variable "target_recovery_fabric_id" {
  description = "The ID of the target recovery fabric."
  type        = string
  #default     = azurerm_site_recovery_fabric.secondary_fabric.id
}

variable "post_action_name" {
  description = "The name of the post-action script."
  type        = string
  default     = "script"
}

variable "post_action_type" {
  description = "The type of the post-action, typically 'AutomationRunbookActionDetails'."
  type        = string
  default     = "AutomationRunbookActionDetails"
}

# variable "runbook_id" {
#   description = "The ID of the automation runbook to execute as a post-action."
#   type        = string
#   #default     = azurerm_automation_runbook.runbook_app_gateway.id
# }

variable "fabric_location" {
  description = "The location of the fabric, typically 'Primary'."
  type        = string
  default     = "Primary"
}

variable "fail_over_types" {
  description = "A list of failover types, such as 'TestFailover', 'PlannedFailover', and 'UnplannedFailover'."
  type        = list(string)
  default     = [
    "TestFailover", "PlannedFailover", "UnplannedFailover"
  ]
}

variable "fail_over_directions" {
  description = "A list of failover directions, such as 'PrimaryToRecovery' and 'RecoveryToPrimary'."
  type        = list(string)
  default     = [
    "PrimaryToRecovery", "RecoveryToPrimary"
  ]
}

variable "vm_names" {
  description = "List of VM names."
  type        = list(string)
}

variable "vm_ids" {
  description = "List of VM IDs."
  type        = list(string)
}

variable "nic_ids" {
  description = "List of network interface IDs."
  type        = list(string)
}

variable "os_disk_ids" {
  description = "List of OS disk IDs for the VMs."
  type        = list(string)
}

variable "os_disk_target_disk_type" {
  description = "The type of the target OS disk."
  type        = string
  default     = "Premium_LRS"
}

variable "os_disk_target_replica_disk_type" {
  description = "The type of the target replica OS disk."
  type        = string
  default     = "Premium_LRS"
}

variable "managed_disk_ids" {
  description = "List of managed disk IDs for the VMs."
  type        = list(string)
}

variable "managed_disk_target_disk_types" {
  description = "List of target disk types for the managed disks."
  type        = list(string)
}

variable "managed_disk_target_replica_disk_types" {
  description = "List of target replica disk types for the managed disks."
  type        = list(string)
}

variable "dr_compute_cus_subnet_name" {
  description = "Name of the target subnet for disaster recovery."
  type        = string
}

variable "cache_storage_account_id" {
  description = "ID of the cache storage account."
  type        = string
}

variable "secondary_replication_vault_name" {
  description = "Name of the secondary replication vault."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the secondary resource group recovery service vault"
  type        = string
}

variable "target_resource_group_id" {
  description = "ID of the secondary resource group for the VM replication"
  type        = string
}

variable "target_availability_set_id" {
  description = "ID of the secondary availability set for VM replication"
  type        = string
}

variable "replication_policy_id" {
  description = "ID of the replication policy."
  type        = string
}

variable "primary_fabric_name" {
  description = "Name of the primary fabric."
  type        = string
}

variable "primary_protection_container_name" {
  description = "Name of the primary protection container."
  type        = string
}

variable "secondary_fabric_id" {
  description = "ID of the secondary fabric."
  type        = string
}

variable "secondary_protection_container_id" {
  description = "ID of the secondary protection container."
  type        = string
}