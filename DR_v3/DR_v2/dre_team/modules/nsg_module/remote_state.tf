data "terraform_remote_state" "remote_rules" {
  count   = var.use_remote_rules && var.remote_state_config != null ? 1 : 0
  backend = "remote"

  config = {
    organization = var.remote_state_config.organization
    workspaces = {
      name = var.remote_state_config.workspace
    }
  }
}