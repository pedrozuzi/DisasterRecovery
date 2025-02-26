resource "azurerm_automation_runbook" "asr_failback" {
  name                    = "asr_failback${var.runbook_name_suffix}"
  resource_group_name     = var.resource_group_name
  location                = var.region
  automation_account_name = var.automation_account_name
  runbook_type            = "PowerShell"
  description             = "PS Runbook to Failback DR environment."
  log_progress            = true
  log_verbose             = true
  content                 = local.runbook

  tags = {
    SupportGroup    = var.tag_support_group
    AppGroupEmail   = var.tag_app_group_email
    EnvironmentType = var.tag_environment_type
  }
}