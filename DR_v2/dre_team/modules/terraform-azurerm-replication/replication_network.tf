resource "azurerm_site_recovery_network_mapping" "recovery_mapping" {
  name                        = "${var.client_name}-recovery-network-mapping"
  resource_group_name         = var.dr_rg_name_recovery_vault
  recovery_vault_name         = module.secondary_replication_vault.recovery_vault_name
  source_recovery_fabric_name = azurerm_site_recovery_fabric.primary.name
  target_recovery_fabric_name = azurerm_site_recovery_fabric.secondary.name
  source_network_id           = var.source_vnet_id
  target_network_id           = var.target_vnet_id
}
