locals {
  default_tags = {
    // BUC             = var.tag_buc
    SupportGroup    = var.tag_support_group
    AppGroupEmail   = var.tag_app_group_email
    EnvironmentType = var.tag_environment_type
    // CustomerCRMID   = var.tag_customer_crmid
  }

  vm_tags = {
    ExpirationDate    = var.tag_expiration_date
    Tier              = var.tag_tier
    SolutionCentralID = var.tag_solution_central_id
    SLA               = var.tag_sla
    Description       = var.tag_description
  }

  tf_module_tags = {
    TF_ModuleName    = "windows-vm"
    TF_ModuleVersion = "1.2.0"
  }

  managed_disk_tags = {
    NPI            = var.tag_npi
    ExpirationDate = var.tag_expiration_date
    SLA            = var.tag_sla
  }
}


data "azurerm_client_config" "current" {}

locals {
  scriptName     = "initialize_new_disks.ps1"
  scriptRendered = filebase64("${path.module}/scripts/${local.scriptName}")

  commandToExecute = jsonencode({
    commandToExecute = "powershell.exe -ExecutionPolicy Bypass -Command \"${replace(file("${path.module}/scripts/initialize_new_disks.ps1"), "\"", "`\"")}\""
  })
}

locals {
  vm_disks_info = [
    for idx, vm in azurerm_windows_virtual_machine.windows : {
      vm_name       = vm.name
      os_disk_id    = vm.os_disk[0].id
      data_disk_ids = [
        for disk in azurerm_managed_disk.server_managed_disk :
        disk.id if startswith(disk.name, "${vm.name}-disk-")
      ]
    }
  ]
}
