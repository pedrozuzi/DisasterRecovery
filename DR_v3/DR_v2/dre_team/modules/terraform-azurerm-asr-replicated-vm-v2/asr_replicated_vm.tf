resource "azurerm_site_recovery_replicated_vm" "asr_replicated_vm" {
  count                                     = length(var.vm_names)
  name                                      = "${var.vm_names[count.index]}-rep"
  resource_group_name                       = var.resource_group_name
  recovery_vault_name                       = var.secondary_replication_vault_name
  recovery_replication_policy_id            = var.replication_policy_id
  source_recovery_fabric_name               = var.primary_fabric_name
  source_vm_id                              = var.vm_ids[count.index]
  source_recovery_protection_container_name = var.primary_protection_container_name

  target_resource_group_id                = var.target_resource_group_id
  target_recovery_fabric_id               = var.secondary_fabric_id
  target_recovery_protection_container_id = var.secondary_protection_container_id
  target_availability_set_id              = var.target_availability_set_id
  target_virtual_machine_size             = var.vm_sizes[count.index]

  network_interface {
    source_network_interface_id = var.nic_ids[count.index]
    target_subnet_name          = var.dr_compute_cus_subnet_name
  }

  # Fixing OS Disk
  managed_disk {
    disk_id                    = var.vm_disks_info[count.index].os_disk_id
    staging_storage_account_id = var.cache_storage_account_id
    target_resource_group_id   = var.target_resource_group_id
    target_disk_type           = var.os_disk_target_disk_type
    target_replica_disk_type   = var.os_disk_target_replica_disk_type
  }

  # Fixing Data Disks
  dynamic "managed_disk" {
    for_each = var.vm_disks_info[count.index].data_disk_ids
    content {
      disk_id                    = managed_disk.value
      staging_storage_account_id = var.cache_storage_account_id
      target_resource_group_id   = var.target_resource_group_id
      target_disk_type           = var.os_disk_target_disk_type
      target_replica_disk_type   = var.os_disk_target_replica_disk_type
    }
  }
}