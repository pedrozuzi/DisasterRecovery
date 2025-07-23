locals {
  
  ngs_name = coalesce(local.vm_name, local.subnet_name)

  vm_name     = var.nsg_type == "vm" ?  format(
    "vm-%s-%s-%s-%s-%s-%s-%d-nic%d",
    var.naming_convention["os"],
    var.naming_convention["prj"],
    var.naming_convention["firm_id"],
    var.naming_convention["env"],
    var.naming_convention["reg"],
    var.naming_convention["app"],
    var.naming_convention["no"],
    var.naming_convention["nic_no"],
  ) : ""

  subnet_name =  var.nsg_type == "subnet" ? format(
    "sn-%s-%s-%s-%s-%s-%d",
    var.naming_convention["prj"],
    var.naming_convention["firm_id"],
    var.naming_convention["env"],
    var.naming_convention["reg"],
    var.naming_convention["comp"],
    var.naming_convention["no"],
  ) : ""


}
