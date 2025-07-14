variable "resource_group_name" {
  description = "Name of the Resource Group in which to deploy these resources."
}

variable "region" {
  description = "Region in which to deploy Automation assets."
}

variable "automation_account_name" {
  description = "Name of the Automation Account to use."
}

/*** Variable Values ***/
variable "client_id" {
  description = "ID of the user-managed-identity"
}

variable "subscription_id" {
  description = "ID of the target Subscription."
}

/*** Tags ***/
variable "tag_support_group" {
  description = "The name of the group responsible for the deployed asset."
}

variable "tag_app_group_email" {
  description = "The email address for the operations team responsible for the deployed asset."
}

variable "tag_environment_type" {
  description = "The tier of environment for the application -- this is separate from the service level defined at the subscription level."
}