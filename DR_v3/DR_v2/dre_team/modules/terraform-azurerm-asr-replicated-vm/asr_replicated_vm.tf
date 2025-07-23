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

# resource "azurerm_site_recovery_replicated_vm" "asr_replicated_vm" {
#   count                                     = length(var.vm_names)
#   name                                      = "${element(var.vm_names, count.index)}-rep"
#   resource_group_name                       = var.resource_group_name
#   recovery_vault_name                       = var.secondary_replication_vault_name
#   recovery_replication_policy_id            = var.replication_policy_id
#   source_recovery_fabric_name               = var.primary_fabric_name
#   source_vm_id                              = element(var.vm_ids, count.index)
#   source_recovery_protection_container_name = var.primary_protection_container_name

#   target_resource_group_id                = var.target_resource_group_id
#   target_recovery_fabric_id               = var.secondary_fabric_id
#   target_recovery_protection_container_id = var.secondary_protection_container_id
#   target_availability_set_id              = var.target_availability_set_id

#   network_interface {
#     source_network_interface_id = element(var.nic_ids, count.index)
#     target_subnet_name          = var.dr_compute_cus_subnet_name
#   }

#   managed_disk {
#     disk_id                    = each.value.os_disk_id
#     staging_storage_account_id = var.cache_storage_account_id
#     target_resource_group_id   = var.target_resource_group_id
#     target_disk_type           = var.os_disk_target_disk_type
#     target_replica_disk_type   = var.os_disk_target_replica_disk_type
#   }

#   dynamic "managed_disk" {
#     for_each = each.value.data_disk_ids
#     content {
#       disk_id                    = managed_disk.value
#       staging_storage_account_id = var.cache_storage_account_id
#       target_resource_group_id   = var.target_resource_group_id
#       target_disk_type           = var.os_disk_target_disk_type
#       target_replica_disk_type   = var.os_disk_target_replica_disk_type
#     }
#   }

  // OS Disk
  # managed_disk {
  #   disk_id                    = element(var.os_disk_ids, count.index)
  #   staging_storage_account_id = var.cache_storage_account_id
  #   target_resource_group_id   = var.target_resource_group_id
  #   target_disk_type           = var.os_disk_target_disk_type
  #   target_replica_disk_type   = var.os_disk_target_replica_disk_type
  # }

  // Managed Data Disks

  # dynamic "managed_disk" {
  #   for_each = { for idx, disk_id in var.managed_disk_ids : 
  #     disk_id => {
  #       target_disk_type         = var.managed_disk_target_disk_types[idx]
  #       target_replica_disk_type = var.managed_disk_target_replica_disk_types[idx]
  #     }
  #   }
  #   content {
  #     disk_id                    = managed_disk.key
  #     staging_storage_account_id  = var.cache_storage_account_id
  #     target_resource_group_id    = var.target_resource_group_id
  #     target_disk_type            = managed_disk.value.target_disk_type
  #     target_replica_disk_type    = managed_disk.value.target_replica_disk_type
  #   }
  # }


  # dynamic "managed_disk" {
  #   for_each = zipmap(var.managed_disk_ids, zip(var.managed_disk_target_disk_types, var.managed_disk_target_replica_disk_types))
  #   content {
  #     disk_id                    = managed_disk.key
  #     staging_storage_account_id = var.cache_storage_account_id
  #     target_resource_group_id   = var.target_resource_group_id
  #     target_disk_type           = managed_disk.value[0]
  #     target_replica_disk_type   = managed_disk.value[1]
  #   }
  # }

#   dynamic "managed_disk" {
#   for_each = [for idx in range(length(var.vm_app_managed_disk_ids)) : {
#     disk_id                    = var.vm_app_managed_disk_ids[idx]
#     target_disk_type           = var.managed_disk_target_disk_types[idx]
#     target_replica_disk_type   = var.managed_disk_target_replica_disk_types[idx]
#   }]
#   content {
#     disk_id                    = managed_disk.value.disk_id
#     staging_storage_account_id  = var.cache_storage_account_id
#     target_resource_group_id    = var.target_resource_group_id
#     target_disk_type            = managed_disk.value.target_disk_type
#     target_replica_disk_type    = managed_disk.value.target_replica_disk_type
#   }
# }

# final structure with zipmap:

# variable "managed_disk_ids" {
#   default = ["disk-id-1", "disk-id-2"]
# }

# variable "managed_disk_target_disk_types" {
#   default = ["Standard_LRS", "Premium_LRS"]
# }

# variable "managed_disk_target_replica_disk_types" {
#   default = ["Standard_LRS", "Premium_LRS"]
# }

# after zip function:
# [
#   ["Standard_LRS", "Standard_LRS"],
#   ["Premium_LRS", "Premium_LRS"]
# ]

# after zipmap:
# # {
# #   "disk-id-1" = ["Standard_LRS", "Standard_LRS"],
# #   "disk-id-2" = ["Premium_LRS", "Premium_LRS"]
# # }