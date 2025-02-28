resource "azurerm_private_dns_zone" "primary_postgre_private_dns_zone" {
  name                = "flexdbprimary.postgres.database.azure.com"
  resource_group_name = azurerm_resource_group.rg_primary_db.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "primary_postgre_private_dns_zone_vnet_link" {
  name                  = "postgre-vnet-link"
  resource_group_name   = azurerm_resource_group.rg_primary_db.name
  private_dns_zone_name = azurerm_private_dns_zone.primary_postgre_private_dns_zone.name
  virtual_network_id    = azurerm_virtual_network.primary_vnet.id
}

resource "azurerm_postgresql_flexible_server" "primary_flexdb" {
  name                          = "flexdbprimarydb"
  resource_group_name           = azurerm_resource_group.rg_primary_db.name
  location                      = azurerm_resource_group.rg_primary_db.location
  version                       = "13"
  delegated_subnet_id           = azurerm_subnet.primary_snet_postgre.id
  private_dns_zone_id           = azurerm_private_dns_zone.primary_postgre_private_dns_zone.id
  administrator_login           = var.admin_username
  administrator_password        = var.admin_password
  public_network_access_enabled = false

  geo_redundant_backup_enabled = true

  sku_name = "GP_Standard_D2ds_v4"

  depends_on = [azurerm_private_dns_zone.primary_postgre_private_dns_zone]

  lifecycle {
    ignore_changes = [zone]
  }
}

# resource "azurerm_postgresql_flexible_server_virtual_endpoint" "primary_flexdb_vep" {
#   name              = "flexdbvep"
#   source_server_id  = azurerm_postgresql_flexible_server.primary_flexdb.id
#   replica_server_id = azurerm_postgresql_flexible_server.secondary_flexdb.id
#   type              = "ReadWrite"

#   timeouts {
#     create = "60m"
#   }
# }