variable "resource_group_name" {
  description = "Name of the Resource Group in which to deploy these resources"
  type        = string
}

variable "region" {
  description = "Region in which to deploy these resources"
  type        = string
}

variable "recovery_vault_name" {
  description = "The name of the Recovery Vault"
  type        = string
}

variable "recovery_vault_sku" {
  description = "**OPTIONAL**: The sku of the Recovery Vault"
  type        = string
  default     = "Standard"
}

variable "storage_mode_type" {
  description = "**OPTIONAL**: The storage type of the Recovery Services Vault. Possible values are GeoRedundant, LocallyRedundant and ZoneRedundant. Defaults to GeoRedundant."
  type        = string
  default     = "LocallyRedundant"
}
