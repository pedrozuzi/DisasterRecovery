/*** Default Tags ***/

variable "tag_support_group" {
  description = "The name of the group responsible for the deployed asset."
  type        = string
}

variable "tag_app_group_email" {
  description = "The email address for the operations team responsible for the deployed asset."
  type        = string
}

variable "tag_environment_type" {
  description = "The tier of environment for the application -- this is separate from the service level defined at the subscription level."
  type        = string
}

/*** Resource Specific Tags ***/

variable "tag_expiration_date" {
  description = "The date that the asset is no longer required."
  type        = string
}

variable "tag_tier" {
  description = "The tier of system in the application deployment model."
  type        = string
}

variable "tag_maintenance_window" {
  description = "The timeframe that a server can be patched for updates by OMS."
  type        = list(string)
}

variable "tag_on_hours" {
  description = "The time which the virtual machine is required to run."
  type        = list(string)
}

variable "tag_sla" {
  description = "The contracted Service Level Agreement for system uptime."
  type        = string
}

variable "tag_solution_central_id" {
  description = "The Asset ID related to the entry in Solution Central for the product to be deployed on the given asset."
  type        = string
}

variable "tag_npi" {
  description = "An indicator of whether NPI is being stored on the asset."
  type        = string
}

variable "tag_webhook" {
  description = "A webhook to send notifications of events within the Resource Group to."
  type        = string
}

variable "tag_description" {
  description = "A user defined description of the server's purpose"
  type        = string
}

/*** Custom Tags ***/

variable "custom_nic_tags" {
  description = "**OPTIONAL**: Map of custom tags to add to the network interfaces"
  type        = map(string)
  default     = {}
}

variable "custom_pip_tags" {
  description = "**OPTIONAL**: Map of custom tags to add to the public IPs"
  type        = map(string)
  default     = {}
}

variable "custom_vm_tags" {
  description = "**OPTIONAL**: Map of custom tags to add to the VMs"
  type        = map(string)
  default     = {}
}

variable "custom_managed_disk_tags" {
  description = "**OPTIONAL**: Map of custom tags to add to the managed disks"
  type        = map(string)
  default     = {}
}
