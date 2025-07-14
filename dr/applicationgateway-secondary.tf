# resource "azurerm_public_ip" "secondary_public_ip_appgw" {
#   name                = "secondary_public_ip_appgw"
#   resource_group_name = azurerm_resource_group.rg_secondary.name
#   location            = azurerm_resource_group.rg_secondary.location
#   allocation_method   = "Static"
#   sku                 = "Standard"
#   ip_version          = "IPv4"
# }

# resource "azurerm_application_gateway" "secondary_appgw" {
#   name                = "secondary_appgw"
#   resource_group_name = azurerm_resource_group.rg_secondary.name
#   location            = azurerm_resource_group.rg_secondary.location

#   probe {
#     name                = "probe-secondary"
#     host                = "10.100.0.4"
#     interval            = "5"
#     path                = "/"
#     protocol            = "Http"
#     timeout             = "10"
#     unhealthy_threshold = "3"
#   }

#   backend_http_settings {
#     name                  = "be-secondary"
#     affinity_cookie_name  = "ApplicationGatewayAffinity"
#     port                  = "80"
#     probe_name            = "probe-secondary"
#     protocol              = "Http"
#     cookie_based_affinity = "Enabled"
#     request_timeout       = "50"
#   }

#   backend_address_pool {
#     name         = "be-secondary"
#     ip_addresses = ["10.100.0.4"]
#   }

#   frontend_ip_configuration {
#     name                 = "fe-ip-secondary"
#     public_ip_address_id = azurerm_public_ip.secondary_public_ip_appgw.id
#   }

#   frontend_port {
#     name = "fe-port-secondary"
#     port = "80"
#   }

#   gateway_ip_configuration {
#     name      = "gw-ip-secondary"
#     subnet_id = azurerm_subnet.secondary_snet_app_gateway.id
#   }

#   http_listener {
#     name                           = "http-listener-80"
#     frontend_ip_configuration_name = "fe-ip-secondary"
#     frontend_port_name             = "fe-port-secondary"
#     protocol                       = "Http"
#   }

#   request_routing_rule {
#     name                       = "default-rule"
#     rule_type                  = "Basic"
#     priority                   = "1"
#     http_listener_name         = "http-listener-80"
#     backend_http_settings_name = "be-secondary"
#     backend_address_pool_name  = "be-secondary"
#   }

#   sku {
#     name     = "Standard_v2"
#     tier     = "Standard_v2"
#     capacity = "1"
#   }
# }