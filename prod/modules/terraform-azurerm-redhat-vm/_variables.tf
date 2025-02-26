variable "resource_group_name" {
  description = "The name of the Resource Group in which the assets should exist"
  type        = string
  default     = ""
}

variable "region" {
  description = "The Azure region in which the assets should exist"
  type        = string
  default     = ""
}

variable "license_type" {
  description = "License Type for this Virtual Machine"
  type        = string
  default     = "RHEL_BYOS"  
}

variable "bks_pre_reg_grp_nm" {
  description = "BoKS Pre-registration Group name"
  type        = string
}

variable "nsg_id" {
  description = "The ID of he Network Security Group in which the Network Interfaces will be associated with"
  type        = string
  default     = ""
}

variable "subnet_id" {
  description = "The ID of the Subnet which is associated with the Network Interface"
  type        = string
  default     = ""
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

variable "vm_count" {
  description = "**OPTIONAL**: The number of VMs to deploy"
  type        = number
  default     = 1
}

variable "hostname_count_split" {
  description = "**OPTIONAL**: Offset number added to hostname count. (ex. If set to 1, the first VM hostname will end in 2)"
  type        = number
  default     = 0
}

variable "availability_set_id" {
  description = "**OPTIONAL**: The ID of an existing availability set."
  type        = string
  default     = null
}

variable "availability_set_ids" {
  description = "**OPTIONAL**: List of IDs of existing availability sets."
  type        = list(string)
  default     = null
}

variable "availability_zones" {
  description = "The availability zones that the VM should be deployed into. Required if 'availability_set_id' is not set."
  type        = list(number)
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
  description = "**Optional**: The ID of the Proximity Placement Group which the Virtual Machine should be assigned to. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "vm_image_id" {
  description = "The ID of the Shared Image to create the VMs"
  type        = string
}

variable "vm_diagnostics_uri" {
  description = "**OPTIONAL**: URI of the diagnostics Storage Account"
  type        = string
  default     = null
}

variable "vm_size" {
  description = "**OPTIONAL**: Size of the VMs"
  type        = string
  default     = "Standard_E8s_v3"
}

variable "vm_default_admin_username" {
  description = "**OPTIONAL**: Name of the local admin account"
  type        = string
  default     = "snickers"
}

variable "vm_default_admin_password" {
  description = "**OPTIONAL**: Password of the local admin account"
  type        = string
  default     = null
}

variable "vm_custom_data" {
  description = "**OPTIONAL**: The Base64-Encoded Custom Data which should be used for this Virtual Machine. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "vm_user_data" {
  description = "**OPTIONAL**: The Base64-Encoded User Data which should be used for this Virtual Machine."
  type        = string
  default     = null
}

variable "ama_extension_enabled" {
  description = "**Optional**: Flag which determines if the AzureMonitorLinuxAgent extension is enabled for VMs to create"
  type        = bool
  default     = true
}

variable "ama_agent_handler_version" {
  description = "**OPTIONAL**: AMA Agent for Linux extension handler version"
  type        = string
  default     = "1.28"
}

variable "auto_upgrade_ama_agent" {
  description = "**Optional**: Flag which determines if the auto upgrades are enabled for the AzureMonitorLinuxAgent VM extension"
  type        = bool
  default     = true
}

variable "auto_upgrade_minor_aad_login" {
  description = "**Optional**: Flag which determines if the auto upgrades are enabled for the AADLoginForLinux VM extension"
  type        = bool
  default     = true
}

variable "aad_agent_handler_version" {
  description = "**OPTIONAL**: AAD Agent for Linux extension handler version"
  type        = string
  default     = "1.0"
}

variable "auto_upgrade_minor_enhanced_monitor" {
  description = "**Optional**: Flag which determines if the auto upgrades are enabled for the AzureEnhancedMonitorForLinux VM extension"
  type        = bool
  default     = true
}

variable "aad_login_extension_enabled" {
  description = "**Optional**: Flag which determines if the AADLoginForLinux extension is enabled for VMs to create"
  type        = bool
  default     = true
}

variable "enhanced_monitor_extension_enabled" {
  description = "**Optional**: Flag which determines if the AzureEnhancedMonitorForLinux extension is enabled for VMs to create"
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

variable "custom_script_handler_version" {
  description = "**OPTIONAL**: Custom script extension handler version"
  type        = string
  default     = "1.9"
}

variable "boks_and_patching_script_handler_version" {
  description = "**OPTIONAL**: patching custom script extension handler version"
  type        = string
  default     = "2.0"
}

variable "auto_minor_upgrade_boks_and_patching_handler_version" {
  description = "**Optional**: Flag which determines if the auto upgrades are enabled for the boks and patching extension handler version"
  type        = bool
  default     = true
}

variable "vm_storage_os_disk_size" {
  description = "**OPTIONAL**: Specifies the size of the OS Disk in gigabytes"
  type        = number
  default     = 128
}

variable "vm_storage_os_disk_type" {
  description = "**OPTIONAL**: The type of Managed Disk which should be created"
  type        = string
  default     = "Premium_LRS"
}

variable "vm_storage_os_disk_caching" {
  description = "**OPTIONAL**: Caching requirements for the OS disk"
  type        = string
  default     = "ReadWrite"
}

variable "disk_iops" {
  description = "**OPTIONAL**: The number of IOPS allowed for this disk; only settable for UltraSSD disks and PremiumV2 disks."
  type        = list(number)
  default     = null
}

variable "public_ip_enabled" {
  description = "**OPTIONAL**: Determines if Public IPs are enabled for Network Interfaces"
  type        = bool
  default     = false
}

variable "managed_disk_write_accelerator_enabled" {
  description = "**OPTIONAL**: Should managed disks have write accelerator enabled"
  type        = bool
  default     = false
}

variable "managed_disk_sizes" {
  description = "**OPTIONAL**: The sizes of the optional managed data disks"
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

variable "managed_disk_network_access_policy" {
  description = "**OPTIONAL**: Policy for accessing the disk via network."
  type        = string
  default     = "AllowPrivate"
}

variable "managed_disk_public_network_access_enabled" {
  description = "**OPTIONAL**: Whether it is allowed to access the disk via public network.."
  type        = bool
  default     = false
}

// variable to extend hostname with prod.cloud

variable "domain-suffix" {
  description = "this will be appended to the hostname given by user.If not specified, default prod.cloud will be used"
  type        = string
  default     = ".prod.cloud"
}