variable "client_name" {
  description = "Name of the client to deploy with"
}

variable "primary_rg_name_storage" {
  description = "Name of the Resource Group in the Primary region with which to deploy the recovery cache Storage Account."
}

variable "secondary_rg_name_storage" {
  description = "Name of the Resource Group in the Secondary region with which to deploy the recovery cache Storage Account."
}

variable "dr_rg_name_recovery_vault" {
  description = "Name of the Resource Group in the DR region with which to deploy the Recovery Service Vault & supporting resources."
}

variable "primary_region" {
  description = "The primary region in which to target for DR"
}

variable "secondary_region" {
  description = "The secondary region in which to recover to"
}

variable "recovery_retention_time" {
  description = "**OPTIONAL**: Time (in minutes) to retain the recovery points for"
  default     = "1440"
}

variable "app_consistent_recovery_rate" {
  description = "**OPTIONAL**: Specifies the frequency (in minutes) at which to create application consistent recovery points"
  default     = "240"
}

variable "storage_account_type" {
  description = "**OPTIONAL**: Type of storage account to deploy"
  default     = "Standard"
}

variable "storage_account_replication_type" {
  description = "**OPTIONAL**: Type of replication to assign the storage account to deploy"
  default     = "GRS"
}

variable "source_vnet_id" {
  description = "ID of the replication source Virtual Network"
}

variable "target_vnet_id" {
  description = "ID of the replication target Virtual Network"
}

variable "subnet_ids" {
  description = "IDs of the primary & secondary subnets to allow access to the recovery cache Storage Account"
  type        = list(string)
}

variable "storage_account_https_traffic_only" {
  description = "**OPTIONAL**: Boolean flag which forces HTTPS if enabled"
  default     = "true"
}

variable "storage_account_min_tls_version" {
  description = "**OPTIONAL**: Minimum TLS version storage account should use"
  default     = "TLS1_2"
}

variable "storage_account_public_network_access_enabled" {
  description = "Specifies whether Public Network Access is allowed for this resource"
  default     = true
}

variable "storage_account_allow_nested_items_to_be_public" {
  description = "Can nested items in the storage account opt into allowing public access?"
  default     = false
}

variable "storage_account_cross_tenant_replication_enabled" {
  description = "Should cross Tenant replication be enabled?"
  default     = false
}
