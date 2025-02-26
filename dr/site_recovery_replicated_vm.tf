# data "azurerm_managed_disk" "vm_app_osdisk" {
#   name                = azurerm_windows_virtual_machine.primary_vm_app.os_disk[0].name
#   resource_group_name = azurerm_resource_group.rg_primary.name
# }

# data "azurerm_managed_disk" "vm_web_osdisk" {
#   name                = azurerm_windows_virtual_machine.primary_vm_web.os_disk[0].name
#   resource_group_name = azurerm_resource_group.rg_primary.name
# }

# data "azurerm_managed_disk" "vm_db_osdisk" {
#   name                = azurerm_windows_virtual_machine.primary_vm_db.os_disk[0].name
#   resource_group_name = azurerm_resource_group.rg_primary.name
# }

# resource "azurerm_site_recovery_replicated_vm" "vm_app_replication" {
#   name                                      = "vm-app-replication"
#   resource_group_name                       = azurerm_resource_group.rg_secondary.name
#   recovery_vault_name                       = azurerm_recovery_services_vault.secondary_vault.name
#   source_recovery_fabric_name               = azurerm_site_recovery_fabric.primary_fabric.name
#   source_vm_id                              = azurerm_windows_virtual_machine.primary_vm_app.id
#   recovery_replication_policy_id            = azurerm_site_recovery_replication_policy.replication_policy.id
#   source_recovery_protection_container_name = azurerm_site_recovery_protection_container.primary_protection_container.name

#   target_resource_group_id                = azurerm_resource_group.rg_secondary.id
#   target_recovery_fabric_id               = azurerm_site_recovery_fabric.secondary_fabric.id
#   target_recovery_protection_container_id = azurerm_site_recovery_protection_container.secondary_protection_container.id

#   managed_disk {
#     disk_id                    = lower(data.azurerm_managed_disk.vm_app_osdisk.id)
#     staging_storage_account_id = azurerm_storage_account.primary_storage_account.id
#     target_resource_group_id   = azurerm_resource_group.rg_secondary.id
#     target_disk_type           = "Premium_LRS"
#     target_replica_disk_type   = "Premium_LRS"
#   }

#   network_interface {
#     source_network_interface_id = azurerm_network_interface.primary_vm_app_nic.id
#     target_subnet_name          = azurerm_subnet.secondary_snet_app.name
#   }

#   depends_on = [
#     azurerm_site_recovery_protection_container_mapping.container-mapping,
#     azurerm_site_recovery_network_mapping.network-mapping,
#   ]

#   lifecycle {
#     ignore_changes = [managed_disk, network_interface]
#   }
# }

# resource "azurerm_site_recovery_replicated_vm" "vm_web_replication" {
#   name                                      = "vm-web-replication"
#   resource_group_name                       = azurerm_resource_group.rg_secondary.name
#   recovery_vault_name                       = azurerm_recovery_services_vault.secondary_vault.name
#   source_recovery_fabric_name               = azurerm_site_recovery_fabric.primary_fabric.name
#   source_vm_id                              = azurerm_windows_virtual_machine.primary_vm_web.id
#   recovery_replication_policy_id            = azurerm_site_recovery_replication_policy.replication_policy.id
#   source_recovery_protection_container_name = azurerm_site_recovery_protection_container.primary_protection_container.name

#   target_resource_group_id                = azurerm_resource_group.rg_secondary.id
#   target_recovery_fabric_id               = azurerm_site_recovery_fabric.secondary_fabric.id
#   target_recovery_protection_container_id = azurerm_site_recovery_protection_container.secondary_protection_container.id

#   managed_disk {
#     disk_id                    = lower(data.azurerm_managed_disk.vm_web_osdisk.id)
#     staging_storage_account_id = azurerm_storage_account.primary_storage_account.id
#     target_resource_group_id   = azurerm_resource_group.rg_secondary.id
#     target_disk_type           = "Premium_LRS"
#     target_replica_disk_type   = "Premium_LRS"
#   }

#   network_interface {
#     source_network_interface_id = azurerm_network_interface.primary_vm_web_nic.id
#     target_subnet_name          = azurerm_subnet.secondary_snet_app.name
#   }

#   depends_on = [
#     azurerm_site_recovery_protection_container_mapping.container-mapping,
#     azurerm_site_recovery_network_mapping.network-mapping,
#   ]

#   lifecycle {
#     ignore_changes = [managed_disk, network_interface]
#   }
# }

# resource "azurerm_site_recovery_replicated_vm" "vm_db_replication" {
#   name                                      = "vm-db-replication"
#   resource_group_name                       = azurerm_resource_group.rg_secondary.name
#   recovery_vault_name                       = azurerm_recovery_services_vault.secondary_vault.name
#   source_recovery_fabric_name               = azurerm_site_recovery_fabric.primary_fabric.name
#   source_vm_id                              = azurerm_windows_virtual_machine.primary_vm_db.id
#   recovery_replication_policy_id            = azurerm_site_recovery_replication_policy.replication_policy.id
#   source_recovery_protection_container_name = azurerm_site_recovery_protection_container.primary_protection_container.name

#   target_resource_group_id                = azurerm_resource_group.rg_secondary.id
#   target_recovery_fabric_id               = azurerm_site_recovery_fabric.secondary_fabric.id
#   target_recovery_protection_container_id = azurerm_site_recovery_protection_container.secondary_protection_container.id

#   managed_disk {
#     disk_id                    = lower(data.azurerm_managed_disk.vm_db_osdisk.id)
#     staging_storage_account_id = azurerm_storage_account.primary_storage_account.id
#     target_resource_group_id   = azurerm_resource_group.rg_secondary.id
#     target_disk_type           = "Premium_LRS"
#     target_replica_disk_type   = "Premium_LRS"
#   }

#   network_interface {
#     source_network_interface_id = azurerm_network_interface.primary_vm_db_nic.id
#     target_subnet_name          = azurerm_subnet.secondary_snet_db.name
#   }

#   depends_on = [
#     azurerm_site_recovery_protection_container_mapping.container-mapping,
#     azurerm_site_recovery_network_mapping.network-mapping,
#   ]

#   lifecycle {
#     ignore_changes = [managed_disk, network_interface]
#   }
# }

module "replication_vm_app" {
  source                                 = "../../DisasterRecovery/modules/terraform-azurerm-asr-replicated-vm"
  managed_disk_target_replica_disk_types = data.terraform_remote_state.prod.outputs.vm_app_managed_disk_types
  resource_group_name                    = azurerm_recovery_services_vault.secondary_vault.resource_group_name
  target_availability_set_id             = azurerm_availability_set.secondary_availability_set_vm_app.id
  target_resource_group_id               = azurerm_resource_group.rg_secondary_app.id
  managed_disk_ids                       = data.terraform_remote_state.prod.outputs.vm_app_managed_disk_ids
  target_recovery_fabric_id              = azurerm_site_recovery_fabric.secondary_fabric.id
  vm_ids                                 = data.terraform_remote_state.prod.outputs.vm_app_vm_ids
  nic_ids                                = data.terraform_remote_state.prod.outputs.vm_app_nic_ids
  secondary_protection_container_id      = azurerm_site_recovery_protection_container.secondary_protection_container.id
  tag_environment_type                   = "test"
  source_recovery_fabric_id              = azurerm_site_recovery_fabric.primary_fabric.id
  replication_policy_id                  = azurerm_site_recovery_replication_policy.replication_policy.id
  recovery_vault_id                      = azurerm_recovery_services_vault.secondary_vault.id
  managed_disk_target_disk_types         = data.terraform_remote_state.prod.outputs.vm_app_managed_disk_types
  primary_protection_container_name      = azurerm_site_recovery_protection_container.primary_protection_container.name
  secondary_fabric_id                    = azurerm_site_recovery_fabric.secondary_fabric.id
  primary_fabric_name                    = azurerm_site_recovery_fabric.primary_fabric.name
  dr_compute_cus_subnet_name             = azurerm_subnet.secondary_snet_app.name
  secondary_replication_vault_name       = azurerm_recovery_services_vault.secondary_vault.name
  os_disk_ids                            = data.terraform_remote_state.prod.outputs.vm_app_os_disk_ids
  cache_storage_account_id               = data.terraform_remote_state.prod.outputs.cache_storage_account_id
  tag_support_group                      = "test"
  #runbook_id                             = azurerm_automation_runbook.runbook_app_gateway.id
  tag_app_group_email = "test"
  vm_names            = data.terraform_remote_state.prod.outputs.vm_app_vm_names
}