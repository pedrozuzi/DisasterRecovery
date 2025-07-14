# resource "azurerm_mssql_server" "sql_server_secondary" {
#   name                         = "sqlserversecondary00001"
#   resource_group_name          = azurerm_resource_group.rg_secondary_db.name
#   location                     = azurerm_resource_group.rg_secondary_db.location
#   version                      = "12.0"
#   administrator_login          = var.admin_username
#   administrator_login_password = var.admin_password
# }