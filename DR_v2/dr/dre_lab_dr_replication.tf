module "dre_team_dr_replication_vault" {
  source                    = "../dre_team/modules/terraform-azurerm-replication"
  client_name               = "dreteam2"
  dr_rg_name_recovery_vault = azurerm_resource_group.dre_team_rg_recovery.name #DR
  primary_region            = var.dre_primary_region
  secondary_region          = var.dre_secondary_region
  primary_rg_name_storage   = data.terraform_remote_state.prod.outputs.dre_team_resource_group_primary_storage_name ### PROD
  secondary_rg_name_storage = azurerm_resource_group.dre_team_rg_secondary_storage.name #DR
  source_vnet_id            = data.terraform_remote_state.prod.outputs.dre_team_primary_vnet_id ### PROD
  target_vnet_id            = azurerm_virtual_network.dre_team_secondary_vnet.id #DR
  subnet_ids                = [data.terraform_remote_state.prod.outputs.dre_team_primary_snet_app_id,
                                azurerm_subnet.dre_team_secondary_snet_app.id] #DR and PROD
  tag_support_group         = var.tag_support_group
  tag_app_group_email       = var.tag_app_group_email
  tag_environment_type      = var.tag_environment_type
  tag_expiration_date       = "Never"
  tag_webhook               = "Never"
  tag_sla                   = "99.99"
  tag_npi                   = "False"
}