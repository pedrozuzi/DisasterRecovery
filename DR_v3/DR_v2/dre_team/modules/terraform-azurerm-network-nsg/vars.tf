#### Required Variables ####
variable "rules" {
  type = list(object({
    name                                       = string
    access                                     = string
    direction                                  = string
    priority                                   = number
    protocol                                   = string
    source_port_range                          = string
    destination_port_range                     = string
    source_application_security_group_ids      = optional(list(string))
    destination_application_security_group_ids = optional(list(string))
  }))
}


variable "resource_group_name" {
  type        = string
  description = "(Required) The resource group under which oracle server will be created."
}

variable "naming_convention" {
  type        = map(string)
  description = "(Required) Array of naming convention variables. Pass same naming convention used for resource which will be protected by NSG as NSG inherits the name."
}

variable "nsg_type" {
  type        = string
  description = "(Required) Describes if NSG is for VM or subnet. Valid values are vm and subnet"
}

#### Optional Variables ####
variable "location" {
  type        = string
  default     = "eastus"
  description = "(Optional). The location where the resources will be created. Default = eastus."
}

variable "tags" {
  type        = map(string)
  description = "(Optional) List of tags to apply to the NSG."
  default     = {}
}

