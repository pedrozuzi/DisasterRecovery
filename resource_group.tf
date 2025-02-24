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

resource "azurerm_resource_group" "rg_images" {
  name     = var.rg_images_name
  location = var.rg_images_location
}


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