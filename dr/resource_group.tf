###### Secondary Region ##########

resource "azurerm_resource_group" "rg_secondary" {
  name     = var.rg_secondary_name
  location = var.rg_secondary_location
}

resource "azurerm_resource_group" "rg_secondary_db" {
  name     = var.rg_secondary_db_name
  location = var.rg_secondary_db_location
}

resource "azurerm_resource_group" "rg_secondary_app" {
  name     = var.rg_secondary_app_name
  location = var.rg_secondary_app_location
}

resource "azurerm_resource_group" "rg_secondary_web" {
  name     = var.rg_secondary_web_name
  location = var.rg_secondary_web_location
}