resource "azurerm_site_recovery_network_mapping" "network-mapping" {
  name                        = "network-mapping"
  resource_group_name         = azurerm_resource_group.rg_secondary.name
  recovery_vault_name         = azurerm_recovery_services_vault.secondary_vault.name
  source_recovery_fabric_name = azurerm_site_recovery_fabric.primary_fabric.name
  target_recovery_fabric_name = azurerm_site_recovery_fabric.secondary_fabric.name
  source_network_id           = data.terraform_remote_state.prod.outputs.primary_vnet_id
  target_network_id           = azurerm_virtual_network.secondary_vnet.id
}