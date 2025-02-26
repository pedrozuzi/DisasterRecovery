resource "azurerm_network_interface" "network_interfaces" {
  count                           = var.vm_count
  name                            = var.nic_name_overrides != null ? var.nic_name_overrides[count.index] : format("%s%d%s", (var.hostname != "" ? var.hostname : random_string.dynamic_hostname.result), count.index + 1 + var.hostname_count_split, "-nic")
  location                        = var.region
  resource_group_name             = var.resource_group_name
  accelerated_networking_enabled  = var.enable_accelerated_networking

  ip_configuration {
    name                          = var.nic_name_overrides != null ? var.nic_name_overrides[count.index] : format("%s%d%s", (var.hostname != "" ? var.hostname : random_string.dynamic_hostname.result), count.index + 1 + var.hostname_count_split, "-nic-ip-config")
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.ip_addresses != null ? "Static" : "Dynamic"
    private_ip_address            = var.ip_addresses != null ? var.ip_addresses[count.index] : ""
    public_ip_address_id          = var.public_ip_enabled ? element(concat(azurerm_public_ip.public_ips.*.id, [""]), count.index) : null
  }

  tags = merge(local.default_tags, var.custom_nic_tags)
}

resource "azurerm_network_interface_security_group_association" "network_interface_nsg" {
  count                     = var.vm_count
  network_interface_id      = azurerm_network_interface.network_interfaces[count.index].id
  network_security_group_id = var.nsg_id
}

resource "azurerm_public_ip" "public_ips" {
  count               = var.public_ip_enabled ? var.vm_count : 0
  name                = "${var.hostname}${count.index + 1}-pip"
  location            = var.region
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  tags                = merge(local.default_tags, var.custom_pip_tags)
}