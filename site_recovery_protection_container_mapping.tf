resource "azurerm_site_recovery_protection_container_mapping" "container-mapping" {
  name                                      = "container-mapping"
  resource_group_name                       = azurerm_resource_group.rg_secondary.name
  recovery_vault_name                       = azurerm_recovery_services_vault.secondary_vault.name
  recovery_fabric_name                      = azurerm_site_recovery_fabric.primary_fabric.name
  recovery_source_protection_container_name = azurerm_site_recovery_protection_container.primary_protection_container.name
  recovery_target_protection_container_id   = azurerm_site_recovery_protection_container.secondary_protection_container.id
  recovery_replication_policy_id            = azurerm_site_recovery_replication_policy.replication_policy.id
}