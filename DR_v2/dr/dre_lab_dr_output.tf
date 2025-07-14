#Vnet
output "dre_team_secondary_vnet_id" {
  value = azurerm_virtual_network.dre_team_secondary_vnet.id
}

output "dre_team_secondary_snet_app_id" {
  value = azurerm_subnet.dre_team_secondary_snet_app.id
}

output "dre_team_secondary_snet_app_name" {
  value = azurerm_subnet.dre_team_secondary_snet_app.name
}

#RG
output "dre_team_rg_secondary_app_name" {
  value = azurerm_resource_group.dre_team_rg_secondary_app.name
}

output "dre_team_rg_secondary_app_id" {
  value = azurerm_resource_group.dre_team_rg_secondary_app.id
}

output "dre_team_rg_secondary_web_name" {
  value = azurerm_resource_group.dre_team_rg_secondary_web.name
}

output "dre_team_rg_secondary_web_id" {
  value = azurerm_resource_group.dre_team_rg_secondary_web.id
}

#AS
output "dre_team_secondary_availability_set_vm_app_id" {
  value = azurerm_availability_set.dre_team_secondary_availability_set_vm_app.id
}

output "dre_team_secondary_availability_set_vm_web_id" {
  value = azurerm_availability_set.dre_team_secondary_availability_set_vm_web.id
}


#Recovery Vault
output "dre_team_recovery_vault_name" {
  value = module.dre_team_dr_replication_vault.recovery_vault_name
}

output "dre_team_recovery_vault_rg" {
  value = module.dre_team_dr_replication_vault.recovery_vault_rg
}

output "dre_team_recovery_vault_id" {
  value = module.dre_team_dr_replication_vault.recovery_vault_id
}

output "dre_team_recovery_vault_location" {
  value = module.dre_team_dr_replication_vault.recovery_vault_location
}

output "dre_team_primary_fabric_name" {
  value = module.dre_team_dr_replication_vault.primary_fabric_name
}

output "dre_team_primary_fabric_id" {
  value = module.dre_team_dr_replication_vault.primary_fabric_id
}

output "dre_team_primary_protection_container_name" {
  value = module.dre_team_dr_replication_vault.primary_protection_container_name
}

output "dre_team_primary_protection_container_id" {
  value = module.dre_team_dr_replication_vault.primary_protection_container_id
}

output "dre_team_secondary_fabric_name" {
  value = module.dre_team_dr_replication_vault.secondary_fabric_name
}

output "dre_team_secondary_fabric_id" {
  value = module.dre_team_dr_replication_vault.secondary_fabric_id
}

output "dre_team_secondary_protection_container_name" {
  value = module.dre_team_dr_replication_vault.secondary_protection_container_name
}

output "dre_team_secondary_protection_container_id" {
  value = module.dre_team_dr_replication_vault.secondary_protection_container_id
}

output "dre_team_replication_policy_name" {
  value = module.dre_team_dr_replication_vault.replication_policy_name
}

output "dre_team_replication_policy_id" {
  value = module.dre_team_dr_replication_vault.replication_policy_id
}

output "dre_team_cache_storage_account_id" {
  value = module.dre_team_dr_replication_vault.cache_storage_account_id
}


# output "dre_team_asg_runbook_id" {
#   value = module.dre_team_asr_asg_association.azurerm_automation_runbook_id
# }
