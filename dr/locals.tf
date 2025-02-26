data "local_file" "app_gateway_script" {
  filename = "C:/Users/usradmin/Documents/Files/Terraform/DisasterRecovery/dr/Scripts/GetApplicationGateway.ps1"
}

data "local_file" "failback_script" {
  filename = "C:/Users/usradmin/Documents/Files/Terraform/DisasterRecovery/dr/Scripts/Failback.ps1"
}

/* locals {
  input = file(data.local_file.app_gateway_script.filename)

  map = {
    clientidtoreplace = "dbc829ea-5a17-4b92-bf13-4cf1c7fc52e3"
  }

  runbook = join("\n", [
    for line in split("\n", local.input) :
      format(
        replace(line, "/{(${join("|", keys(local.map))})}/", "%s"),
        [
          for value in flatten(regexall("{(${join("|", keys(local.map))})}", line)) :
          lookup(local.map, value)
        ]...
      )
  ])
}

output "appgw_start_script" {
  value = local.runbook
}  */
