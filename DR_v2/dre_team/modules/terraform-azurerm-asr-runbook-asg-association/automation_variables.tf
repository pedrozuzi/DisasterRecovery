resource "azurerm_automation_variable_string" "asg_association_subscription_id" {
  name                    = "asg_association_subscription_id"
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_name
  value                   = var.subscription_id
}