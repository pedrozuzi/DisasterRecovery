
# module "dre_team_vm_app" {
#   source                  = "./dre_team/modules/terraform-azurerm-windows-vm"
#   resource_group_name     = azurerm_resource_group.dre_team_rg_primary_app.name
#   region                  = azurerm_resource_group.dre_team_rg_primary_app.location
#   subnet_id               = azurerm_subnet.dre_team_primary_snet_app.id
#   nsg_id                  = azurerm_network_security_group.dre_team_primary_nsg.id
#   hostname                = var.primary_dre_team_vm_app_name
#   managed_disk_sizes      = ["20"]
#   vm_count                = 1
#   vm_size                 = "Standard_B2ms"
#   vm_image_id             = "/subscriptions/ed3c8e08-540d-4e62-9e45-1bd4a31bb7ad/resourceGroups/shared_image_gallery/providers/Microsoft.Compute/galleries/prod_shared_image_gallery_eastus2/images/Win2019_202408/versions/0.0.1"
#   vm_storage_os_disk_type = "Standard_LRS"
#   vm_timezone             = "Eastern Standard Time"
#   tag_environment_type    = "POC"
#   tag_maintenance_window  = [ var.tag_maintenance_window]
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

# module "vm_web" {
#   source                  = "../../dre_team/modules/terraform-azurerm-windows-vm"
#   resource_group_name     = azurerm_resource_group.dre_team_rg_primary_web.name
#   region                  = azurerm_resource_group.dre_team_rg_primary_web.location
#   subnet_id               = azurerm_subnet.dre_team_primary_snet_app.id
#   nsg_id                  = azurerm_network_security_group.dre_team_primary_nsg.id
#   hostname                = var.primary_vm_web_name
#   #managed_disk_sizes      = ["20"]
#   vm_count                = 1
#   vm_size                 = "Standard_B2ms"
#   vm_image_id             = "/subscriptions/ed3c8e08-540d-4e62-9e45-1bd4a31bb7ad/resourceGroups/shared_image_gallery/providers/Microsoft.Compute/galleries/prod_shared_image_gallery_eastus2/images/Win2019_202408/versions/0.0.1"
#   vm_storage_os_disk_type = "Standard_LRS"
#   vm_timezone             = "Eastern Standard Time"
#   tag_environment_type    = "test"
#   tag_maintenance_window  = ["test"]
#   tag_npi                 = "test"
#   tag_solution_central_id = "test"
#   tag_app_group_email     = "test"
#   tag_tier                = "test"
#   tag_description         = "test"
#   tag_on_hours            = ["test"]
#   tag_expiration_date     = "test"
#   tag_sla                 = "test"
#   tag_webhook             = "test"
#   tag_support_group       = "test"

# }