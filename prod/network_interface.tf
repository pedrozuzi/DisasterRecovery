# resource "azurerm_network_interface" "primary_vm_app_nic" {
#   name                = "vm_app_nic"
#   location            = azurerm_resource_group.rg_primary.location
#   resource_group_name = azurerm_resource_group.rg_primary.name

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = azurerm_subnet.primary_snet_app.id
#     private_ip_address_allocation = "Dynamic"
#   }
# }

# resource "azurerm_network_interface" "primary_vm_db_nic" {
#   name                = "vm_db_nic"
#   location            = azurerm_resource_group.rg_primary.location
#   resource_group_name = azurerm_resource_group.rg_primary.name

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = azurerm_subnet.primary_snet_db.id
#     private_ip_address_allocation = "Dynamic"
#   }
# }

# resource "azurerm_network_interface" "primary_vm_web_nic" {
#   name                = "vm_web_nic"
#   location            = azurerm_resource_group.rg_primary.location
#   resource_group_name = azurerm_resource_group.rg_primary.name

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = azurerm_subnet.primary_snet_app.id
#     private_ip_address_allocation = "Dynamic"
#   }
# }