# resource "azurerm_mssql_server" "sql_server_primary" {
#   name                         = "sqlserverprimary00001"
#   resource_group_name          = azurerm_resource_group.rg_primary_db.name
#   location                     = azurerm_resource_group.rg_primary_db.location
#   version                      = "12.0"
#   administrator_login          = var.admin_username
#   administrator_login_password = var.admin_password
# }

# resource "azurerm_mssql_database" "mssql_db1" {
#   name        = "mssql_db1"
#   server_id   = azurerm_mssql_server.sql_server_primary.id
#   sku_name    = "S1"
#   collation   = "SQL_Latin1_General_CP1_CI_AS"
#   max_size_gb = "200"
# }

# resource "azurerm_mssql_failover_group" "fog" {
#   name      = "failovergrouptestdr"
#   server_id = azurerm_mssql_server.sql_server_primary.id
#   databases = [
#     azurerm_mssql_database.mssql_db1.id
#   ]

#   partner_server {
#     id = data.terraform_remote_state.dr.outputs.secondary_mssql_server_id
#   }

#   read_write_endpoint_failover_policy {
#     mode          = "Automatic"
#     grace_minutes = 80
#   }

#   readonly_endpoint_failover_policy_enabled = true
# }