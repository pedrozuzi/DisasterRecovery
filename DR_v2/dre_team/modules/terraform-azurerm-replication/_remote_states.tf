# data "terraform_remote_state" "production_gateway_primary_azure" {
#   backend = "remote"

#   config = {
#     hostname     = "vlmaztform01.fisdev.local"
#     organization = "FIS-Cloud-Services"
#     workspaces = {
#       name = "production-gateway-primary-azure"
#     }
#   }
# }
