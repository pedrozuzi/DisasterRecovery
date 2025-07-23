
# to use ASG outside the module
# locals {
#   asg_map = tomap({
#     (data.terraform_remote_state.prod.outputs.asg_ids["asg-app"]) = azurerm_application_security_group.dre_team_app_asg.id
#     (data.terraform_remote_state.prod.outputs.asg_ids["asg-web"]) = azurerm_application_security_group.dre_team_web_asg.id
#     # add more as needed
#   })
# }

# let the module create the ASGs
locals {
  asg_map = tomap({
    (data.terraform_remote_state.prod.outputs.asg_ids["asg-app"]) = module.nsg_remote.asg_ids["asg-app"]
    (data.terraform_remote_state.prod.outputs.asg_ids["asg-web"]) = module.nsg_remote.asg_ids["asg-web"]
  })
}


locals {
  prod_rules = data.terraform_remote_state.prod.outputs.nsg_rules

  dr_rules = [
    for rule in local.prod_rules : {
      name                   = rule.name
      priority               = rule.priority
      direction              = rule.direction
      access                 = rule.access
      protocol               = rule.protocol
      source_port_range      = rule.source_port_range
      destination_port_range = rule.destination_port_range

      # Source ASG (replace or keep)
      source_application_security_group_ids = (
        length(coalesce(rule.source_application_security_group_ids, [])) > 0
        ? [
          for id in rule.source_application_security_group_ids :
          lookup(local.asg_map, id, id)
        ]
        : null
      )

      source_address_prefix = (
        rule.source_address_prefix != null
        ? rule.source_address_prefix
        : null
      )

      source_address_prefixes = (
        length(coalesce(rule.source_address_prefixes, [])) > 0
        ? rule.source_address_prefixes
        : null
      )

      # Destination ASG (replace or keep)
      destination_application_security_group_ids = (
        length(coalesce(rule.destination_application_security_group_ids, [])) > 0
        ? [
          for id in rule.destination_application_security_group_ids :
          lookup(local.asg_map, id, id)
        ]
        : null
      )

      destination_address_prefix = (
        rule.destination_address_prefix != null
        ? rule.destination_address_prefix
        : null
      )

      destination_address_prefixes = (
        length(coalesce(rule.destination_address_prefixes, [])) > 0
        ? rule.destination_address_prefixes
        : null
      )
    }
  ]
}
