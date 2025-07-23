###### Secondary Region ##########

resource "azurerm_resource_group" "dre_team_rg_secondary" {
  name     = var.dre_team_rg_secondary_name
  location = var.dre_team_rg_secondary_location

  tags = {
    BUC             = var.tag_buc
    SupportGroup    = var.tag_support_group
    AppGroupEmail   = var.tag_app_group_email
    EnvironmentType = var.tag_environment_type
    CustomerCRMID   = var.tag_customer_crmid
    ExpirationDate  = "Never"
    Webhook         = "N/A"
  }
}

resource "azurerm_resource_group" "dre_team_rg_secondary_db" {
  name     = var.dre_team_rg_secondary_db_name
  location = var.dre_team_rg_secondary_db_location

  tags = {
    BUC             = var.tag_buc
    SupportGroup    = var.tag_support_group
    AppGroupEmail   = var.tag_app_group_email
    EnvironmentType = var.tag_environment_type
    CustomerCRMID   = var.tag_customer_crmid
    ExpirationDate  = "Never"
    Webhook         = "N/A"
  }
}

resource "azurerm_resource_group" "dre_team_rg_secondary_app" {
  name     = var.dre_team_rg_secondary_app_name
  location = var.dre_team_rg_secondary_app_location

  tags = {
    BUC             = var.tag_buc
    SupportGroup    = var.tag_support_group
    AppGroupEmail   = var.tag_app_group_email
    EnvironmentType = var.tag_environment_type
    CustomerCRMID   = var.tag_customer_crmid
    ExpirationDate  = "Never"
    Webhook         = "N/A"
  }
}

resource "azurerm_resource_group" "dre_team_rg_secondary_web" {
  name     = var.dre_team_rg_secondary_web_name
  location = var.dre_team_rg_secondary_web_location

  tags = {
    BUC             = var.tag_buc
    SupportGroup    = var.tag_support_group
    AppGroupEmail   = var.tag_app_group_email
    EnvironmentType = var.tag_environment_type
    CustomerCRMID   = var.tag_customer_crmid
    ExpirationDate  = "Never"
    Webhook         = "N/A"
  }
}

resource "azurerm_resource_group" "dre_team_rg_recovery" {
  name     = var.dre_team_rg_recovery_name
  location = var.dre_team_rg_recovery_location

  tags = {
    BUC             = var.tag_buc
    SupportGroup    = var.tag_support_group
    AppGroupEmail   = var.tag_app_group_email
    EnvironmentType = var.tag_environment_type
    CustomerCRMID   = var.tag_customer_crmid
    ExpirationDate  = "Never"
    Webhook         = "N/A"
  }
}

resource "azurerm_resource_group" "dre_team_rg_secondary_storage" {
  name     = var.dre_team_rg_secondary_storage_name
  location = var.dre_team_rg_secondary_storage_location

  tags = {
    BUC             = var.tag_buc
    SupportGroup    = var.tag_support_group
    AppGroupEmail   = var.tag_app_group_email
    EnvironmentType = var.tag_environment_type
    CustomerCRMID   = var.tag_customer_crmid
    ExpirationDate  = "Never"
    Webhook         = "N/A"
  }
}

resource "azurerm_resource_group" "dre_team_rg_secondary_automation" {
  name     = var.dre_team_rg_secondary_automation_name
  location = var.dre_team_rg_secondary_automation_location

  tags = {
    BUC             = var.tag_buc
    SupportGroup    = var.tag_support_group
    AppGroupEmail   = var.tag_app_group_email
    EnvironmentType = var.tag_environment_type
    CustomerCRMID   = var.tag_customer_crmid
    ExpirationDate  = "Never"
    Webhook         = "N/A"
  }
}