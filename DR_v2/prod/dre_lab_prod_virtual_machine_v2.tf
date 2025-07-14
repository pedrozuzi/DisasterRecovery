
module "dre_team_vm_app_2" {
  source                  = "../dre_team/modules/terraform-azurerm-windows-vm-v2"
  resource_group_name     = azurerm_resource_group.dre_team_rg_primary_app.name
  region                  = azurerm_resource_group.dre_team_rg_primary_app.location
  subnet_id               = azurerm_subnet.dre_team_primary_snet_app.id
  nsg_id                  = azurerm_network_security_group.dre_team_primary_nsg.id
  hostname                = var.primary_dre_team_vm_app_name
  managed_disk_sizes      = ["30", "30", "40"]
  vm_count                = 2
  hostname_count_split    = 1
  vm_size                 = "Standard_B2ms"
  vm_image_id             = "/subscriptions/d0eff89d-ff78-4c52-be45-e46370c50d94/resourceGroups/rg-images/providers/Microsoft.Compute/galleries/win2019/images/image-definition-standard/versions/0.0.1"
  vm_storage_os_disk_type = "Standard_LRS"
  vm_timezone             = "Eastern Standard Time"
  tag_environment_type    = "POC"
  tag_maintenance_window  = [var.tag_maintenance_window]
  tag_npi                 = var.tag_npi
  tag_solution_central_id = var.tag_solution_central_id
  tag_app_group_email     = var.tag_app_group_email
  tag_tier                = var.tag_tier
  tag_description         = var.tag_description
  tag_on_hours            = [var.tag_on_hours]
  tag_expiration_date     = var.tag_expiration_date
  tag_sla                 = var.tag_sla
  tag_webhook             = "Never"
  tag_support_group       = var.tag_support_group
  
  #replication

  enable_replication                        = true
  replication_dr_rg_name_recovery_vault     = data.terraform_remote_state.dr.outputs.dre_team_recovery_vault_rg
  replication_target_availability_set_id    = data.terraform_remote_state.dr.outputs.dre_team_secondary_availability_set_vm_app_id
  replication_target_resource_group_id      = data.terraform_remote_state.dr.outputs.dre_team_rg_secondary_app_id
  replication_target_recovery_fabric_id     = data.terraform_remote_state.dr.outputs.dre_team_secondary_fabric_id
  replication_secondary_protection_container_id         = data.terraform_remote_state.dr.outputs.dre_team_secondary_protection_container_id
  replication_replication_policy_id = data.terraform_remote_state.dr.outputs.dre_team_replication_policy_id
  replication_primary_protection_container_name = data.terraform_remote_state.dr.outputs.dre_team_primary_protection_container_name
  replication_secondary_fabric_id = data.terraform_remote_state.dr.outputs.dre_team_secondary_fabric_id
  replication_primary_fabric_name = data.terraform_remote_state.dr.outputs.dre_team_primary_fabric_name
  replication_dr_compute_cus_subnet_name    = data.terraform_remote_state.dr.outputs.dre_team_secondary_snet_app_name
  replication_recovery_vault_name = data.terraform_remote_state.dr.outputs.dre_team_recovery_vault_name
  replication_cache_storage_account_id = data.terraform_remote_state.dr.outputs.dre_team_cache_storage_account_id
}


# module "dre_team_vm_web_2" {
#   source                  = "../dre_team/modules/terraform-azurerm-windows-vm-v2"
#   resource_group_name     = azurerm_resource_group.dre_team_rg_primary_web.name
#   region                  = azurerm_resource_group.dre_team_rg_primary_web.location
#   subnet_id               = azurerm_subnet.dre_team_primary_snet_app.id
#   nsg_id                  = azurerm_network_security_group.dre_team_primary_nsg.id
#   hostname                = var.primary_dre_team_vm_web_name
#   managed_disk_sizes      = ["20", "30", "40"]
#   vm_count                = 2
#   hostname_count_split    = 1
#   vm_size                 = "Standard_B2ms"
#   vm_image_id             = "/subscriptions/d0eff89d-ff78-4c52-be45-e46370c50d94/resourceGroups/rg-images/providers/Microsoft.Compute/galleries/win2019/images/image-definition-standard/versions/0.0.1"
#   vm_storage_os_disk_type = "Standard_LRS"
#   vm_timezone             = "Eastern Standard Time"
#   tag_environment_type    = "POC"
#   tag_maintenance_window  = [var.tag_maintenance_window]
#   tag_npi                 = var.tag_npi
#   tag_solution_central_id = var.tag_solution_central_id
#   tag_app_group_email     = var.tag_app_group_email
#   tag_tier                = var.tag_tier
#   tag_description         = var.tag_description
#   tag_on_hours            = [var.tag_on_hours]
#   tag_expiration_date     = var.tag_expiration_date
#   tag_sla                 = var.tag_sla
#   tag_webhook             = "Never"
#   tag_support_group       = var.tag_support_group
  
#   #replication
#   replication = local.replication_vm_web
# }

# module "dre_team_vm_web" {
#   source                  = "../dre_team/modules/terraform-azurerm-windows-vm-v2"
#   resource_group_name     = azurerm_resource_group.dre_team_rg_primary_web.name
#   region                  = azurerm_resource_group.dre_team_rg_primary_web.location
#   subnet_id               = azurerm_subnet.dre_team_primary_snet_app.id
#   nsg_id                  = azurerm_network_security_group.dre_team_primary_nsg.id
#   hostname                = var.primary_dre_team_vm_web_name
#   managed_disk_sizes      = ["20", "30", "40"]
#   vm_count                = 1
#   vm_size                 = "Standard_B2ms"
#   vm_image_id             = "/subscriptions/d0eff89d-ff78-4c52-be45-e46370c50d94/resourceGroups/rg-images/providers/Microsoft.Compute/galleries/win2019/images/image-definition-standard/versions/0.0.1"
#   vm_storage_os_disk_type = "Standard_LRS"
#   vm_timezone             = "Eastern Standard Time"
#   tag_environment_type    = "POC"
#   tag_maintenance_window  = [var.tag_maintenance_window]
#   tag_npi                 = var.tag_npi
#   tag_solution_central_id = var.tag_solution_central_id
#   tag_app_group_email     = var.tag_app_group_email
#   tag_tier                = var.tag_tier
#   tag_description         = var.tag_description
#   tag_on_hours            = [var.tag_on_hours]
#   tag_expiration_date     = var.tag_expiration_date
#   tag_sla                 = var.tag_sla
#   tag_webhook             = "Never"
#   tag_support_group       = var.tag_support_group
# }