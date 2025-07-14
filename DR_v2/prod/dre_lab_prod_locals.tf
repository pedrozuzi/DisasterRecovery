locals {
  replication_defaults = {
    enable                            = true
    dr_rg_name_recovery_vault         = data.terraform_remote_state.dr.outputs.dre_team_recovery_vault_rg
    target_recovery_fabric_id         = data.terraform_remote_state.dr.outputs.dre_team_secondary_fabric_id
    secondary_protection_container_id = data.terraform_remote_state.dr.outputs.dre_team_secondary_protection_container_id
    replication_policy_id             = data.terraform_remote_state.dr.outputs.dre_team_replication_policy_id
    primary_protection_container_name = data.terraform_remote_state.dr.outputs.dre_team_primary_protection_container_name
    secondary_fabric_id               = data.terraform_remote_state.dr.outputs.dre_team_secondary_fabric_id
    primary_fabric_name               = data.terraform_remote_state.dr.outputs.dre_team_primary_fabric_name
    recovery_vault_name               = data.terraform_remote_state.dr.outputs.dre_team_recovery_vault_name
    cache_storage_account_id          = data.terraform_remote_state.dr.outputs.dre_team_cache_storage_account_id
  }
}

locals {
  replication_vm_web = merge(
    local.replication_defaults,
    {
      target_availability_set_id     = data.terraform_remote_state.dr.outputs.dre_team_secondary_availability_set_vm_web_id
      target_resource_group_id       = data.terraform_remote_state.dr.outputs.dre_team_rg_secondary_web_id
      dr_compute_cus_subnet_name     = data.terraform_remote_state.dr.outputs.dre_team_secondary_snet_app_name
    }
  )

  replication_vm_app = merge(
    local.replication_defaults,
    {
      target_availability_set_id     = data.terraform_remote_state.dr.outputs.dre_team_secondary_availability_set_vm_app_id
      target_resource_group_id       = data.terraform_remote_state.dr.outputs.dre_team_rg_secondary_app_id
      dr_compute_cus_subnet_name     = data.terraform_remote_state.dr.outputs.dre_team_secondary_snet_app_name
    }
  )
}
