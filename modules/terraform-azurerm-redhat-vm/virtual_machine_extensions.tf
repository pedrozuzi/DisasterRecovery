resource "azurerm_virtual_machine_extension" "AzureMonitorLinuxAgent" {
  count                      = var.ama_extension_enabled ? var.vm_count : 0
  name                       = "AzureMonitorLinuxAgent"
  virtual_machine_id         = azurerm_linux_virtual_machine.rhel_vm[count.index].id
  publisher                  = "Microsoft.Azure.Monitor"
  type                       = "AzureMonitorLinuxAgent"
  type_handler_version       = var.ama_agent_handler_version
  auto_upgrade_minor_version = var.auto_upgrade_ama_agent

  lifecycle {
    ignore_changes = [
      virtual_machine_id,
    ]
  }

  tags = merge(local.default_tags)
}

resource "azurerm_virtual_machine_extension" "AADSSHLoginForLinux" {
  count                      = var.aad_login_extension_enabled ? var.vm_count : 0
  name                       = "AADSSHLoginForLinux"
  virtual_machine_id         = azurerm_linux_virtual_machine.rhel_vm[count.index].id
  publisher                  = "Microsoft.Azure.ActiveDirectory"
  type                       = "AADSSHLoginForLinux"
  type_handler_version       = var.aad_agent_handler_version
  auto_upgrade_minor_version = var.auto_upgrade_minor_aad_login

  lifecycle {
    ignore_changes = [
      virtual_machine_id,
    ]
  }

  tags = merge(local.default_tags)

  depends_on = [
    azurerm_virtual_machine_extension.AzureMonitorLinuxAgent,
  ]
}

resource "azurerm_virtual_machine_extension" "custom_script" {
  count                = var.custom_script_enabled ? var.vm_count : 0
  name                 = var.custom_script_name
  virtual_machine_id   = azurerm_linux_virtual_machine.rhel_vm[count.index].name
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = var.custom_script_handler_version

  lifecycle {
    ignore_changes = [
      settings,
      virtual_machine_id,
    ]
  }

  settings = <<SETTINGS
    {
      "fileUris": ["${join("\",\"", var.extensions_custom_script_fileuris)}"],
      "commandToExecute": "${var.extensions_custom_command}"
    }
SETTINGS

  tags       = merge(local.default_tags)
  depends_on = [azurerm_virtual_machine_extension.AADSSHLoginForLinux]
}

# System patching and BoKS Extension --system will reboot automatically after 5 min of the script completion

resource "azurerm_virtual_machine_extension" "run_boks_and_patching_script" {
  count                      = var.vm_count
  name                       = "${var.hostname}-boks-and-patching"
  virtual_machine_id         = azurerm_linux_virtual_machine.rhel_vm[count.index].id
  publisher                  = "Microsoft.Azure.Extensions"
  type                       = "CustomScript"
  type_handler_version       = var.boks_and_patching_script_handler_version
  auto_upgrade_minor_version = var.auto_minor_upgrade_boks_and_patching_handler_version
  protected_settings = jsonencode({
    commandToExecute = tostring(local.boks_and_patching)
  })

  lifecycle {
    ignore_changes = [
      virtual_machine_id,
    ]
  }

  timeouts {
    create = "45m"
  }

  tags = merge(local.default_tags)
}