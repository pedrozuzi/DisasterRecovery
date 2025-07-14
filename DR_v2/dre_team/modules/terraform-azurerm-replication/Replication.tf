resource "azurerm_site_recovery_fabric" "primary" {
  name                = "${var.client_name}-primary-fabric"
  resource_group_name = var.dr_rg_name_recovery_vault
  location            = var.primary_region
  recovery_vault_name = module.secondary_replication_vault.recovery_vault_name
}

resource "azurerm_site_recovery_fabric" "secondary" {
  name                = "${var.client_name}-secondary-fabric"
  resource_group_name = var.dr_rg_name_recovery_vault
  location            = var.secondary_region
  recovery_vault_name = module.secondary_replication_vault.recovery_vault_name
}

resource "azurerm_site_recovery_protection_container" "primary" {
  name                 = "${var.client_name}-primary-protection-container"
  resource_group_name  = var.dr_rg_name_recovery_vault
  recovery_vault_name  = module.secondary_replication_vault.recovery_vault_name
  recovery_fabric_name = azurerm_site_recovery_fabric.primary.name
}

resource "azurerm_site_recovery_protection_container" "secondary" {
  name                 = "${var.client_name}-secondary-protection-container"
  resource_group_name  = var.dr_rg_name_recovery_vault
  recovery_vault_name  = module.secondary_replication_vault.recovery_vault_name
  recovery_fabric_name = azurerm_site_recovery_fabric.secondary.name
}

resource "azurerm_site_recovery_replication_policy" "policy" {
  name                                                 = "${var.client_name}-replication-policy"
  resource_group_name                                  = var.dr_rg_name_recovery_vault
  recovery_vault_name                                  = module.secondary_replication_vault.recovery_vault_name
  recovery_point_retention_in_minutes                  = var.recovery_retention_time
  application_consistent_snapshot_frequency_in_minutes = var.app_consistent_recovery_rate
}

resource "azurerm_site_recovery_protection_container_mapping" "container_mapping" {
  name                                      = "container-mapping-${var.primary_region}"
  resource_group_name                       = var.dr_rg_name_recovery_vault
  recovery_vault_name                       = module.secondary_replication_vault.recovery_vault_name
  recovery_fabric_name                      = azurerm_site_recovery_fabric.primary.name
  recovery_source_protection_container_name = azurerm_site_recovery_protection_container.primary.name
  recovery_target_protection_container_id   = azurerm_site_recovery_protection_container.secondary.id
  recovery_replication_policy_id            = azurerm_site_recovery_replication_policy.policy.id
}

