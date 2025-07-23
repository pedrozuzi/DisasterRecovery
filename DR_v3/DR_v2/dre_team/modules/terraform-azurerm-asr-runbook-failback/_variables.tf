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

/*** General variables ***/

variable "resource_group_name" {
  description = "Name of the Resource Group in which to deploy these resources."
}

variable "region" {
  description = "Region in which to deploy Automation assets."
}

variable "automation_account_name" {
  description = "Name of the Automation Account to use."
}

variable "runbook_name_suffix" {
  description = "**OPTIONAL**: A suffix to add to the runbook's name. Required in cases where 2 of this runbook are deployed tot he same Automation Account."
  default     = ""
}

/*** Variable Values ***/

variable "client_id" {
  type        = string
  description = "ID of the user-managed-identity"
}

variable "subscriptionID" {
  description = "The subscription ID"
  type        = string
}

variable "vaultResourceGroup" {
  description = "The resource group name for the vault"
  type        = string
}

variable "vaultName" {
  description = "The name of the vault"
  type        = string
}

variable "DrApplicationGatewayName" {
  description = "The name of the DR application gateway"
  type        = string
}

variable "DrApplicationGatewayResourceGroup" {
  description = "The resource group name for the DR application gateway"
  type        = string
}

variable "ProdApplicationGatewayName" {
  description = "The name of the production application gateway"
  type        = string
}

variable "ProdApplicationGatewayResourceGroup" {
  description = "The resource group name for the production application gateway"
  type        = string
}

variable "recoveryPlanName" {
  description = "The name of the recovery plan"
  type        = string
}