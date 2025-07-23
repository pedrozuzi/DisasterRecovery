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


variable "client_name" {
  default = "dreteam"
}


#######Secondary region######

variable "dre_primary_region" {
  description = "Primary location"
  type        = string
  default     = "EastUS2"
}

variable "dre_secondary_region" {
  description = "Secondary location"
  type        = string
  default     = "CentralUS"
}

variable "dre_team_rg_secondary_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "dre-rg-secondary"
}

variable "dre_team_rg_secondary_location" {
  description = "Location (region) of the Azure resource group for secondary region"
  type        = string
  default     = "CentralUS"
}

variable "dre_team_rg_secondary_storage_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "dre-rg-storage-secondary"
}

variable "dre_team_rg_secondary_storage_location" {
  description = "Location (region) of the Azure resource group for secondary region"
  type        = string
  default     = "CentralUS"
}

variable "dre_team_rg_secondary_automation_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "dre-rg-automation-secondary"
}

variable "dre_team_rg_secondary_automation_location" {
  description = "Location (region) of the Azure resource group for secondary region"
  type        = string
  default     = "CentralUS"
}



#Virtual Network
variable "dre_team_secondary_vnet_name" {
  description = "Name of secondary VNet"
  type        = string
  default     = "vnet-secondary"
}

variable "dre_team_secondary_vnet_address_space" {
  description = "Address space of the secondary virtual network"
  type        = list(any)
  default     = ["10.100.0.0/16"]
}

variable "dre_team_secondary_snet_app_name" {
  description = "Name of secondary snet_app"
  type        = string
  default     = "snet-app"
}

variable "dre_team_secondary_snet_app_address_space" {
  description = "Address space of secondary snet_app subnet"
  type        = list(any)
  default     = ["10.100.0.0/24"]
}

variable "dre_team_secondary_snet_db_name" {
  description = "Name of secondary snet_db"
  type        = string
  default     = "snet-db"
}

variable "dre_team_secondary_snet_db_address_space" {
  description = "Address space of secondary snet_db subnet"
  type        = list(any)
  default     = ["10.100.1.0/24"]
}

variable "dre_team_secondary_snet_app_gateway" {
  description = "Name of secondary snet_app_gateway"
  type        = string
  default     = "snet-gateway"
}

variable "dre_team_secondary_snet_app_gateway_address_space" {
  description = "Address space of secondary snet_app_gateway subnet"
  type        = list(any)
  default     = ["10.100.2.0/24"]
}

variable "dre_team_rg_secondary_db_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "rg-db-secondary"
}

variable "dre_team_rg_secondary_db_location" {
  description = "Location (region) of the Azure resource group for primary region"
  type        = string
  default     = "CentralUS"
}

variable "dre_team_rg_secondary_app_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "rg-app-secondary"
}

variable "dre_team_rg_secondary_app_location" {
  description = "Location (region) of the Azure resource group for primary region"
  type        = string
  default     = "CentralUS"
}

variable "dre_team_rg_secondary_web_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "rg-web-secondary"
}

variable "dre_team_rg_secondary_web_location" {
  description = "Location (region) of the Azure resource group for primary region"
  type        = string
  default     = "CentralUS"
}

variable "dre_team_secondary_snet_postgre" {
  description = "Name of secondary snet_postgre"
  type        = string
  default     = "snet-postgre"
}

variable "dre_team_secondary_snet_postgre_address_space" {
  description = "Address space of secondary snet_postgre subnet"
  type        = list(any)
  default     = ["10.100.3.0/24"]
}

variable "dre_team_rg_recovery_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "dre-rg-recovery"
}

variable "dre_team_rg_recovery_location" {
  description = "Location (region) of the Azure resource group for primary region"
  type        = string
  default     = "CentralUS"
}




variable "tag_buc" {
  description = "The Business Unit Code associated with the group responsible for the deployed asset."
  default     = "3201.501026.9425..0000.0000.0000"
}

variable "tag_support_group" {
  description = "The name of the group responsible for the deployed asset."
  default     = "FIS IDS-IPS"
}

variable "tag_app_group_email" {
  description = "The email address for the operations team responsible for the deployed asset."
  default     = "Security-IDS-IPS@fisglobal.com"
}

variable "tag_environment_type" {
  description = "The tier of environment for the application -- this is separate from the service level defined at the subscription level."
  default     = "Production"
}

variable "tag_customer_crmid" {
  description = "The end customer of the system and the CRM ID of the end customer of the system."
  default     = "FIS 6015"
}



variable "use_remote_rules" {
  type        = bool
  default     = false
  description = "If true, import rules from a remote workspace."
}