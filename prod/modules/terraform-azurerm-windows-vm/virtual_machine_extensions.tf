resource "azurerm_virtual_machine_extension" "AzureMonitorWindowsAgent" {
  count                      = var.ama_extension_enabled ? var.vm_count : 0
  name                       = "AzureMonitorWindowsAgent"
  virtual_machine_id         = azurerm_windows_virtual_machine.windows[count.index].id
  publisher                  = "Microsoft.Azure.Monitor"
  type                       = "AzureMonitorWindowsAgent"
  type_handler_version       = var.ama_agent_handler_version
  auto_upgrade_minor_version = var.auto_upgrade_ama_agent

  lifecycle {
    ignore_changes = [
      virtual_machine_id,
    ]
  }

  tags = merge(local.default_tags)
}

resource "azurerm_virtual_machine_extension" "malware" {
  count                      = lower(var.extension_malware) == "true" ? var.vm_count : 0
  name                       = "Malware"
  virtual_machine_id         = azurerm_windows_virtual_machine.windows[count.index].id
  publisher                  = "Microsoft.Azure.Security"
  type                       = "IaaSAntiMalware"
  type_handler_version       = "1.5"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
    {
        "AntimalwareEnabled": "true" ,
        "Exclusions": {
          "Paths": "",
          "Extensions": "",
          "Processes": "${var.av_scan_exclusions_processes}"
       },
        "RealtimeProtectionEnabled": "${var.av_scan_realtime_enabled}",
        "ScheduledScanSettings": {
          "isEnabled": "true",
          "scanType": "${var.av_scan_type}",
          "day": "${var.av_scan_day}",
          "time": "120"
        }
    }
SETTINGS

  tags = merge(local.default_tags)
}

resource "azurerm_virtual_machine_extension" "BGInfo" {
  count                      = lower(var.extension_bginfo) == "true" ? var.vm_count : 0
  name                       = "bginfo"
  virtual_machine_id         = azurerm_windows_virtual_machine.windows[count.index].id
  publisher                  = "Microsoft.Compute"
  type                       = "BGInfo"
  type_handler_version       = "2.1"
  auto_upgrade_minor_version = "true"

  settings = <<SETTINGS
   {
      "outputs":{}
   }
SETTINGS

  tags = merge(local.default_tags)
}

resource "azurerm_virtual_machine_extension" "domainJoin" {
  count                      = lower(var.domain_joined) == "true" ? var.vm_count : 0
  name                       = "domainJoin"
  virtual_machine_id         = azurerm_windows_virtual_machine.windows[count.index].id
  publisher                  = "Microsoft.Compute"
  type                       = "JsonADDomainExtension"
  type_handler_version       = "1.3"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
    {
        "Name": "${var.domain_name}",
        "OUPath": "${var.domain_ou_path}",
        "User": "${var.domain_join_user}@${var.domain_name}",
        "Restart": "true",
        "Options": "3"
    }
SETTINGS


  protected_settings = <<protectedsettings
  {
         "Password": "${var.domain_join_pass}"
  }
protectedsettings

  lifecycle {
    ignore_changes = [
      settings,
      protected_settings,
    ]
  }

  tags = merge(local.default_tags)

  depends_on = [
    azurerm_virtual_machine_extension.BGInfo,
    azurerm_virtual_machine_extension.malware
  ]
}

resource "azurerm_virtual_machine_extension" "custom_script" {
  count                = lower(var.custom_script_enabled) == "true" ? var.vm_count : 0
  name                 = var.custom_script_name
  virtual_machine_id   = azurerm_windows_virtual_machine.windows[count.index].id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

  settings = <<SETTINGS
    {
      "fileUris": ["${join("\",\"", var.extensions_custom_script_fileuris)}"],
      "commandToExecute": "${var.extensions_custom_command}"
    }
SETTINGS

  lifecycle {
    ignore_changes = [settings]
  }

  tags       = merge(local.default_tags)
  depends_on = [azurerm_virtual_machine_extension.domainJoin]
}

# BeyondTrust - start service

resource "azurerm_virtual_machine_extension" "windows_vm" {
  count                      = var.enable_beyondtrust_service ? var.vm_count : 0
  name                       = "${var.hostname}-run-command"
  virtual_machine_id         = azurerm_windows_virtual_machine.windows[count.index].id
  publisher                  = "Microsoft.CPlat.Core"
  type                       = "RunCommandWindows"
  type_handler_version       = "1.1"
  auto_upgrade_minor_version = true

  settings = jsonencode({
    script = tolist(["Set-Service -Name IC3Adapter -StartupType Automatic", "Start-Service -Name IC3Adapter"])
  })

  tags = merge(local.default_tags)
}