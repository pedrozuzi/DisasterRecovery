data "local_file" "app_gateway_script" {
  filename = "C:/Users/usradmin/Documents/Files/Terraform/DisasterRecovery/Scripts/GetApplicationGateway.ps1"
}

data "local_file" "failback_script" {
  filename = "C:/Users/usradmin/Documents/Files/Terraform/DisasterRecovery/Scripts/Failback.ps1"
}