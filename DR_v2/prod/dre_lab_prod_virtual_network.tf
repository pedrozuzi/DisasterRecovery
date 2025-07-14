resource "azurerm_virtual_network" "dre_team_primary_vnet" {
  name                = var.dre_team_primary_vnet_name
  location            = azurerm_resource_group.dre_team_rg_primary.location
  resource_group_name = azurerm_resource_group.dre_team_rg_primary.name
  address_space       = var.dre_team_primary_vnet_address_space

  tags = {
    BUC             = var.tag_buc
    SupportGroup    = var.tag_support_group
    AppGroupEmail   = var.tag_app_group_email
    EnvironmentType = var.tag_environment_type
    CustomerCRMID   = var.tag_customer_crmid
    ExpirationDate  = "Never"
    Webhook         = "N/A"
  }
}

# resource "azurerm_virtual_network_peering" "dre_team_primary_vnet_to_secondary_vnet" {
#   name                      = "dre_team_primary_vnet_to_secondary_vnet"
#   resource_group_name       = azurerm_resource_group.dre_team_rg_primary.name
#   virtual_network_name      = azurerm_virtual_network.dre_team_primary_vnet.name
#   remote_virtual_network_id = data.terraform_remote_state.dr.outputs.secondary_vnet_id
# }