data "terraform_remote_state" "production_boks_fis_internal_prod" {
  backend = "remote"

  config = {
    hostname     = "vlmaztform01.fisdev.local"
    organization = "FIS-Cloud-Services"
    workspaces = {
      name = "production-boks-fis-internal-prod"
    }
  }
}