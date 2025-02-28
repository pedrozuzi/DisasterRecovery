resource "azurerm_public_ip" "primary_public_ip_appgw" {
  name                = "primary_public_ip_appgw"
  resource_group_name = azurerm_resource_group.rg_primary.name
  location            = azurerm_resource_group.rg_primary.location
  allocation_method   = "Static"
  sku                 = "Standard"
  ip_version          = "IPv4"
}

resource "azurerm_application_gateway" "primary_appgw" {
  name                = "primary_appgw"
  resource_group_name = azurerm_resource_group.rg_primary.name
  location            = azurerm_resource_group.rg_primary.location

  probe {
    name                = "probe-primary"
    host                = "10.0.0.4"
    interval            = "5"
    path                = "/"
    protocol            = "Http"
    timeout             = "10"
    unhealthy_threshold = "3"
  }

  backend_http_settings {
    name                  = "be-primary"
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    port                  = "80"
    probe_name            = "probe-primary"
    protocol              = "Http"
    cookie_based_affinity = "Enabled"
    request_timeout       = "50"
  }

  backend_address_pool {
    name         = "be-primary"
    ip_addresses = ["10.0.0.4"]
  }

  frontend_ip_configuration {
    name                 = "fe-ip-primary"
    public_ip_address_id = azurerm_public_ip.primary_public_ip_appgw.id
  }

  frontend_port {
    name = "fe-port-primary"
    port = "80"
  }

  gateway_ip_configuration {
    name      = "gw-ip-primary"
    subnet_id = azurerm_subnet.primary_snet_app_gateway.id
  }

  http_listener {
    name                           = "http-listener-80"
    frontend_ip_configuration_name = "fe-ip-primary"
    frontend_port_name             = "fe-port-primary"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "default-rule"
    rule_type                  = "Basic"
    priority                   = "1"
    http_listener_name         = "http-listener-80"
    backend_http_settings_name = "be-primary"
    backend_address_pool_name  = "be-primary"
  }

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = "1"
  }
}