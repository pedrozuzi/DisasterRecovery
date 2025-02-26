variable "resource_group_name" {
  description = "Name of the Resource Group in which to deploy these resources"
  type        = string
}

variable "region" {
  description = "Region in which to deploy these resources"
  type        = string
}

variable "nsg_id" {
  description = "ID of the NSG to associate the network interface"
  type        = string
}

variable "hostname" {
  description = "**OPTIONAL**: Name of the VMs to create. If not specified, a random hostname will be assigned"
  type        = string
  default     = ""
}

variable "nic_name_overrides" {
  description = "**OPTIONAL**: List of names to override the NIC names with. For legacy config upgrading to newer modules."
  type        = list(string)
  default     = null
}

variable "subnet_id" {
  description = "ID of the Subnet in which the machines will exist"
  type        = string
}

variable "ip_addresses" {
  description = "**OPTIONAL**: A list of Private IP Addresses to assign the network interfaces. If not specified, dynamic IPs will be assigned"
  type        = list(string)
  default     = null
}

variable "enable_accelerated_networking" {
  description = "**OPTIONAL**: Should accelerated networking be enabled?"
  type        = bool
  default     = false
}

variable "dns_server_ips" {
  description = "**OPTIONAL**: Hostnames and ips of the DNS Servers to assign the Network interface"
  type        = map(string)
  default     = null
}

variable "vm_diagnostics_uri" {
  description = "**OPTIONAL**: The URI of the diagnostic storage account"
  type        = string
  default     = null
}

variable "availability_set_id" {
  description = "The ID of an existing availability set. Required if 'availability_zones' is not set."
  type        = string
  default     = null
}

variable "availability_zones" {
  description = "The availability zones that the VM should be deployed into. Required if 'availability_set_id' is not set."
  type        = list(string)
  default     = [null]
}

variable "managed_identity_type" {
  description = "The type of Managed Service Identity that should be configured on the VM, possible values are `SystemAssigned`, `UserAssigned`, `SystemAssigned, UserAssigned` (to enable both)"
  type        = string
  default     = "SystemAssigned"
}

variable "user_assigned_managed_identity_ids" {
  description = "A list of User Assigned Managed Identity IDs to be assigned to this Linux Virtual Machine - required when managed_identity_type is set to `UserAssigned` or `SystemAssigned, UserAssigned`"
  type        = list(string)
  default     = null
}

variable "proximity_placement_group_id" {
  description = "(Optional) The ID of the Proximity Placement Group which the Virtual Machine should be assigned to. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "vm_count" {
  description = "**OPTIONAL**: The number of VMs to deploy"
  type        = number
  default     = 1
}

variable "hostname_count_split" {
  type    = string
  default = "0"
}

variable "vm_size" {
  description = "Size of the machine to deploy"
  type        = string
}

variable "vm_image_id" {
  description = "The ID of the Shared Image to create the VMs"
  type        = string
}

variable "vm_default_admin_username" {
  description = "**OPTIONAL**: Name of the local admin account"
  type        = string
  default     = "snickers"
}

variable "vm_default_admin_password" {
  description = "**OPTIONAL**: Password of the local admin account. If not specified, a random password will be assigned"
  type        = string
  default     = null
}

variable "vm_custom_data" {
  description = "**OPTIONAL**: The Base64-Encoded Custom Data which should be used for this Virtual Machine. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "vm_storage_os_disk_type" {
  description = "**OPTIONAL**: Storage type for the VMs' OS disk"
  type        = string
  default     = "Premium_LRS"
}

variable "vm_storage_os_disk_size" {
  description = "**OPTIONAL**: The size of the OS disk"
  type        = number
  default     = 128
}

variable "vm_storage_os_disk_caching" {
  description = "**OPTIONAL**: Caching requirements for the OS disk"
  type        = string
  default     = "ReadWrite"
}

variable "managed_disk_write_accelerator_enabled" {
  description = "**OPTIONAL**: Should managed disks have write accelerator enabled"
  type        = bool
  default     = false
}

variable "disk_logic" {
  description = "**OPTIONAL**: Logic for which disks will be managed for all VMs. Possible values are `depth_first` or `breadth_first`"
  type        = string
  default     = "depth_first"
}

variable "managed_disk_sizes" {
  description = "**OPTIONAL**: The sizes of the optional manged data disks"
  type        = list(number)
  default     = null
}

variable "managed_disk_type" {
  description = "**OPTIONAL**: The type of managed disks to attach to the VMs"
  type        = string
  default     = "Premium_LRS"
}

variable "managed_disk_attachment_caching" {
  description = "**OPTIONAL**: Caching requirements for managed disks"
  type        = string
  default     = "ReadWrite"
}

variable "managed_disk_lun" {
  description = "**OPTIONAL**: Lun of the first managed disk"
  type        = number
  default     = 10
}

variable "managed_disk_lun_increments" {
  description = "**OPTIONAL**: Lun increments for additional data disks"
  type        = number
  default     = 5
}

variable "managed_disk_network_access_policy" {
  description = "**OPTIONAL**: Policy for accessing the disk via network."
  type        = string
  default     = "AllowPrivate"
}

variable "disk_access_name" {
  description = "**OPTIONAL**: The name which should be used for this Disk Access."
  type        = string
  default     = "disk_access"
}

variable "disk_access_id" {
  description = "**OPTIONAL**: The id of the disk access if already exist and want to re-use."
  type        = string
  default     = null
}

variable "managed_disk_public_network_access_enabled" {
  description = "**OPTIONAL**: Whether it is allowed to access the disk via public network."
  type        = bool
  default     = false
}

variable "vm_timezone" {
  description = "Timezone of the windows VM - options available here http://jackstromberg.com/2017/01/list-of-time-zones-consumed-by-azure/"
  type        = string
}

variable "license_type" {
  description = "Specifies the type of on-premise license (also known as Azure Hybrid Use Benefit) which should be used for this Virtual Machine."
  type        = string
  default     = "None"
}

variable "av_scan_day" {
  description = "**OPTIONAL**: Day of the week for Malware to scan"
  type        = number
  default     = 7
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

variable "domain_joined" {
  description = "**OPTIONAL**: Should the machine join a domain"
  type        = bool
  default     = false
}

variable "domain_name" {
  description = "**OPTIONAL**: Name of the domain to join"
  type        = string
  default     = ""
}

variable "domain_join_user" {
  description = "**OPTIONAL**: Name of the user to authenticate with the domain"
  type        = string
  default     = ""
}

variable "domain_join_pass" {
  description = "**OPTIONAL**: Password of the user to authenticate with the domain"
  type        = string
  default     = ""
}

variable "domain_ou_path" {
  description = "**OPTIONAL**: OU path to use during domain join"
  type        = string
  default     = ""
}

variable "public_ip_enabled" {
  description = "**OPTIONAL**: Determines if Public IPs are enabled for Network Interfaces"
  type        = bool
  default     = false
}

variable "extension_bginfo" {
  description = "**OPTIONAL**: Should BGInfo be attached to all servers"
  type        = bool
  default     = true
}

variable "ama_extension_enabled" {
  description = "**Optional**: Flag which determines if the AzureMonitorWindowsAgent extension is enabled"
  type        = bool
  default     = true
}

variable "ama_agent_handler_version" {
  description = "**OPTIONAL**: AMA Agent for Windows extension handler version"
  type        = string
  default     = "1.24"
}

variable "auto_upgrade_ama_agent" {
  description = "**Optional**: Flag which determines if the auto upgrades are enabled for the AzureMonitorWindowsAgent VM extension"
  type        = bool
  default     = true
}

variable "extension_insights" {
  description = "**OPTIONAL**: Should VM Insights agent be attached to all servers"
  type        = bool
  default     = true
}

variable "extension_malware" {
  description = "**OPTIONAL**: Should Malware be attached to all servers"
  type        = bool
  default     = true
}

variable "aad_login_extension_enabled" {
  description = "**OPTIONAL**: Should AADLoginForWindows be attached to all servers"
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

# BeyondTrust service enable/disable
variable "enable_beyondtrust_service" {
  description = "**OPTIONAL**: BeyondTrust activates by default, pass value false to disable service"
  type        = bool
  default     = true
}