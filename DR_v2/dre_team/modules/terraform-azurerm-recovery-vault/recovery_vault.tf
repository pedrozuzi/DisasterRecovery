resource "azurerm_recovery_services_vault" "vault" {
  name                = var.recovery_vault_name
  location            = var.region
  resource_group_name = var.resource_group_name
  sku                 = var.recovery_vault_sku
  storage_mode_type   = lower(var.tag_environment_type)=="production" ? "GeoRedundant" : var.storage_mode_type

  tags = {
    SupportGroup    = var.tag_support_group
    AppGroupEmail   = var.tag_app_group_email
    EnvironmentType = var.tag_environment_type
  }

  lifecycle {
    ignore_changes = [identity]
  }
}
