locals {
  tfe_dev_ip        = "40.90.245.89"
  tfe_dev_subnet_id = "/subscriptions/d0eff89d-ff78-4c52-be45-e46370c50d94/resourceGroups/dre-rg-primary/providers/Microsoft.Network/virtualNetworks/vnet-primary/subnets/snet-gateway"
  bastion_public_ips = [
    flatten(
      ["40.90.245.89"],
    ),
    flatten(
      ["40.90.245.89"],
    ),
    flatten(
      ["40.90.245.89"],
    ),
  ]
}
