#Authentication variables
variable "arm_client_id" {}

variable "arm_client_secret" {}

variable "arm_tenant_id" {}

variable "subscription_id" {}

##VM Credentials##
variable "admin_username" {
  description = "Administrator username for the virtual machines"
  type        = string
  default     = "usradmin"
}

variable "admin_password" {
  description = "Administrator password for the virtual machines"
  type        = string
  default     = "P@ssWord!!$4"
}


#####Primary region#######

#Resource Group
variable "dre_team_rg_primary_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "dre-rg-primary"
}

variable "dre_team_rg_primary_location" {
  description = "Location (region) of the Azure resource group for primary region"
  type        = string
  default     = "EastUS2"
}

variable "dre_team_rg_primary_app_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "dre-rg-app-primary"
}

variable "dre_team_rg_primary_app_location" {
  description = "Location (region) of the Azure resource group for primary region"
  type        = string
  default     = "EastUS2"
}

variable "dre_team_rg_primary_db_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "dre-rg-db-primary"
}

variable "dre_team_rg_primary_db_location" {
  description = "Location (region) of the Azure resource group for primary region"
  type        = string
  default     = "EastUS2"
}

variable "dre_team_rg_primary_web_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "dre-rg-web-primary"
}

variable "dre_team_rg_primary_web_location" {
  description = "Location (region) of the Azure resource group for primary region"
  type        = string
  default     = "EastUS2"
}

variable "dre_team_rg_primary_storage_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "dre-rg-storage-primary"
}

variable "dre_team_rg_primary_storage_location" {
  description = "Location (region) of the Azure resource group for primary region"
  type        = string
  default     = "EastUS2"
}

variable "dre_team_rg_secondary_storage_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "dre-rg-storage-secondary"
}

variable "dre_team_rg_secondary_storage_location" {
  description = "Location (region) of the Azure resource group for primary region"
  type        = string
  default     = "CentralUS"
}

variable "dre_team_rg_recovery_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "dre-rg-recovery"
}

variable "dre_team_rg_recovery_location" {
  description = "Location (region) of the Azure resource group for RSV"
  type        = string
  default     = "CentralUS"
}

#Virtual Network
variable "dre_team_primary_vnet_name" {
  description = "Name of primary VNet"
  type        = string
  default     = "vnet-primary"
}

variable "dre_team_primary_vnet_address_space" {
  description = "Address space of the primary virtual network"
  type        = list(any)
  default     = ["10.0.0.0/16"]
}

variable "dre_team_primary_snet_app_name" {
  description = "Name of primary snet_app"
  type        = string
  default     = "snet-app"
}

variable "dre_team_primary_snet_app_address_space" {
  description = "Address space of Primary snet_app subnet"
  type        = list(any)
  default     = ["10.0.0.0/24"]
}

variable "dre_team_primary_snet_db_name" {
  description = "Name of primary snet_db"
  type        = string
  default     = "snet-db"
}

variable "dre_team_primary_snet_db_address_space" {
  description = "Address space of Primary snet_db subnet"
  type        = list(any)
  default     = ["10.0.1.0/24"]
}

variable "primary_dre_team_vm_app_name" {
  description = "Name of VM APP"
  type        = string
  default     = "LABDREWINAPP"
}

variable "primary_dre_team_vm_web_name" {
  description = "Name of VM WEB"
  type        = string
  default     = "LABDREWINWEB"
}

variable "primary_vm_db_name" {
  description = "Name of VM DB"
  type        = string
  default     = "LABDREWINDB"
}

variable "dre_team_primary_snet_app_gateway" {
  description = "Name of primary snet_app_gateway"
  type        = string
  default     = "snet-gateway"
}

variable "dre_team_primary_snet_app_gateway_address_space" {
  description = "Address space of primary snet_app_gateway subnet"
  type        = list(any)
  default     = ["10.0.2.0/24"]
}

variable "dre_team_primary_snet_postgre" {
  description = "Name of primary snet_postgre"
  type        = string
  default     = "snet-postgre"
}

variable "dre_team_primary_snet_postgre_address_space" {
  description = "Address space of primary snet_postgre subnet"
  type        = list(any)
  default     = ["10.0.3.0/24"]
}

###### Regions ######
variable "dre_primary_region" {
  description = "Azure region with which to deploy resources"
  type        = string
  default     = "EastUS2"
}

variable "dre_secondary_region" {
  description = "Azure region with wich to deploy dr resources"
  type        = string
  default     = "CentralUS"
}

#replication

variable "client_name" {
  default = "dreteam"
}
