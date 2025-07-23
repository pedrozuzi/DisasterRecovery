# output "nsg_id" {
#   value = azurerm_network_security_group.nsg.id
# }

output "nsg_rules" {
  value = var.rules
}

output "asg_ids" {
  value = {
    for asg_name, asg in azurerm_application_security_group.asg :
    asg_name => asg.id
  }
  description = "Map of ASG names to their IDs"
}

output "nsg_name" {
  value = local.effective_nsg_name
}

output "nsg_id" {
  value = local.effective_nsg_id
}

output "nsg_resource_group_name" {
  value = local.effective_nsg_rg_name
}
