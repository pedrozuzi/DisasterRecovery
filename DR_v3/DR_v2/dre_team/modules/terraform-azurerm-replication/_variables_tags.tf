/*** Default Tags ***/

variable "tag_support_group" {
  description = "The name of the group responsible for the deployed asset."
  default     = ""
}

variable "tag_app_group_email" {
  description = "The email address for the operations team responsible for the deployed asset."
  default     = ""
}

variable "tag_environment_type" {
  description = "The tier of environment for the application -- this is separate from the service level defined at the subscription level."
  default     = ""
}

/*** Resource Specific Tags ***/

variable "tag_expiration_date" {
  description = "The date that the asset is no longer required."
  default     = ""
}

variable "tag_webhook" {
  description = "A webhook to send notifications of events within the Resource Group to."
  default     = ""
}

variable "tag_sla" {
  description = "The contracted Service Level Agreement for system uptime."
  default     = ""
}

variable "tag_npi" {
  description = "An indicator of whether NPI is being stored on the asset."
  default     = ""
}
