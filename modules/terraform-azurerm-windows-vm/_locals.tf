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
