
module "dre_team_replication" {
  count                                  = var.enable_replication ? 1 : 0
  source                                 = "../terraform-azurerm-asr-replicated-vm-v2"
  resource_group_name                    = var.replication_dr_rg_name_recovery_vault
  target_availability_set_id             = var.replication_target_availability_set_id
  target_resource_group_id               = var.replication_target_resource_group_id
  target_recovery_fabric_id              = var.replication_target_recovery_fabric_id
  vm_ids                                 = azurerm_windows_virtual_machine.windows[*].id
  nic_ids                                = azurerm_network_interface.network_interfaces[*].id
  secondary_protection_container_id      = var.replication_secondary_protection_container_id
  replication_policy_id                  = var.replication_replication_policy_id
  primary_protection_container_name      = var.replication_primary_protection_container_name
  secondary_fabric_id                    = var.replication_secondary_fabric_id
  primary_fabric_name                    = var.replication_primary_fabric_name
  dr_compute_cus_subnet_name             = var.replication_dr_compute_cus_subnet_name
  secondary_replication_vault_name       = var.replication_recovery_vault_name
  cache_storage_account_id               = var.replication_cache_storage_account_id
  vm_names                               = azurerm_windows_virtual_machine.windows[*].name
  vm_disks_info                          = local.vm_disks_info
  vm_sizes                               = azurerm_windows_virtual_machine.windows[*].size
  tag_environment_type                   = var.tag_environment_type #
  tag_support_group                      = var.tag_support_group #
  tag_app_group_email                    = var.tag_app_group_email #


  depends_on = [ time_static.init_disk_trigger,
                  azurerm_virtual_machine_extension.init_disk,
                  azurerm_virtual_machine_data_disk_attachment.server_managed_disk_attachment,
                  azurerm_windows_virtual_machine.windows ]
}