resource "azurerm_storage_account" "primary" {
  name                             = "${var.client_name}recoverycache"
  location                         = var.primary_region
  resource_group_name              = var.primary_rg_name_storage
  account_tier                     = var.storage_account_type
  account_replication_type         = var.storage_account_replication_type
  https_traffic_only_enabled       = var.storage_account_https_traffic_only
  min_tls_version                  = var.storage_account_min_tls_version
  public_network_access_enabled    = var.storage_account_public_network_access_enabled
  allow_nested_items_to_be_public  = var.storage_account_allow_nested_items_to_be_public
  cross_tenant_replication_enabled = var.storage_account_cross_tenant_replication_enabled

  network_rules {
    default_action             = "Deny"
    ip_rules                   = flatten([local.tfe_dev_ip, local.bastion_public_ips])
    virtual_network_subnet_ids = split(",", lower(var.primary_region) == "eastus2" || lower(var.primary_region) == "centralus" ? join(",", concat([local.tfe_dev_subnet_id], var.subnet_ids)) : join(",", var.subnet_ids), )
  }

  tags = {
    SupportGroup    = var.tag_support_group
    AppGroupEmail   = var.tag_app_group_email
    EnvironmentType = var.tag_environment_type
    SLA             = var.tag_sla
    ExpirationDate  = var.tag_expiration_date
    NPI             = var.tag_npi
  }
}

resource "azurerm_storage_account" "secondary" {
  name                             = "${var.client_name}secreccache"
  location                         = var.primary_region
  resource_group_name              = var.primary_rg_name_storage
  account_tier                     = var.storage_account_type
  account_replication_type         = var.storage_account_replication_type
  https_traffic_only_enabled       = var.storage_account_https_traffic_only
  min_tls_version                  = var.storage_account_min_tls_version
  public_network_access_enabled    = var.storage_account_public_network_access_enabled
  allow_nested_items_to_be_public  = var.storage_account_allow_nested_items_to_be_public
  cross_tenant_replication_enabled = var.storage_account_cross_tenant_replication_enabled

  network_rules {
    default_action             = "Deny"
    ip_rules                   = flatten([local.tfe_dev_ip, local.bastion_public_ips])
    virtual_network_subnet_ids = split(",", lower(var.primary_region) == "eastus2" || lower(var.primary_region) == "centralus" ? join(",", concat([local.tfe_dev_subnet_id], var.subnet_ids)) : join(",", var.subnet_ids), )
  }

  lifecycle {
    ignore_changes = [
      name,
    ]
  }

  tags = {
    SupportGroup    = var.tag_support_group
    AppGroupEmail   = var.tag_app_group_email
    EnvironmentType = var.tag_environment_type
    SLA             = var.tag_sla
    ExpirationDate  = var.tag_expiration_date
    NPI             = var.tag_npi
  }
}
