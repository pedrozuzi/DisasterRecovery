resource "random_string" "password" {
  length           = 16
  special          = true
  min_special      = 2
  override_special = "/@\\"
}

resource "random_string" "dynamic_hostname" {
  length  = 12
  special = false
}

resource "azurerm_linux_virtual_machine" "rhel_vm" {
  count                        = var.vm_count
  name                         = format("%s%d%s", (var.hostname != "" ? var.hostname : random_string.dynamic_hostname.result), count.index + 1 + var.hostname_count_split, var.domain-suffix)
  location                     = var.region
  license_type                 = var.license_type
  resource_group_name          = var.resource_group_name
  size                         = var.vm_size
  source_image_id              = var.vm_image_id
  availability_set_id          = var.availability_set_ids != null ? element(var.availability_set_ids, count.index) : var.availability_set_id
  custom_data                  = var.vm_custom_data
  user_data                    = var.vm_user_data
  proximity_placement_group_id = var.proximity_placement_group_id
  zone                         = element(var.availability_zones, count.index)

  network_interface_ids = [element(
    azurerm_network_interface.network_interfaces.*.id,
    count.index,
  )]

  identity {
    type         = var.managed_identity_type
    identity_ids = var.user_assigned_managed_identity_ids
  }

  os_disk {
    name                 = format("osdisk-%s%d", (var.hostname != "" ? var.hostname : random_string.dynamic_hostname.result), count.index + 1 + var.hostname_count_split)
    caching              = var.vm_storage_os_disk_caching
    storage_account_type = var.vm_storage_os_disk_type
    disk_size_gb         = var.vm_storage_os_disk_size
  }

  admin_username                  = var.vm_default_admin_username
  admin_password                  = var.vm_default_admin_password != null ? var.vm_default_admin_password : random_string.password.result
  disable_password_authentication = false

  boot_diagnostics {
    storage_account_uri = var.vm_diagnostics_uri
  }

  lifecycle {
    ignore_changes = [
      source_image_id,
      os_disk,
    ]
  }

  tags = merge(
    local.default_tags,
    local.vm_tags,
    var.custom_vm_tags,
    {
      "MaintenanceWindow" = element(var.tag_maintenance_window, count.index)
      "OnHours"           = element(var.tag_on_hours, count.index)
    },
    local.tf_module_tags,
  )
}

resource "azurerm_disk_access" "disk_access" {
  count               = var.managed_disk_sizes != null && var.managed_disk_network_access_policy == "AllowPrivate" && var.disk_access_id == null ? 1 : 0
  name                = var.disk_access_name
  location            = var.region
  resource_group_name = var.resource_group_name

  tags = merge(
    local.default_tags,
    local.managed_disk_tags,
    var.custom_managed_disk_tags,
  )
}

resource "azurerm_managed_disk" "server_managed_disk" {
  count                         = var.managed_disk_sizes != null ? var.vm_count * length(var.managed_disk_sizes) : 0
  name                          = "${azurerm_linux_virtual_machine.rhel_vm[floor(count.index / length(var.managed_disk_sizes))].name}-disk-${count.index % length(var.managed_disk_sizes) + 1}"
  location                      = var.region
  resource_group_name           = var.resource_group_name
  storage_account_type          = var.managed_disk_type
  create_option                 = "Empty"
  disk_size_gb                  = var.managed_disk_sizes[count.index % length(var.managed_disk_sizes)]
  zone                          = var.availability_zones[0] == null ? null : element(var.availability_zones, floor(count.index / length(var.managed_disk_sizes)))
  network_access_policy         = var.managed_disk_network_access_policy
  public_network_access_enabled = var.managed_disk_public_network_access_enabled
  disk_access_id                = var.managed_disk_network_access_policy == "AllowPrivate" && var.disk_access_id == null ? azurerm_disk_access.disk_access[0].id : var.managed_disk_network_access_policy == "AllowPrivate" && var.disk_access_id != null ? var.disk_access_id : null
  disk_iops_read_write          = var.disk_iops == null ? null : var.disk_iops[count.index % length(var.disk_iops)]

  tags = merge(
    local.default_tags,
    local.managed_disk_tags,
    var.custom_managed_disk_tags,
  )
}

resource "azurerm_virtual_machine_data_disk_attachment" "server_managed_disk_attachment" {
  count                     = var.managed_disk_sizes != null ? var.vm_count * length(var.managed_disk_sizes) : 0
  managed_disk_id           = azurerm_managed_disk.server_managed_disk[count.index].id
  virtual_machine_id        = azurerm_linux_virtual_machine.rhel_vm[floor(count.index / length(var.managed_disk_sizes))].id
  lun                       = var.managed_disk_lun + var.managed_disk_lun_increments * (count.index % length(var.managed_disk_sizes))
  caching                   = var.managed_disk_attachment_caching
  create_option             = "Attach"
  write_accelerator_enabled = var.managed_disk_write_accelerator_enabled
}