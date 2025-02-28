resource "azurerm_automation_runbook" "runbook_app_gateway" {
  name                    = "AppGw_Start"
  location                = azurerm_resource_group.rg_secondary.location
  resource_group_name     = azurerm_resource_group.rg_secondary.name
  automation_account_name = azurerm_automation_account.automatin_account.name
  log_verbose             = "true"
  log_progress            = "true"
  description             = "Start_Stop AppGw"
  runbook_type            = "PowerShell"

  content = data.local_file.app_gateway_script.content
}