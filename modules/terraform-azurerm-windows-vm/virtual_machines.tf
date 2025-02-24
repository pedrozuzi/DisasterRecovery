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

resource "azurerm_windows_virtual_machine" "windows" {
  count                        = var.vm_count
  name                         = format("%s%s", (var.hostname != "" ? var.hostname : random_string.dynamic_hostname.result), (count.index + 1 + var.hostname_count_split))
  location                     = var.region
  resource_group_name          = var.resource_group_name
  size                         = var.vm_size
  source_image_id              = var.vm_image_id
  admin_username               = var.vm_default_admin_username
  admin_password               = var.vm_default_admin_password != null ? var.vm_default_admin_password : random_string.password.result
  timezone                     = var.vm_timezone
  availability_set_id          = var.availability_set_id
  custom_data                  = var.vm_custom_data
  proximity_placement_group_id = var.proximity_placement_group_id
  zone                         = element(var.availability_zones, count.index)
  license_type                 = var.license_type

  network_interface_ids = [element(
    azurerm_network_interface.network_interfaces.*.id,
    count.index,
  )]

  os_disk {
    name                 = format("osdisk-%s%d", (var.hostname != "" ? var.hostname : random_string.dynamic_hostname.result), count.index + 1 + var.hostname_count_split)
    caching              = var.vm_storage_os_disk_caching
    storage_account_type = var.vm_storage_os_disk_type
  }

  identity {
    type         = var.managed_identity_type
    identity_ids = var.user_assigned_managed_identity_ids
  }

  boot_diagnostics {
    storage_account_uri = var.vm_diagnostics_uri
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

  lifecycle {
    ignore_changes = [
      availability_set_id,
      source_image_id,
      source_image_reference,
      os_disk[0].name,
    ]
  }
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
  count = var.managed_disk_sizes != null ? var.vm_count * length(var.managed_disk_sizes) : 0
  name = "${element(
    azurerm_windows_virtual_machine.windows.*.name,
    lower(var.disk_logic) == "depth_first" ? floor(count.index / length(var.managed_disk_sizes)) : count.index % var.vm_count,
  )}-disk-${lower(var.disk_logic) == "depth_first" ? count.index % length(var.managed_disk_sizes) + 1 : floor(count.index / var.vm_count) + 1}"
  location                      = var.region
  resource_group_name           = var.resource_group_name
  storage_account_type          = var.managed_disk_type
  create_option                 = "Empty"
  disk_size_gb                  = element(var.managed_disk_sizes, lower(var.disk_logic) == "depth_first" ? count.index % length(var.managed_disk_sizes) : floor(count.index / var.vm_count))
  zone                          = var.availability_zones[0] == null ? null : lower(var.disk_logic) == "depth_first" ? element(var.availability_zones, floor(count.index / length(var.managed_disk_sizes))) : element(var.availability_zones, count.index % var.vm_count)
  network_access_policy         = var.managed_disk_network_access_policy
  public_network_access_enabled = var.managed_disk_public_network_access_enabled
  disk_access_id                = var.managed_disk_network_access_policy == "AllowPrivate" && var.disk_access_id == null ? azurerm_disk_access.disk_access[0].id : var.managed_disk_network_access_policy == "AllowPrivate" && var.disk_access_id != null ? var.disk_access_id : null

  tags = merge(
    local.default_tags,
    local.managed_disk_tags,
    var.custom_managed_disk_tags,
  )
}

resource "azurerm_virtual_machine_data_disk_attachment" "server_managed_disk_attachment" {
  count           = var.managed_disk_sizes != null ? var.vm_count * length(var.managed_disk_sizes) : 0
  managed_disk_id = element(azurerm_managed_disk.server_managed_disk.*.id, count.index)
  virtual_machine_id = element(
    azurerm_windows_virtual_machine.windows.*.id,
    lower(var.disk_logic) == "depth_first" ? floor(count.index / length(var.managed_disk_sizes)) : count.index % var.vm_count,
  )
  lun                       = var.managed_disk_lun + var.managed_disk_lun_increments * (lower(var.disk_logic) == "depth_first" ? (count.index % length(var.managed_disk_sizes)) : count.index % var.vm_count)
  caching                   = var.managed_disk_attachment_caching
  create_option             = "Attach"
  write_accelerator_enabled = var.managed_disk_write_accelerator_enabled

  lifecycle {
    ignore_changes = [
      lun,
    ]
  }
}
