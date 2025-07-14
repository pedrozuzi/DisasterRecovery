###### Primary Region ##########

resource "azurerm_resource_group" "dre_team_rg_primary" {
  name     = var.dre_team_rg_primary_name
  location = var.dre_team_rg_primary_location

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

resource "azurerm_resource_group" "dre_team_rg_primary_db" {
  name     = var.dre_team_rg_primary_db_name
  location = var.dre_team_rg_primary_db_location

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

resource "azurerm_resource_group" "dre_team_rg_primary_app" {
  name     = var.dre_team_rg_primary_app_name
  location = var.dre_team_rg_primary_app_location
  
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

resource "azurerm_resource_group" "dre_team_rg_primary_web" {
  name     = var.dre_team_rg_primary_web_name
  location = var.dre_team_rg_primary_web_location
  
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

resource "azurerm_resource_group" "dre_team_rg_primary_storage" {
  name     = var.dre_team_rg_primary_storage_name
  location = var.dre_team_rg_primary_storage_location
  
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