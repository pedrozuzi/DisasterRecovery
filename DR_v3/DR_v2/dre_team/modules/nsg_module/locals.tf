locals {
  effective_rules = var.use_remote_rules && var.remote_state_config != null ? data.terraform_remote_state.remote_rules[0].outputs.nsg_rules : var.rules

  vm_name = var.nsg_type == "vm" ? format(
    "vm-%s-%s-%s-%s-%s-%s-%d-nic%d",
    var.naming_convention["os"],
    var.naming_convention["prj"],
    var.naming_convention["firm_id"],
    var.naming_convention["env"],
    var.naming_convention["reg"],
    var.naming_convention["app"],
    var.naming_convention["no"],
    var.naming_convention["nic_no"]
  ) : ""

  subnet_name = var.nsg_type == "subnet" ? format(
    "sn-%s-%s-%s-%s-%s-%d",
    var.naming_convention["prj"],
    var.naming_convention["firm_id"],
    var.naming_convention["env"],
    var.naming_convention["reg"],
    var.naming_convention["comp"],
    var.naming_convention["no"]
  ) : ""

  ngs_name = coalesce(local.vm_name, local.subnet_name)

  asg_ids = merge(
    var.asg_id_overrides,
    {
      for asg_name, asg in azurerm_application_security_group.asg :
      asg_name => asg.id
    }
  )

}

locals {
  create_nsg               = var.existing_nsg_name == null
  effective_nsg_id         = local.create_nsg ? azurerm_network_security_group.nsg[0].id : var.existing_nsg_id
  effective_nsg_name       = local.create_nsg ? azurerm_network_security_group.nsg[0].name : var.existing_nsg_name
  effective_nsg_rg_name    = local.create_nsg ? var.resource_group_name : var.existing_nsg_resource_group
}
