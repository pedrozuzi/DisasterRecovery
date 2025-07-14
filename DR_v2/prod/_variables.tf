/**
 * File provided as part of base bitbucket scaffolding
 * this file should contain input variables.
 */


variable "primary_region" {
  description = "Azure region with which to deploy resources"
  type        = string
  default     = "eastus"
}

variable "secondary_region" {
  description = "Azure region with wich to deploy dr resources"
  type        = string
  default     = "centralus"
}

variable "vm_timezone" {
  description = "Timezone in which the Virtual Machine will be deployed. Azure requires specific values which can be found here: https://docs.microsoft.com/en-us/previous-versions/windows/embedded/gg154758(v=winembedded.80)"
  type        = string
  default     = "Eastern Standard Time"
}

variable "vm_sku" {
  description = "OS SKU for deployment. Current options are 2016-datacenter, 2019-datacenter (for Windows2016, Windows2019)"
  type        = string
  default     = "VM_SKU"
}

variable "vm_storage_os_disk_type" {
  description = "Disk type for the VMs' OS disk."
  type        = string
  default     = "Standard_LRS"
}

variable "domain_joined" {
  description = "Should the VM be joined to the prod.cloud domain."
  type        = bool
  default     = true
}

variable "domain_name" {
  description = "Name of the prod.cloud domain."
  type        = string
  default     = "prod.cloud"
}

# variable "varset_domain_join_username" {}

# variable "varset_domain_join_pass" {}

variable "domain_ou_path_servers" {
  default = "OU=Servers,OU=FIS Internal CIO Managed Lab TEST,OU=FIS Internal CIO Managed Lab,OU=CIO Managed Lab,OU=Customers,DC=prod,DC=cloud"
}

variable "vm_public_ip_enabled" {
  default = "false"
}

// Tags

variable "tag_buc" {
  description = "The Business Unit Code associated with the group responsible for the deployed asset."
  default     = "3201.501026.9425..0000.0000.0000"
}

variable "tag_support_group" {
  description = "The name of the group responsible for the deployed asset."
  default     = "FIS IDS-IPS"
}

variable "tag_app_group_email" {
  description = "The email address for the operations team responsible for the deployed asset."
  default     = "Security-IDS-IPS@fisglobal.com"
}

variable "tag_environment_type" {
  description = "The tier of environment for the application -- this is separate from the service level defined at the subscription level."
  default     = "Production"
}

variable "tag_customer_crmid" {
  description = "The end customer of the system and the CRM ID of the end customer of the system."
  default     = "FIS 6015"
}

variable "tag_expiration_date" {
  default = "Never"
}

variable "tag_tier" {
  default = "App"
}

variable "tag_maintenance_window" {
  default = "Never"
}

variable "tag_on_hours" {
  default = "Always"
}

variable "tag_sla" {
  default = "99.99"
}

variable "tag_solution_central_id" {
  default = "10001887"
}

variable "tag_npi" {
  default = "False"
}

variable "tag_ELS_RH7_Cost_Alloc" {
  type    = string
  default = "True"
}

variable "tag_maintenance_window_jumpbox" {
  description = "The timeframe that a server can be patched for updates by OMS."
  default     = ["*/05-10/*/*/0"]
}

variable "tag_on_hours_jumpbox" {
  description = "The time (in UTC) which the virtual machine is required to run, otherwise will be shutdown."
  default     = ["Always"]
}

/*

Comments:
---------
All Uppercase full values below used in the file should be replaced with the intended object value, these are the values requiring replacement in the file:
1- XXX: indicate generic value as numbers or description
2- REGION
3- TIMEZONE
4- VM_SKU - Only used if vm_image_id passed is null
5- STORAGE_TIER
*/




//Globant
variable "sql_data_disk_size" {
  description = "Manually specified size of the SQL Data data disks. This value is also used to create default calculated Log and TempDB disk sizes."
  type        = string

  default = 100
}

variable "sql_log_disk_size" {
  description = "Manually specified size of the SQL Log disks. If this value is not specified, the calculated value is used."
  type        = string
  default     = null
}

variable "sql_temp_db_disk_size" {
  description = "Manually specified size of the SQL TempDB data disks. If this value is not specified, the calculated value is used."
  type        = string
  default     = null
}

variable "hostname" {
  description = "**OPTIONAL**: Name of the VMs to create. If not specified, a random hostname will be assigned"
  type        = string
  default     = "CIOLABTWINSQL"
}

variable "hostname_count_split" {
  type    = string
  default = "0"
}

variable "enable_accelerated_networking" {
  description = "**OPTIONAL**: Should accelerated networking be enabled?"
  type        = bool
  default     = false
}

// variable "subnet_id" {
//   description = "ID of the Subnet in which the machines will exist"
//   type        = string
// }

//variable "ip_addresses" {
//  description = "**OPTIONAL**: A list of Private IP Addresses to assign the network interfaces. If not specified, dynamic IPs will be assigned"
//  type        = list(string)
//  default     = null
//}

variable "public_ip_enabled" {
  description = "**OPTIONAL**: Determines if Public IPs are enabled for Network Interfaces"
  type        = bool
  default     = false
}

variable "vm_count" {
  description = "**OPTIONAL**: The number of VMs to deploy"
  type        = number
  default     = 1
}

// variable "nsg_id" {
//   description = "ID of the NSG to associate the network interface"
//   type        = string
// }

variable "password" {
  description = "Password"
  type        = string
  default     = "Gl0bantT3am"
}

variable "username" {
  description = "username"
  type        = string
  default     = "globant"
}

variable "azure_vm_size" {
  default     = "Standard_D2s_v3"
  description = "Specify the VM Size"
}

variable "tag_description" {
  description = "**OPTIONAL**: A user defined description of the server's purpose"
  default     = "SQL Server"
}

variable "custom_vm_tags" {
  description = "**OPTIONAL**: Map of custom tags to add to the VMs"
  type        = map(string)
  default     = {}
}

variable "custom_managed_disk_tags" {
  description = "**OPTIONAL**: Map of custom tags to add to the managed disks"
  type        = map(string)
  default     = {}
}

variable "custom_nic_tags" {
  description = "**OPTIONAL**: Map of custom tags to add to the network interfaces"
  type        = map(string)
  default     = {}
}

variable "custom_pip_tags" {
  description = "**OPTIONAL**: Map of custom tags to add to the public IPs"
  type        = map(string)
  default     = {}
}

variable "tag_exception" {
  description = "Exception"
  default     = "ExceptionValue"
}

variable "availability_set_id" {
  description = "**OPTIONAL**: The ID of an existing availability set."
  type        = string
  default     = null
}

variable "proximity_placement_group_id" {
  description = "(Optional) The ID of the Proximity Placement Group which the Virtual Machine should be assigned to. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "availability_zones" {
  description = "The availability zones that the VM should be deployed into. Required if 'availability_set_id' is not set."
  type        = list(number)
  default     = [null]
}

variable "vm_storage_os_disk_caching" {
  description = "**OPTIONAL**: Caching requirements for the OS disk"
  type        = string
  default     = "ReadWrite"
}

variable "managed_disk_type" {
  description = "**OPTIONAL**: The type of managed disks to attach to the VMs"
  type        = string
  default     = "Premium_LRS"
}

variable "vm_publisher" {
  description = "**OPTIONAL**: Publisher of the VM image"
  type        = string
  default     = "MicrosoftSQLServer"
}

variable "vm_offer" {
  description = "**OPTIONAL**: Offer of the VM image"
  type        = string
  default     = "SQL2019-WS2019"
}

// variable "vm_sku" {
//   description = "**OPTIONAL**: Sku of the VM image"
//   type        = string
//   default     = "enterprisedbengineonly"
// }

variable "vm_version" {
  description = "**OPTIONAL**: Version of the VM image"
  type        = string
  default     = "latest"
}

variable "vm_default_admin_username" {
  description = "**OPTIONAL**: Name of the local admin account"
  type        = string
  default     = "globant"
}

variable "vm_default_admin_password" {
  description = "**OPTIONAL**: Password of the local admin account. If not specified, a random password will be assigned"
  type        = string
  default     = "Gl0bantT3am"
}

variable "vm_diagnostics_uri" {
  description = "**OPTIONAL**: The URI of the diagnostic storage account. Required if vm_boot_diagnostics is true"
  type        = string
  default     = null
}

variable "extension_loganalytics" {
  description = "**OPTIONAL**: Should Log Analytics agent be attached to all servers"
  type        = bool
  default     = true
}

variable "log_analytics_workspace_id" {
  description = "**OPTIONAL**: Workspace ID of the Log Analytics Workspace to associate the VMs with"
  type        = string
  default     = null
  # default = "3e2e219e-029d-4187-923c-bd3cfcda981d"
}

variable "log_analytics_workspace_primary_shared_key" {
  description = "**OPTIONAL**: Primary Shared Key of the Log Analytics Workspace to associate the VMs with"
  type        = string
  default     = null
  # default = "CVZS6hEj0Nfjh2aRaowrMy/kHNnEHl5FSSpvlbZQBGF7hdf8a835VMFDOdWrz28AU6kzSPOlEbuFj9x07qbDZA=="
}

variable "extension_bginfo" {
  description = "**OPTIONAL**: Should BGInfo be attached to all servers"
  type        = bool
  default     = true
}

variable "extension_malware" {
  description = "**OPTIONAL**: Should Malware be attached to all servers"
  type        = bool
  default     = false ###Change to false, failing malware
}

variable "extension_insights" {
  description = "**OPTIONAL**: Should VM Insights agent be attached to all servers"
  type        = bool
  default     = true
}

variable "av_scan_day" {
  description = "**OPTIONAL**: Day of the week for Malware to scan"
  type        = string
  default     = "7"
}

variable "av_scan_type" {
  description = "**OPTIONAL**: Type of Malware scan"
  type        = string
  default     = "quick"
}

variable "av_scan_exclusions_processes" {
  description = "**OPTIONAL**: Scan exclusion processes for Malware"
  type        = string
  default     = "taskmgr.exe"
}

variable "av_scan_realtime_enabled" {
  description = "**OPTIONAL**: Is realtime scanning enabled for Malware"
  type        = bool
  default     = true
}

variable "custom_script_enabled" {
  description = "**OPTIONAL**: Should CustomScriptExtension be attached to all servers"
  type        = bool
  default     = false
}

variable "custom_script_name" {
  description = "**OPTIONAL**: Name to give the CustomScriptExtension"
  type        = string
  default     = "CustomScript"
}

variable "extensions_custom_script_fileuris" {
  description = "**OPTIONAL**: The File URIs to use for the CustomScriptExtension"
  type        = list(string)
  default     = [""]
}

variable "extensions_custom_command" {
  description = "**OPTIONAL**: The command to run for the CustomScriptExtension"
  type        = string
  default     = ""
}

// System Patching

variable "patching_enabled" {
  description = "**OPTIONAL**: System patching enable/disable"
  type        = bool
  default     = true
}


// App Service

// variable "primary_region" {
//   default = "eastus"
// }

variable "vnet_rg_name" {
  description = "Name of the existing vnet resource group name"
  type        = string
  default     = "Primary-Networking-eastus"
}

variable "vnet_name" {
  description = "Name of the existing vnet name"
  type        = string
  default     = "cio_managed_lab_prod_eu2_vnet"
}

variable "subnet_name" {
  description = "Name of the existing subnet name for the private endpoint creation"
  type        = string
  default     = "cio_managed_lab_prod_eu2_vnet-subnet-prod"
}

variable "create_resource_group" {
  description = "create a new resource group or use existing for app service"
  type        = bool
  default     = false
}

variable "app_service_rg_name" {
  description = "Name of the app service resource group name"
  type        = string
  default     = "CIO-Managed-Lab-eastus-App"
}

variable "vnet_integration" {
  description = "enable or disable vnet integration"
  type        = bool
  default     = true
}

variable "integration_subnet_cidr" {
  description = "Pass the ip CIDR for the integration subnet"
  type        = list(any)
  default     = [""]
}

variable "integration_subnet_name" {
  description = "Name of the integration subnet name"
  type        = string
  default     = "cio_managed_lab_prod_eu2_vnet-subnet2-prod"
}

variable "create_dnsprivatezone" {
  description = "enable or disable private dns zone creation for the private endpoint"
  type        = bool
  default     = false
}

variable "area" {
  description = "project/area name"
  type        = string
  default     = "cio-managed-lab"
}

variable "app_name" {
  description = "web app name"
  type        = string
  default     = "fis-cio-labs-web-app"
}


variable "sku_name" {
  description = "App Service plan name"
  default     = "P1v2"
}

variable "os_type" {
  description = "Operating system type"
  default     = "Linux"
}

variable "appserviceplan_name" {
  description = "App service plan name"
  default     = "P1v2"
}

variable "front_web_app_enabled" {
  description = "**OPTIONAL**: enable or disable front end web app creation, by defualt enabled"
  type        = bool
  default     = true
}

#-----------------------------------
# Important - WEBSITE_VNET_ROUTE_ALL is a legacy app setting that has been replaced by the vnetRouteAllEnabled configuration setting.
#-----------------------------------
# 
variable "app_settings" {
  description = <<EOT
                 **OPTIONAL**: WEBSITE_VNET_ROUTE_ALL Indicates whether all outbound traffic from the app is routed through the virtual network.
                 A setting value of 1 indicates that all traffic is routed through the virtual network.
                 You need this setting when using features of Regional virtual network integration. 
                 It's also used when a virtual network NAT gateway is used to define a static outbound IP address.
                 WEBSITE_DNS_SERVER Sets the DNS server used by an app when resolving IP addresses. 
                 This setting is often required when using certain networking functionality, such as Azure DNS private zones and private endpoints.
  EOT

  type = map(string)
  default = {
    "WEBSITE_DNS_SERVER" : "10.18.135.158",
    "WEBSITE_VNET_ROUTE_ALL" : "1"
  }
}

variable "app_back_name" {
  description = "Name of the back web app"
  type        = string
  default     = "app-back"
}

/*
variable "rg_name" {
  description = "Name of the resource group name to be created"
  type        = string
  default     = "CIO-Managed-Lab-eastus-appservice"
}


variable "vnet" {
  description = "Name of the vnet where the app service need to be deployed"
  type        = string
  default     = "cio_managed_lab_prod_eu2_vnet"
}

variable "front_web_app_enabled" {
  description = "**OPTIONAL**: enable or disable front end web app creation, by defualt enabled"
  type        = bool
  default     = true
}

variable "app_front_name" {
  description = "Name of the front web app"
  type        = string
  default     = ""
}
#-----------------------------------
# Important - WEBSITE_VNET_ROUTE_ALL is a legacy app setting that has been replaced by the vnetRouteAllEnabled configuration setting.
#-----------------------------------
# 
variable "app_settings" {
  description = "**OPTIONAL**: WEBSITE_VNET_ROUTE_ALL Indicates whether all outbound traffic from the app is routed through the virtual network. 
                   A setting value of 1 indicates that all traffic is routed through the virtual network. 
                   You need this setting when using features of Regional virtual network integration. It's also used when a virtual network NAT gateway is used to define a static outbound IP address.
                   WEBSITE_DNS_SERVER Sets the DNS server used by an app when resolving IP addresses. This setting is often required when using certain networking functionality, such as 
                   Azure DNS private zones and private endpoints."
  type        = map(string)
  default     = {
    "WEBSITE_DNS_SERVER": "10.18.135.158",
    "WEBSITE_VNET_ROUTE_ALL": "1"
  }
}

variable "app_back_name" {
  description = "Name of the back web app"
  type        = string
  default     = ""
}
*/

variable "sqlsystem" {
  description = "Size sql OS"
  type        = number
  default     = 50
}
variable "sqldata" {
  description = "Size sql data"
  type        = number
  default     = 256
}

variable "sqllogs" {
  description = "Size sql logs"
  type        = number
  default     = 256
}

variable "sqltmpdb" {
  description = "Size sql tmp"
  type        = number
  default     = 128
}

variable "globant_tag_maintenance_window" {

  default = ["08", "06", "08", "08"]

}

variable "scope_ids" {
  description = "A list of Resources ID to assign all desired roles to"
  default     = []
}

variable "group_ids_dbas" {
  description = "List of AD Group IDs to assign DBA roles to over the given scope"
  default     = ["8d016fb9-52c3-4ad3-9cfd-8b552a9fc65e"]

}

variable "group_ids_server_access" {
  description = "List of AD Group IDs to assign Server Access roles to over the given scope"
  default     = []
}

variable "sql_lb_subnet_id" {
  description = "The ID of the subnet which holds the IP address for the load balancer"
  type        = string
  default     = ""
}

variable "sql_lb_private_ip_address" {
  description = "When a static IP address allocation is set provide the private IP address to set for the load balancer"
  type        = string
  default     = ""
}

variable "sql_failover_ports" {
  default = ["0-8", "135", "137", "445", "1433", "1434", "3343", "5022", "2382", "2383", "24158", "49152-65535", "1490", "11500-11599"]
}

variable "idera_ip_addresses" {
  description = "Manually specified idera ip address."
  type        = list(string)
  default     = null
}


/*

// variables for app gateway

variable "environment_name" {
    default = "test"
    description = "type of your enviornment variable , possible values are test | UAT | Production | Dev"
}

variable "resource_group_name" {
    default = "Primary-Networking-eastus"
    description = "Name of your Resource group."
}

variable "resource_group_location" {
    default = "eastus"
    description = "Location of your Resource Group."
}

variable "ip_allocation_method" {
  description = "Define the allocation method of your Public IP Address. Possible values are either Static or Dynamic"
  default = "Static"
}

variable "gateway_configuration_prefix" {
  description = "This is the prefix to be used for the components to be used for your application gateway"
  default = ""

}
variable "sku_type" {
  description = " The SKU of the Public IP. Accepted values are Basic and Standard."
  default = "Standard"
}

variable "public_ip_version" {
  description = "IP version to be used for your public IP , possible values are either IPv6 or IPv4"
  default = "IPv4"
}

// variable "sku" {
//     default = "Standard"
//     description = "The SKU of the Azure Load Balancer. Accepted values are Basic and Standard. Defaults to Basic."
// }

variable "azure_sku_name" {
  description = "The Name of the SKU to use for this Application Gateway. Possible values are Standard_Small, Standard_Medium, Standard_Large, Standard_v2, WAF_Medium, WAF_Large, and WAF_v2."
  default     = "Standard_v2"
}
 
variable "sku_tier" {
    description = "The Tier of Azure Application gateway.Possible values are Standard, Standard_v2, WAF and WAF_v2"
    default = "Standard_v2"   
}

variable "sku_capacity" {
    description = "The Capacity of the SKU to use for this Application Gateway - which must be between 1 and 10, optional if autoscale_configuration is set"
    default = "2"    
}

variable "azure_subnet_id" {
    default = ""
    description = "ID of your VNET subnet"
}

variable "enable_http2" {
  description = "Enable / Disable HTTP/2 protocol for your application gateway."
  default     = true
}

variable "ssl_certifcate_name"{
  description = "Name of your SSL certifcate to be used for azure application gateway"
  default     = ""
}

variable "http_protocol" {
  description = "Protocol to be used for http listner of your application gateway , possible values are HTTP or HTTPS"
  default     = "Https"

}



variable "backend_address_pools" {
  type  = list(object ({
  name  = list (string)
  fqdns = list(string)
  }))
  description = "It is a list of FQDN's which should be part of your Backend Address Pool."
  default = [{
    name = ["CIOLABTWIN19SS1", "CIOLABXSQL051"]
    fqdns = ["CIOLABRHE7LVM1.fiscloudservices.com", "CIOLABXSQL051.fiscloudservices.com"]
  }
]
}

variable "cookiebased_affinity" {
  description = "Enables or Disable your cookie based affinity"
  default = "Enabled"
}


variable "affinity_cookiename" {
  description = "The name of the affinity cookie."
  default = ""
}

variable "root_certificate_names" {
  type = list
  description = "List of your root certifcates"
  default =[""]
  // cross check the value for root certifcate
}

variable "enable_connection_draining" {
  description = "Enable | Disable connection draining."
  default     = false
}

variable "connection_drain_timeout" {
  description = "Number of seconds to wait before for active connections to drain out of a removed backend pool member"
  default     = 180
}

variable "routing_rule_type" {
  description = "The Type of Routing that should be used for this Rule. Possible values are Basic and PathBasedRouting."
  default     = "PathBasedRouting"
}

variable "protocol_version"{
  description = "The minimal TLS version. Possible values are TLSv1_0, TLSv1_1 and TLSv1_2"
  default     = "TLSv1_2"
}

variable "ssl_policy_type"{
  description = "The Type of the Policy. Possible values are Predefined and Custom."
  default     = "Custom"
}

variable "cipher_suite" {
  description = " A List of accepted cipher suites. Possible values are: TLS_DHE_DSS_WITH_AES_128_CBC_SHA, TLS_DHE_DSS_WITH_AES_128_CBC_SHA256, TLS_DHE_DSS_WITH_AES_256_CBC_SHA, TLS_DHE_DSS_WITH_AES_256_CBC_SHA256, TLS_DHE_RSA_WITH_AES_128_CBC_SHA, TLS_DHE_RSA_WITH_AES_128_GCM_SHA256, TLS_DHE_RSA_WITH_AES_256_CBC_SHA, TLS_DHE_RSA_WITH_AES_256_GCM_SHA384, TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA, TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256, TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256, TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA, TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384, TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384, TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA, TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256, TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA, TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384, TLS_RSA_WITH_3DES_EDE_CBC_SHA, TLS_RSA_WITH_AES_128_CBC_SHA, TLS_RSA_WITH_AES_128_CBC_SHA256, TLS_RSA_WITH_AES_128_GCM_SHA256, TLS_RSA_WITH_AES_256_CBC_SHA, TLS_RSA_WITH_AES_256_CBC_SHA256 and TLS_RSA_WITH_AES_256_GCM_SHA384."
  default     = ["TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384","TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256",
  "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384","TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384",
  "TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256","TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256",
  "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384","TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA",
  "TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA","TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256"]
}


variable "trusted_root_certificate_name"{
  description = " This is the name of your trusted root certificate."
  default     = ""
}

variable "health_probe_path" {
  description = "Path used by health probe"
  default     = "/"
}

// variable "cookie_based_affinity" {
//   description = "Specify Enabled or Disabled. Controls cookie-based session affinity to backend pool members"
//   default     = "Disabled"
// }

variable "probe_interval"{
  description = " The Interval between two consecutive probes in seconds. Possible values range from 1 second to a maximum of 86,400 seconds."
  default     = "30"
}

variable "probe_timeout" {
  description = "The Timeout used for this Probe, which indicates when a probe becomes unhealthy. Possible values range from 1 second to a maximum of 86,400 seconds"
  default     = "30"
}

variable "probe_unhealthy_threshold" {
  description = "The Unhealthy Threshold for this Probe, which indicates the amount of retries which should be attempted before a node is deemed unhealthy. Possible values are from 1 to 20."
  default     = "5"
}


variable "tag_buc" {
  description = "The Business Unit Code associated with the group responsible for the deployed asset."
  default     = "3201.501026.9425..0000.0000.0000"
}

variable "tag_support_group" {
  description = "The name of the group responsible for the deployed asset."
  default     = "FIS IDS-IPS"
}

variable "tag_app_group_email" {
  description = "The email address for the operations team responsible for the deployed asset."
  default     = "Security-IDS-IPS@fisglobal.com"
}

variable "tag_environment_type" {
  description = "The tier of environment for the application -- this is separate from the service level defined at the subscription level."
  default     = "Test"
}

variable "tag_customer_crmid" {
  description = "The end customer of the system and the CRM ID of the end customer of the system."
  default     = "FIS 6015"
}

variable "tag_expiration_date" {
  default = "Never"
}

variable "tag_tier" {
  default = "App"
}

variable "tag_maintenance_window" {
  default = "Never"
}

variable "tag_on_hours" {
  default = "Always"
}

variable "tag_sla" {
  default = "99.99" 
}

variable "tag_solution_central_id" {
  default = "10001887"
}

variable "tag_npi" {
  default = "False"
}

variable "webhook" {
  default = "Never"
}


variable "appgw_kv_cert_secret" {
  description = "Secret ID of your KV"
  default     = ""
}

variable "azure_cio_subnet_id" {
  description = "ID of your Subnet to be used"
  default     = ""
}

variable "probe_host" {
  description = " The Hostname used for this Probe. If the Application Gateway is configured for a single site, by default the Host name should be specified as ‘127.0.0.1’, unless otherwise configured in custom probe."
  default     = "127.0.0.1"
}

// variable "user_identity_id"{
//   description = "Specifies a list of User Assigned Managed Identity IDs to be assigned to this Application Gateway."
//   default     = "/subscriptions/45ac9c63-dda8-492b-a4fb-c41411f1a734/resourceGroups/Primary-Networking-eastus/providers/Microsoft.ManagedIdentity/userAssignedIdentities/cio_managed_lab-appgw_mgmt"
// }

variable "user_identity_name"{
  description = "Specifies a list of User Assigned Managed Identity IDs to be assigned to this Application Gateway."
  default     = "cio_managed_lab-appgw_mgmt"
}

variable "primary_resource_group_name"{
  description = "Name of your resource group"
  default = "Primary-Networking"
}

*/


#sqlpaas module
# variable "resource_group_name" {
#   description = "A container that holds related resources for an Azure solution"
# }

variable "primary_sql_server_location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = "eastus2"
}

variable "secondary_sql_server_location" {
  description = "Specifies the supported Azure location to create secondary sql server resource"
  default     = "northeurope"
}

variable "sql_failover_group_name" {
  description = "(Required) The name of the failover group. Changing this forces a new resource to be created.'"
  default     = "mssqlfg"
}


# variable "create_resource_group" {
#   description = "Whether to create resource group and use it for all networking resources"
#   type        = bool
#   default     = true
# }

# variable "existing_subnet_id" {
#   description = "The resource id of existing subnet"
#   default     = "/subscriptions/bfc181d8-0a2b-483a-95eb-23944b2724f1/resourceGroups/lc5664700-eastus2-01/providers/Microsoft.Network/virtualNetworks/vNet-W/subnets/internal"
# }

# variable "existing_vnet_id" {
#   description = "The resoruce id of existing Virtual network"
#   default     = "/subscriptions/bfc181d8-0a2b-483a-95eb-23944b2724f1/resourceGroups/lc5664700-eastus2-01/providers/Microsoft.Network/virtualNetworks/vNet-W"
# }

variable "sqlserver_name" {
  description = "(Required) The name ofthe Microsoft SQL Server. This needs to be globally unique within Azure"
  default     = "mssqlsdb"
}

variable "database_name" {
  description = "The name of the database"
  default     = "mssqlpdb"
}

variable "secondary_database_name" {
  description = "The name of the database"
  default     = "mssqldb2"
}

variable "email_addresses_for_alerts" {
  description = "A list of email addresses which alerts should be sent to."
  type        = list(any)
  default     = ["Jhohan.RestrepoDelgado@FISGLOBAL.COM"]
}

variable "ad_group_admin_login_name" {
  description = "(Required) The login name of the principal to set as the Managed Instance Administrator."
  default     = "CIO Managed Lab Server Administrators"
}

variable "log_retention_days" {
  description = "Specifies the number of days to keep in the Threat Detection audit logs"
  default     = "30"
}
# variable "max_size_gb" {
#   description = "(Optional) The max size of the database in gigabytes."
# }

variable "mssql_sku_name" {
  description = "(Optional) Specifies the name of the SKU used by the database. For example, GP_S_Gen5_2,HS_Gen4_1,BC_Gen5_2, ElasticPool, Basic,S0, P2 ,DW100c, DS100. Changing this from the HyperScale service tier to another service tier will force a new resource to be created."
  default     = "S0"
}

variable "enable_threat_detection_policy" {
  description = "Enable Azure Defender for database"
  default     = false
}

variable "enable_database_extended_auditing_policy" {
  description = "Manages Extended Audit policy for SQL database"
  default     = true
}

variable "enable_vulnerability_assessment" {
  description = "Manages the Vulnerability Assessment for a MS SQL Server"
  default     = true
}

variable "enable_log_monitoring" {
  description = "Enable audit events to Azure Monitor?"
  default     = false
}

variable "automation_identity_type" {
  default = "UserAssigned"
}

variable "automation_identity_ids" {
  default = []
}

variable "scale_set_admin_password" {
  description = "Admin password to test scale set"
  default     = ""
}