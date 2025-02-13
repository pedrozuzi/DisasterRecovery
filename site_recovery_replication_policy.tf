resource "azurerm_site_recovery_replication_policy" "replication_policy" {
  name                                                 = "policy"
  resource_group_name                                  = azurerm_resource_group.rg_secondary.name
  recovery_vault_name                                  = azurerm_recovery_services_vault.secondary_vault.name
  recovery_point_retention_in_minutes                  = 24 * 60
  application_consistent_snapshot_frequency_in_minutes = 4 * 60
}