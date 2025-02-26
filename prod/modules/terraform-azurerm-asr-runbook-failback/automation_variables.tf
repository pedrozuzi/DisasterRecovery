resource "azurerm_automation_variable_string" "subscriptionID" {
  name                    = "subscriptionID"
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_name
  value                   = var.subscriptionID
}

resource "azurerm_automation_variable_string" "vaultResourceGroup" {
  name                    = "vaultResourceGroup"
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_name
  value                   = var.vaultResourceGroup
}

resource "azurerm_automation_variable_string" "vaultName" {
  name                    = "vaultName"
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_name
  value                   = var.vaultName
}

resource "azurerm_automation_variable_string" "DrApplicationGatewayName" {
  name                    = "DrApplicationGatewayName"
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_name
  value                   = var.DrApplicationGatewayName
}

resource "azurerm_automation_variable_string" "DrApplicationGatewayResourceGroup" {
  name                    = "DrApplicationGatewayResourceGroup"
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_name
  value                   = var.DrApplicationGatewayResourceGroup
}

resource "azurerm_automation_variable_string" "ProdApplicationGatewayName" {
  name                    = "ProdApplicationGatewayName"
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_name
  value                   = var.ProdApplicationGatewayName
}

resource "azurerm_automation_variable_string" "ProdApplicationGatewayResourceGroup" {
  name                    = "ProdApplicationGatewayResourceGroup"
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_name
  value                   = var.ProdApplicationGatewayResourceGroup
}

resource "azurerm_automation_variable_string" "recoveryPlanName" {
  name                    = "recoveryPlanName"
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_name
  value                   = var.recoveryPlanName
}