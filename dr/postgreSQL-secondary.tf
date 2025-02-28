resource "azurerm_private_dns_zone" "secondary_postgre_private_dns_zone" {
  name                = "flexdbsecondary.postgres.database.azure.com"
  resource_group_name = azurerm_resource_group.rg_secondary_db.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "secondary_postgre_private_dns_zone_vnet_link" {
  name                  = "postgre-vnet-link"
  resource_group_name   = azurerm_resource_group.rg_secondary_db.name
  private_dns_zone_name = azurerm_private_dns_zone.secondary_postgre_private_dns_zone.name
  virtual_network_id    = azurerm_virtual_network.secondary_vnet.id
}

resource "azurerm_postgresql_flexible_server" "secondary_flexdb" {
  name                          = "flexdbsecondarydb"
  resource_group_name           = azurerm_resource_group.rg_secondary_db.name
  location                      = azurerm_resource_group.rg_secondary_db.location
  version                       = "13"
  delegated_subnet_id           = azurerm_subnet.secondary_snet_postgre.id
  private_dns_zone_id           = azurerm_private_dns_zone.secondary_postgre_private_dns_zone.id
  administrator_login           = var.admin_username
  administrator_password        = var.admin_password
  public_network_access_enabled = false

  create_mode      = "Replica"
  source_server_id = data.terraform_remote_state.prod.outputs.primary_postgresql_id

  sku_name = "GP_Standard_D2ds_v4"

  depends_on = [azurerm_private_dns_zone.secondary_postgre_private_dns_zone]

  lifecycle {
    ignore_changes = [zone]
  }
}