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

resource "azurerm_automation_runbook" "runbook_postgresql" {
  name                    = "postgresql"
  location                = azurerm_resource_group.rg_secondary.location
  resource_group_name     = azurerm_resource_group.rg_secondary.name
  automation_account_name = azurerm_automation_account.automatin_account.name
  log_verbose             = "true"
  log_progress            = "true"
  description             = "postgresql"
  runbook_type            = "PowerShell72" # need Powershell 7 to use AZ CLI

  content = data.local_file.postgresql_script.content
}

resource "azurerm_automation_runbook" "runbook_sql" {
  name                    = "sql_db_failover"
  location                = azurerm_resource_group.rg_secondary.location
  resource_group_name     = azurerm_resource_group.rg_secondary.name
  automation_account_name = azurerm_automation_account.automatin_account.name
  log_verbose             = "true"
  log_progress            = "true"
  description             = "sql_db_failover"
  runbook_type            = "PowerShell"

  content = data.local_file.sql_db_script.content
}