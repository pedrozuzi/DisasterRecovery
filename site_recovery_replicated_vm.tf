data "azurerm_managed_disk" "vm_app_osdisk" {
  name                = azurerm_windows_virtual_machine.primary_vm_app.os_disk[0].name
  resource_group_name = azurerm_resource_group.rg_primary.name
}

data "azurerm_managed_disk" "vm_web_osdisk" {
  name                = azurerm_windows_virtual_machine.primary_vm_web.os_disk[0].name
  resource_group_name = azurerm_resource_group.rg_primary.name
}

resource "azurerm_site_recovery_replicated_vm" "vm_app_replication" {
  name                                      = "vm-app-replication"
  resource_group_name                       = azurerm_resource_group.rg_secondary.name
  recovery_vault_name                       = azurerm_recovery_services_vault.secondary_vault.name
  source_recovery_fabric_name               = azurerm_site_recovery_fabric.primary_fabric.name
  source_vm_id                              = azurerm_windows_virtual_machine.primary_vm_app.id
  recovery_replication_policy_id            = azurerm_site_recovery_replication_policy.replication_policy.id
  source_recovery_protection_container_name = azurerm_site_recovery_protection_container.primary_protection_container.name

  target_resource_group_id                = azurerm_resource_group.rg_secondary.id
  target_recovery_fabric_id               = azurerm_site_recovery_fabric.secondary_fabric.id
  target_recovery_protection_container_id = azurerm_site_recovery_protection_container.secondary_protection_container.id

  managed_disk {
    disk_id                    = lower(data.azurerm_managed_disk.vm_app_osdisk.id)
    staging_storage_account_id = azurerm_storage_account.primary_storage_account.id
    target_resource_group_id   = azurerm_resource_group.rg_secondary.id
    target_disk_type           = "Premium_LRS"
    target_replica_disk_type   = "Premium_LRS"
  }

  network_interface {
    source_network_interface_id = azurerm_network_interface.primary_vm_app_nic.id
    target_subnet_name          = azurerm_subnet.secondary_snet_app.name
  }

  depends_on = [
    azurerm_site_recovery_protection_container_mapping.container-mapping,
    azurerm_site_recovery_network_mapping.network-mapping,
  ]
}

resource "azurerm_site_recovery_replicated_vm" "vm_web_replication" {
  name                                      = "vm-web-replication"
  resource_group_name                       = azurerm_resource_group.rg_secondary.name
  recovery_vault_name                       = azurerm_recovery_services_vault.secondary_vault.name
  source_recovery_fabric_name               = azurerm_site_recovery_fabric.primary_fabric.name
  source_vm_id                              = azurerm_windows_virtual_machine.primary_vm_web.id
  recovery_replication_policy_id            = azurerm_site_recovery_replication_policy.replication_policy.id
  source_recovery_protection_container_name = azurerm_site_recovery_protection_container.primary_protection_container.name

  target_resource_group_id                = azurerm_resource_group.rg_secondary.id
  target_recovery_fabric_id               = azurerm_site_recovery_fabric.secondary_fabric.id
  target_recovery_protection_container_id = azurerm_site_recovery_protection_container.secondary_protection_container.id

  managed_disk {
    disk_id                    = lower(data.azurerm_managed_disk.vm_web_osdisk.id)
    staging_storage_account_id = azurerm_storage_account.primary_storage_account.id
    target_resource_group_id   = azurerm_resource_group.rg_secondary.id
    target_disk_type           = "Premium_LRS"
    target_replica_disk_type   = "Premium_LRS"
  }

  network_interface {
    source_network_interface_id = azurerm_network_interface.primary_vm_web_nic.id
    target_subnet_name          = azurerm_subnet.secondary_snet_app.name
  }

  depends_on = [
    azurerm_site_recovery_protection_container_mapping.container-mapping,
    azurerm_site_recovery_network_mapping.network-mapping,
  ]
}