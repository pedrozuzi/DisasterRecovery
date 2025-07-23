locals {

  default_tags = {
    SupportGroup    = var.tag_support_group
    AppGroupEmail   = var.tag_app_group_email
    EnvironmentType = var.tag_environment_type
  }
  # tf_module_tags = {
  #   TF_ModuleName    = "azurerm-ms-sql-paas"
  #   TF_ModuleVersion = "1.0.1"
  # }

}
