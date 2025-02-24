# generate a random string (consisting of four characters)
# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
resource "random_string" "rando" {
  length  = 4
  upper   = false
  special = false
}


# Creates Shared Image Gallery
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/shared_image_gallery
resource "azurerm_shared_image_gallery" "sig" {
  name                = "win2019"
  resource_group_name = azurerm_resource_group.rg_images.name
  location            = azurerm_resource_group.rg_images.location
  description         = "Shared images"

  tags = {
    Environment = "Demo"
    Tech        = "Terraform"
  }
}

#Creates image definition
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/shared_image
# resource "azurerm_shared_image" "win2019" {
#   name                = "avd-image"
#   gallery_name        = azurerm_shared_image_gallery.sig.name
#   resource_group_name = azurerm_resource_group.rg_images.name
#   location            = azurerm_resource_group.rg_images.location
#   os_type             = "Windows"

#   identifier {
#     publisher = "MicrosoftWindowsServer"
#     offer     = "WindowsServer"
#     sku       = "2019-datacenter-gensecond"
#   }
# }

# resource "azurerm_shared_image_version" "win2019_v1" {
#   name                = "1.0.0"  # Define a version number
#   gallery_name        = azurerm_shared_image_gallery.sig.name
#   image_name         = azurerm_shared_image.win2019.name
#   resource_group_name = azurerm_resource_group.rg_images.name
#   location            = azurerm_resource_group.rg_images.location

#   target_region {
#     name                   = "eastus2"  # Make sure this matches your VM deployment region
#     regional_replica_count = 1
#     storage_account_type    = "Standard_LRS"
#   }

#   managed_image_id = azurerm_image.win2019.id
# }

# resource "azurerm_image" "win2019" {
#   name                = "win2019-source-image"
#   resource_group_name = azurerm_resource_group.rg_images.name
#   location            = azurerm_resource_group.rg_images.location

#   os_disk {
#     os_type  = "Windows"
#     os_state = "Generalized"
#     blob_uri = "<your-VHD-blob-URI>"
#   }
# }

