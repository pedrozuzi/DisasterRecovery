###### Primary Region ##########

resource "azurerm_resource_group" "rg_primary" {
  name     = var.rg_primary_name
  location = var.rg_primary_location
}

resource "azurerm_resource_group" "rg_primary_db" {
  name     = var.rg_primary_db_name
  location = var.rg_primary_db_location
}

resource "azurerm_resource_group" "rg_primary_app" {
  name     = var.rg_primary_app_name
  location = var.rg_primary_app_location
}

resource "azurerm_resource_group" "rg_primary_web" {
  name     = var.rg_primary_web_name
  location = var.rg_primary_web_location
}