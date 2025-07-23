resource "azurerm_automation_runbook" "asg_association" {
  name                    = "asg_association"
  resource_group_name     = var.resource_group_name
  location                = var.region
  automation_account_name = var.automation_account_name
  runbook_type            = "PowerShell"
  description             = "PS Runbook to manage asg association post failover."
  log_progress            = true
  log_verbose             = true
  content                 = local.runbook

  # publish_content_link {
  #   uri = "https://microsoft.com"
  # }

  tags = {
    SupportGroup    = var.tag_support_group
    AppGroupEmail   = var.tag_app_group_email
    EnvironmentType = var.tag_environment_type
  }
}