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

variable "custom_tags" {
  description = "Map of custom tags to add to the resources"
  type        = map(string)
  default     = {}
}