module "secondary_replication_vault" {
  source               = "../terraform-azurerm-recovery-vault"
  recovery_vault_name  = "${var.client_name}-replication-${var.secondary_region}"
  region               = var.secondary_region
  resource_group_name  = var.dr_rg_name_recovery_vault
  tag_support_group    = var.tag_support_group
  tag_app_group_email  = var.tag_app_group_email
  tag_environment_type = var.tag_environment_type
}
