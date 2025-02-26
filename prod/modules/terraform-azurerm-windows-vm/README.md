# AzureRM Windows VM

ICS Standard Terraform Module which deploys a group of Windows Virtual Machines

## Usage

[Usage template](https://bitbucket.fis.dev/projects/FCSTMR/repos/cio-terraform-module-library/browse/Azure/Compute/Virtual%20Machine/Windows)
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
|resource_group_name|Name of the Resource Group in which to deploy these resources|String|-|Yes|
|region|Region in which to deploy these resources|String|-|Yes|
|nsg_id|ID of the NSG to associate the network interface|String|-|Yes|
|hostname|Name of the VMs to create. If not specified, a random hostname will be assigned.Please limit the hostname under 14 characters if vm_count is 1. Hostname character is limited to 15 as name will be appended based on vm_count. Shorter hostname under 12 character is recommended.  |String|-|No|
|subnet_id|ID of the Subnet in which the machines will exist|String|-|Yes|
|ip_addresses|A list of Private IP Addresses to assign the network interfaces. If not specified, dynamic IPs will be assigned|List (String)|-|No|
|enable_accelerated_networking|Should accelerated networking be enabled?|String|`false`|No|
|vm_diagnostics_uri|The URI of the diagnostic storage account. Required if vm_boot_diagnostics is true|String|-|No|
|availability_set_id|The ID of an existing availability set|String|-|Yes|
|vm_boot_diagnostics|Are VM boot diagnostics required|String|true|No|
|vm_count|The number of VMs to deploy|String|1|For more than 1, yes|
|vm_size|Size of the machine to deploy|String|-|Yes|
|vm_image_id|ID of the custom image to use for the VM|String|MicrosoftWindowsServer|Yes|
|vm_default_admin_username|Name of the local admin account|String|\<sensitive>|No|
|vm_default_admin_password|Password of the local admin account. If not specified, a random password will be assigned|String|-|No|
|vm_custom_data|The Base64-Encoded Custom Data which should be used for this Virtual Machine. Changing this forces a new resource to be created.|string|-|No|
|delete_os_disk_on_termination|Should the OS disk be deleted upon VM deletion|String|-|No|
|delete_data_disks_on_termination|Should data disks be deleted upon VM deletion|String|true|No|
|vm_storage_os_disk_type|Storage type for the VMs' OS disk|String|Premium_LRS|No|
|vm_storage_os_disk_size|The size of the OS disk|String|128|No|
|vm_storage_os_disk_caching|Caching requirements for the OS disk|String|ReadWrite|No|
|managed_disk_write_accelerator_enabled|Should managed disks have write accelerator enabled|String|false|No|
|managed_disk_sizes|The sizes of the optional manged data disks|List (String)|-|No|
|managed_disk_type|The type of managed disks to attach to the VMs|String|Premium_LRS|No|
|managed_disk_attachment_caching|Caching requirements for managed disks|String|ReadWrite|No|
|managed_disk_lun|Lun of the first managed disk|Int|10|No|
|managed_disk_lun_increments|Lun increments for additional data disks|number|5|No|
|managed_disk_network_access_policy|Policy for accessing the disk via network|string|`AllowPrivate`|No|
|disk_access_name|The name which should be used for this Disk Access|string|`disk_access`|No|
|disk_access_id|The id of the disk access if one already exists|string|`null`|No|
|managed_disk_public_network_access_enabled|Whether it is allowed to access the disk via public network|bool|`false`|No|
|vm_timezone|Timezone of the VMs - options available [here](http://jackstromberg.com/2017/01/list-of-time-zones-consumed-by-azure/)|String|-|Yes|
|license_type|Specifies the type of on-premise license (also known as Azure Hybrid Use Benefit) which should be used for this Virtual Machine.|string|`None`|No|
|av_scan_day|Day of the week for Malware to scan|String|7|No|
|av_scan_type|Type of Malware scan|String|quick|No|
|av_scan_exclusions_paths|Scan exclusion paths for Malware|String|-|No|
|av_scan_exclusions_extensions|Scan exclusion extensions for Malware|String|-|No|
|av_scan_exclusions_processes|Scan exclusion processes for Malware|String|taskmgr.exe|No|
|av_scan_realtime_enabled|Is realtime scanning enabled for Malware|String|true|No|
|av_scan_time|Time in minutes for Malware scan|String|120|No|
|domain_joined|Should the machine join a domain|String|false|No|
|domain_name|Name of the domain to join|String|-|If `domain_joined` is set to `true`|
|domain_join_user|Name of the user to authenticate with the domain|String|-|If `domain_joined` is set to `true`|
|domain_join_pass|Password of the user to authenticate with the domain|String|-|If `domain_joined` is set to `true`|
|domain_ou_path|OU path to use during domain join|String|-|If `domain_joined` is set to `true`|
|public_ip_enabled|Determines if Public IPs are enabled for Network Interfaces|String|false|No|
|extension_bginfo|Should BGInfo be attached to all servers|String|true|No|
|ama_extension_enabled|Whether the AzureMonitorWindowsAgent extension is enabled|String|true|No|
|ama_agent_handler_version|AMA Agent for Windows extension handler version|string|`1.24`|No|
|auto_upgrade_ama_agent|Flag which determines if the auto upgrades are enabled for the AzureMonitorWindowsAgent VM extension|bool|`true`|No|
|extension_malware|Should Malware be attached to all servers|String|true|No|
|aad_login_extension_enabled|Should AADLoginForWindows be attached to all servers|String|true|No|
|custom_script_enabled|Should CustomScriptExtension be attached to all servers|String|false|No|
|custom_script_name|Name to give the CustomScriptExtension|String|CustomScript|No|
|extensions_custom_script_fileuris|The File URIs to use for the CustomScriptExtension|List (String)|-|No|
|extensions_custom_command|The command to run for the CustomScriptExtension|String|-|No|
|enable_beyondtrust_service|BeyondTrust service activation|bool|true|No|
|managed_identity_type|The type of Managed Service Identity that should be configured on the VM|string|`SystemAssigned`|No|
|user_assigned_managed_identity_ids|A list of User Assigned Managed Identity IDs to be assigned to this Linux Virtual Machine - required when managed_identity_type is set to `UserAssigned` or `SystemAssigned, UserAssigned`|list(string)|`null`|No|
## Outputs

| Name | Description | Type |
|------|-------------|:----:|
|vm_ids|List of VM resource IDs that are created|List (String)|
|vm_names|List of VM names that are created|List (String)|
|vm_password|The password for the VM(s) created in the module (if multiple, one password is used for all)|String|
|vm_ip_addresses|List of VM's private IP addresses|List (String)|
|vm_count|The number of VMs created (output to reference that doesn't depend on 'computed')|String|
