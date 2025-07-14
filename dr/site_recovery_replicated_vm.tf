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
  tag_app_group_email                    = "test"
  vm_names                               = data.terraform_remote_state.prod.outputs.vm_app_vm_names
  vm_disks_info                          = data.terraform_remote_state.prod.outputs.vm_app_disks_info
}

# module "replication_vm_web" {
#   source                                 = "../../DisasterRecovery/modules/terraform-azurerm-asr-replicated-vm"
#   managed_disk_target_replica_disk_types = data.terraform_remote_state.prod.outputs.vm_web_managed_disk_types
#   resource_group_name                    = azurerm_recovery_services_vault.secondary_vault.resource_group_name
#   target_availability_set_id             = azurerm_availability_set.secondary_availability_set_vm_web.id
#   target_resource_group_id               = azurerm_resource_group.rg_secondary_web.id
#   managed_disk_ids                       = data.terraform_remote_state.prod.outputs.vm_web_managed_disk_ids
#   target_recovery_fabric_id              = azurerm_site_recovery_fabric.secondary_fabric.id
#   vm_ids                                 = data.terraform_remote_state.prod.outputs.vm_web_vm_ids
#   nic_ids                                = data.terraform_remote_state.prod.outputs.vm_web_nic_ids
#   secondary_protection_container_id      = azurerm_site_recovery_protection_container.secondary_protection_container.id
#   tag_environment_type                   = "test"
#   source_recovery_fabric_id              = azurerm_site_recovery_fabric.primary_fabric.id
#   replication_policy_id                  = azurerm_site_recovery_replication_policy.replication_policy.id
#   recovery_vault_id                      = azurerm_recovery_services_vault.secondary_vault.id
#   managed_disk_target_disk_types         = data.terraform_remote_state.prod.outputs.vm_web_managed_disk_types
#   primary_protection_container_name      = azurerm_site_recovery_protection_container.primary_protection_container.name
#   secondary_fabric_id                    = azurerm_site_recovery_fabric.secondary_fabric.id
#   primary_fabric_name                    = azurerm_site_recovery_fabric.primary_fabric.name
#   dr_compute_cus_subnet_name             = azurerm_subnet.secondary_snet_app.name
#   secondary_replication_vault_name       = azurerm_recovery_services_vault.secondary_vault.name
#   os_disk_ids                            = data.terraform_remote_state.prod.outputs.vm_web_os_disk_ids
#   cache_storage_account_id               = data.terraform_remote_state.prod.outputs.cache_storage_account_id
#   tag_support_group                      = "test"
#   tag_app_group_email                    = "test"
#   vm_names                               = data.terraform_remote_state.prod.outputs.vm_web_vm_names
#   vm_disks_info                          = data.terraform_remote_state.prod.outputs.vm_web_disks_info
# }