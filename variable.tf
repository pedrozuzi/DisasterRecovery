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
variable "rg_primary_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "rg-primary"
}


variable "rg_primary_location" {
  description = "Location (region) of the Azure resource group for primary region"
  type        = string
  default     = "East US 2"
}

variable "rg_images_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "rg-images"
}


variable "rg_images_location" {
  description = "Location (region) of the Azure resource group for primary region"
  type        = string
  default     = "East US 2"
}



variable "rg_primary_app_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "rg-app-primary"
}

variable "rg_primary_app_location" {
  description = "Location (region) of the Azure resource group for primary region"
  type        = string
  default     = "East US 2"
}

variable "rg_primary_db_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "rg-db-primary"
}

variable "rg_primary_db_location" {
  description = "Location (region) of the Azure resource group for primary region"
  type        = string
  default     = "East US 2"
}

variable "rg_primary_web_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "rg-web-primary"
}

variable "rg_primary_web_location" {
  description = "Location (region) of the Azure resource group for primary region"
  type        = string
  default     = "East US 2"
}


#Recovery Service Vault
variable "primary_vault_name" {
  description = "Name of primary Vault"
  type        = string
  default     = "primary-rsv"
}

#Virtual Network
variable "primary_vnet_name" {
  description = "Name of primary VNet"
  type        = string
  default     = "vnet-primary"
}

variable "primary_vnet_address_space" {
  description = "Address space of the primary virtual network"
  type        = list(any)
  default     = ["10.0.0.0/16"]
}

variable "primary_snet_app_name" {
  description = "Name of primary snet_app"
  type        = string
  default     = "snet-app"
}

variable "primary_snet_app_address_space" {
  description = "Address space of Primary snet_app subnet"
  type        = list(any)
  default     = ["10.0.0.0/24"]
}

variable "primary_snet_db_name" {
  description = "Name of primary snet_db"
  type        = string
  default     = "snet-db"
}

variable "primary_snet_db_address_space" {
  description = "Address space of Primary snet_db subnet"
  type        = list(any)
  default     = ["10.0.1.0/24"]
}

variable "primary_vm_app_name" {
  description = "Name of VM APP"
  type        = string
  default     = "vm-app"
}

variable "primary_vm_web_name" {
  description = "Name of VM WEB"
  type        = string
  default     = "vm-web"
}

variable "primary_vm_db_name" {
  description = "Name of VM DB"
  type        = string
  default     = "vm-db"
}

variable "primary_snet_app_gateway" {
  description = "Name of primary snet_app_gateway"
  type        = string
  default     = "snet-gateway"
}

variable "primary_snet_app_gateway_address_space" {
  description = "Address space of primary snet_app_gateway subnet"
  type        = list(any)
  default     = ["10.0.2.0/24"]
}

variable "primary_snet_postgre" {
  description = "Name of primary snet_postgre"
  type        = string
  default     = "snet-postgre"
}

variable "primary_snet_postgre_address_space" {
  description = "Address space of primary snet_postgre subnet"
  type        = list(any)
  default     = ["10.0.3.0/24"]
}



#######Secondary region######
variable "rg_secondary_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "rg-secondary"
}

variable "rg_secondary_location" {
  description = "Location (region) of the Azure resource group for secondary region"
  type        = string
  default     = "Central US"
}

#Recovery Service Vault
variable "secondary_vault_name" {
  description = "Name of primary Vault"
  type        = string
  default     = "secondary-rsv"
}

#Virtual Network
variable "secondary_vnet_name" {
  description = "Name of secondary VNet"
  type        = string
  default     = "vnet-secondary"
}

variable "secondary_vnet_address_space" {
  description = "Address space of the secondary virtual network"
  type        = list(any)
  default     = ["10.100.0.0/16"]
}

variable "secondary_snet_app_name" {
  description = "Name of secondary snet_app"
  type        = string
  default     = "snet-app"
}

variable "secondary_snet_app_address_space" {
  description = "Address space of secondary snet_app subnet"
  type        = list(any)
  default     = ["10.100.0.0/24"]
}

variable "secondary_snet_db_name" {
  description = "Name of secondary snet_db"
  type        = string
  default     = "snet-db"
}

variable "secondary_snet_db_address_space" {
  description = "Address space of secondary snet_db subnet"
  type        = list(any)
  default     = ["10.100.1.0/24"]
}

variable "secondary_snet_app_gateway" {
  description = "Name of secondary snet_app_gateway"
  type        = string
  default     = "snet-gateway"
}

variable "secondary_snet_app_gateway_address_space" {
  description = "Address space of secondary snet_app_gateway subnet"
  type        = list(any)
  default     = ["10.100.2.0/24"]
}

variable "rg_secondary_db_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "rg-db-secondary"
}

variable "rg_secondary_db_location" {
  description = "Location (region) of the Azure resource group for primary region"
  type        = string
  default     = "Central US"
}

variable "rg_secondary_app_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "rg-app-secondary"
}

variable "rg_secondary_app_location" {
  description = "Location (region) of the Azure resource group for primary region"
  type        = string
  default     = "Central US"
}

variable "rg_secondary_web_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "rg-web-secondary"
}

variable "rg_secondary_web_location" {
  description = "Location (region) of the Azure resource group for primary region"
  type        = string
  default     = "Central US"
}

variable "secondary_snet_postgre" {
  description = "Name of secondary snet_postgre"
  type        = string
  default     = "snet-postgre"
}

variable "secondary_snet_postgre_address_space" {
  description = "Address space of secondary snet_postgre subnet"
  type        = list(any)
  default     = ["10.100.3.0/24"]
}