locals {
  app_nsg_rules = [
    {
      name        = "AllowHTTPSFromWebToApp"
      priority    = 200
      direction   = "Inbound"
      access      = "Allow"
      protocol    = "Tcp"
      source_port_range      = "*"
      destination_port_range = "443"
      source_application_security_group_ids = [
        module.nsg_local.asg_ids["asg-web"]
      ]
      destination_application_security_group_ids = [
        module.nsg_local.asg_ids["asg-app"]
      ]
    },
    {
      name                       = "AllowSQLRange"
      priority                   = 300
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433-1434"
      source_address_prefix      = "10.0.0.0/24"
      destination_address_prefix = "*"
    },
    {
      name                   = "AllowFromMultipleIPs"
      priority               = 400
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "Tcp"
      source_port_range      = "*"
      destination_port_range = "8443"
      source_address_prefixes = [
        "203.0.113.10",
        "198.51.100.25",
        "192.0.2.0/28"
      ]
      destination_address_prefix = "*"
    },
    {
      name        = "allowAppToVnet"
      priority    = 500
      direction   = "Inbound"
      access      = "Allow"
      protocol    = "Tcp"
      source_port_range      = "*"
      destination_port_range = "*"
      source_application_security_group_ids = [
        module.nsg_local.asg_ids["asg-app"]
      ]
      destination_address_prefix = "10.0.0.0/8"
    },
    {
      name        = "Allow_app_web"
      priority    = 600
      direction   = "Inbound"
      access      = "Allow"
      protocol    = "Tcp"
      source_port_range      = "*"
      destination_port_range = "443"
      source_application_security_group_ids = [
        module.nsg_local.asg_ids["asg-web"],
        module.nsg_local.asg_ids["asg-app"]
      ]
      destination_application_security_group_ids = [
        module.nsg_local.asg_ids["asg-web"],
        module.nsg_local.asg_ids["asg-app"]
      ]
    }
  ]
}


