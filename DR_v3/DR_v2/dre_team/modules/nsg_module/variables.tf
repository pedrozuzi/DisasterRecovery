variable "resource_group_name" {
  type        = string
  description = "The resource group under which NSG will be created."
}

variable "location" {
  type        = string
  default     = "eastus"
  description = "Location for the resources."
}

variable "nsg_type" {
  type        = string
  description = "Describes if NSG is for VM or subnet. Valid values are vm and subnet."
  validation {
    condition     = contains(["vm", "subnet"], var.nsg_type)
    error_message = "nsg_type must be either 'vm' or 'subnet'."
  }
}

variable "naming_convention" {
  type        = map(string)
  description = "Naming convention variables."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to the NSG."
}

variable "use_remote_rules" {
  type        = bool
  default     = false
  description = "If true, import rules from a remote workspace."
}

variable "remote_state_config" {
  type = object({
    organization = string
    workspace    = string
  })
  default     = null
  description = "Remote state config for Terraform Enterprise or Cloud."
}

variable "rules" {
  type = list(object({
    name        = string
    priority    = number
    direction   = string
    access      = string
    protocol    = string
    source_port_range           = string
    destination_port_range      = string
    source_address_prefix       = optional(string)
    source_address_prefixes     = optional(list(string))
    destination_address_prefix  = optional(string)
    destination_address_prefixes = optional(list(string))
    source_application_security_group_ids      = optional(list(string))
    destination_application_security_group_ids = optional(list(string))
  }))
  default     = []
  description = "A list of NSG rules to apply."
}


variable "asg_nic_map" {
  type = map(list(string))
  default = {}
  description = "Map of ASG names to lists of NIC IDs to attach."
}

variable "asg_id_overrides" {
  type = map(string)
  default = {}
  description = "Optional map of ASG names to existing ASG IDs. If provided, these will be used instead of creating new ASGs."
}


variable "existing_nsg_name" {
  description = "Optional. The name of an existing NSG. If null, a new NSG will be created."
  type        = string
  default     = null

  validation {
    condition = (
      (var.existing_nsg_name == null && var.existing_nsg_id == null && var.existing_nsg_resource_group == null) ||
      (var.existing_nsg_name != null && var.existing_nsg_id != null && var.existing_nsg_resource_group != null)
    )
    error_message = "If using an existing NSG, you must provide the name, ID, and resource group."
  }
}


variable "existing_nsg_id" {
  description = "Optional. The ID of an existing NSG. Required if using an existing NSG."
  type        = string
  default     = null
}

variable "existing_nsg_resource_group" {
  description = "Optional. The resource group of the existing NSG. Required if using an existing NSG."
  type        = string
  default     = null
}
