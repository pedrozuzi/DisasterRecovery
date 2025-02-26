# AzureRM Redhat VM

ICS Standard Terraform Module which deploys a group of RedHat Virtual Machines

## Features

Each VM is configured with AAD SSH authentication and an OMS extension, to associate with an existing Log Analytics Workspace.  
If you desire the Azure Enhanced Monitor extension, please request it separately via SNOW General Inquiry ticket.
Please view our other certified modules and resources [here](https://bitbucket.fis.dev/projects/FCSTMR/repos/cio-terraform-module-library/browse/Azure/Compute/Virtual%20Machine/RedHat).

## Required Version & Providers

| Name | Version |
|---|---|
| `terraform` | `>= 0.12` |
| `azurerm` | `>= 3.108.0` |

## Usage

[Usage template](https://bitbucket.fis.dev/projects/FCSTMR/repos/cio-terraform-module-library/browse/Azure/Compute/Virtual%20Machine/RedHat)

## Required Inputs

| Name | Description | Type |
|------|-------------|:----:|
|**resource_group_name**|Name of the Resource Group in which to deploy these resources|String|
|**region**|Region in which to deploy these resources|String|
|**subnet_id**|The ID of the Subnet which is associated with the Network Interface|String|
|**nsg_id**|The ID of he Network Security Group in which the Network Interfaces will be associated with|String|
|**vm_storage_os_disk_size**|Specifies the size of the OS Disk in gigabytes|String|
|**availability_zones**|The availability zones that the VM should be deployed into. *Required if availability set is not defined.*|List (String)|
|**vm_image_id**|The ID of the Shared Image to create the VMs|String|
|**domain-suffix**|The extension to be appended in the hostname given by user to register vm in CMDB|String|
|**bks_pre_reg_grp_nm**|Pre-registration group name for BoKS installation|string|

## Common Optional Inputs

| Name | Description | Type | Default |
|------|-------------|:----:|:-----:|
|vm_size|Size of the VMs|String|Standard_E8s_v3|
|vm_storage_os_disk_type|The type of Managed Disk which should be created|String|Premium_LRS|
|vm_diagnostics_uri|The Storage Account Blob Endpoint which should store the VM's diagnostics files. Required if vm_boot_diagnostics is true.|String|-|
|hostname|Name of the VMs to create. If not specified, a random hostname will be assigned|String|-|
|hostname_count_split|Offset number added to hostname count. (ex. If set to 1, the first VM hostname will end in 2)|Number|0|
|vm_count|The number of VMs to deploy|Number|1|
|availability_set_id|The ID of an existing availability set. *Required if availability zone is not defined.*|String|-|
|availability_set_ids|List of IDs of existing availability sets. *Required if availability zone is not defined.*|List (String)|-|
|proximity_placement_group_id|The ID of the Proximity Placement Group which the Virtual Machine should be assigned to. Changing this forces a new resource to be created.|String|-|
|managed_disk_sizes|The sizes of the optional Managed Disks.|List (Number)|-|
|managed_disk_type|The type of Managed Disks to attach to the VMs.|String|Premium_LRS|
|managed_disk_attachment_caching|Caching requirements for Managed Disks.|String|ReadWrite|
|managed_disk_lun|Lun of the first Managed Disk.|Number|10|
|managed_disk_lun_increments|Lun incremenets for the additional Managed Disks.|Number|5|
## Other Optional Inputs

| Name | Description | Type | Default |
|------|-------------|:----:|:-----:|
|license_type|License Type for this Virtual Machine|string|`RHEL_BYOS`|
|ip_addresses|The list of Private IP Addresses for the Network Interface's IP configuration|List (String)|-|
|public_ip_enabled|Flag which determines if Public IPs are enabled for Network Interfaces|Boolean|`false`|
|enable_accelerated_networking|Should accelerated networking be enabled?|String|`false`|
|nic_name_overrides|List of names to override the NIC names with. For legacy config upgrading to newer modules.|List (String)|-|
|vm_default_admin_username|Name of the local admin account|String|snickers|
|vm_default_admin_password|Password of the local admin account - If this input and the public_key input are not configured, a random password will be generated|String|-|
|vm_custom_data|The Base64-Encoded Custom Data which should be used for this Virtual Machine. Changing this forces a new resource to be created.|string|-|
|vm_user_data|The Base64-Encoded Custom Data which should be used for this Virtual Machine. Changing this forces a new resource to be created.|string|`null`|
|oms_extension_enabled|Flag which determines if the OMSAgentForLinux extension is enabled for VMs to create|Boolean|`true`|
|oms_agent_handler_version|OMS Agent for Linux extension handler version|string|`1.14`|
|extension_insights|Should VM Insights agent be attached to all servers|String|`true`|
|aad_login_extension_enabled|Flag which determines if the AADSSHLoginForLinux extension is enabled for VMs to create|Boolean|`true`|
|enhanced_monitor_extension_enabled|Flag which determines if the AzureEnhancedMonitorForLinux extension is enabled for VMs to create|Boolean|`true`|
|dependency_agent_handler_version|Dependency Agent for Linux extension handler version|string|`9.5`|
|aad_agent_handler_version|AAD Agent for Linux extension handler version|string|`1.0`|
|custom_script_handler_version|Custom script extension handler version|string|`1.9`|
|patching_script_handler_version|Dependency Agent for Linux extension handler version|`2.0`|
|patching_enabled|Flag which determines if the $HostName-system-patching extension is enabled for VMs to create|Boolean|`true`|
|delete_os_disk_on_termination|Flag which determines if the OS disk should be deleted when the VM is deleted|Boolean|`true`|
|delete_data_disks_on_termination|Flag which determines if the data disk should be deleted when the VM is deleted|Boolean|`true`|
|vm_storage_os_disk_caching|Caching requirements for the OS disk|String|ReadWrite|
|disk_iops|The number of IOPS allowed for this disk; only settable for UltraSSD disks and PremiumV2 disks.|list(number)|null|
|managed_disk_write_accelerator_enabled|Should Managed Disks have write accelerator enabled?|Boolean|`false`|
|managed_disk_network_access_policy|Policy for accessing the disk via network|string|`AllowPrivate`|
|disk_access_name|The name which should be used for this Disk Access|string|`disk_access`|
|disk_access_id|The id of the disk access if one already exists|string|`null`|No|
|managed_disk_public_network_access_enabled|Whether it is allowed to access the disk via public network|bool|`false`|
|managed_identity_type|The type of Managed Service Identity that should be configured on the VM, possible values are `SystemAssigned`, `UserAssigned`, `SystemAssigned, UserAssigned` (to enable both)|string|`SystemAssigned`|
|user_assigned_managed_identity_ids|A list of User Assigned Managed Identity IDs to be assigned to this Linux Virtual Machine - required when managed_identity_type is set to `UserAssigned` or `SystemAssigned, UserAssigned`|list(string)|`null`|
## Required Tags

| Name | Description | Type |
|------|-------------|:----:|
|tag_support_group|The name of the group responsible for the deployed asset(s)|String|
|tag_app_group_email|The email address for the operations team responsible for the deployed asset(s)|String|
|tag_environment_type|The tier of environment for the application -- this is separate from the service level defined at the subscription level|String|
|tag_expiration_date|The date that the VMs are no longer required|MM/DD/YYYY or "Never"|
|tag_tier|The tier of system in the application deployment model|String|
|tag_maintenance_window|A list of timeframes that each server can be patched for updates by OMS (one for each VM)|[Modified Crontab](https://wiki.fnis.com/display/fiscld/Crontab+Tagging)|
|tag_on_hours|A list of times which the VMs are required to run (one for each VM)|[Modified Crontab](https://wiki.fnis.com/display/fiscld/Crontab+Tagging)|
|tag_sla|The contracted Service Level Agreement for system uptime|String|
|tag_solution_central_id|The Asset ID related to the entry in Solution Central for the product to be deployed on the given asset|String|
|tag_webhook|A webhook to send notifications of events within the Resource Group to|String|

## Optional Tags

| Name | Description | Type | Default |
|------|-------------|:----:|:-----:|
|tag_description|A description of the Virtual Machines|String|-|

Further information on the tags above (including how to configure their values) can be found here: [Tagging taxonomy](https://wiki.fnis.com/pages/viewpage.action?spaceKey=fiscld&title=Tagging+Taxonomy).

## Outputs

| Name | Description | Type |
|------|-------------|:----:|
|vm_ids|List of VM resource IDs that are created|List (String)|
|vm_names|List of VM names that are created|List (String)|
|vm_count|Number of VMs deployed|Number|
|vm_ip_addresses|List of VM's private IP addresses|List (String)|
|vm_password|The password for the VM(s) created in the module.|String|
|nic_ids|List of NIC IDs that are created.|List(String)|
|nic_names|List of NIC names that are created.|List(String)|
|nic_ip_config_names|List of NIC IP configuration names (1 per NIC)|List(String)|

## Example Usage

```hcl
module "APPLICATION_OS_REGION" {
  source                                     = "vlmaztform01.fisdev.local/FIS-Cloud-Services/redhat-vm/azurerm"
  version                                    = "1.3.0"
  resource_group_name                        = azurerm_resource_group.RESOURCE_GROUP_rg.name
  region                                     = var.primary_region
  subnet_id                                  = local.ENVIRONMENT_compute_subnet_id
  nsg_id                                     = local.ENVIRONMENT_compute_nsg_id  
  vm_diagnostics_uri                         = azurerm_storage_account.ENVIRONMENT_diag.primary_blob_endpoint
  hostname                                   = "INSTANCE_NAME" // Index iteration is performed by module -- enter BASE name and the index will be prepended to the name.
  domain-suffix                              = "domain-suffix"
  vm_count                                   = XXX
  bks_pre_reg_grp_nm                         = XXX
  availability_zones                         = [XXX]
  vm_size                                    = "INSTANCE_SIZE"
  vm_image_id                                = local.fcs_rhel_image_id
  vm_storage_os_disk_type                    = var.vm_storage_os_disk_type
  vm_storage_os_disk_size                    = 100  
  tag_support_group                          = var.tag_support_group
  tag_app_group_email                        = var.tag_app_group_email
  tag_environment_type                       = var.tag_environment_type  
  tag_expiration_date                        = var.tag_expiration_date
  tag_tier                                   = var.tag_tier
  tag_maintenance_window                     = [var.tag_maintenance_window]
  tag_on_hours                               = [var.tag_on_hours]
  tag_solution_central_id                    = var.tag_solution_central_id
  tag_sla                                    = var.tag_sla
  tag_npi                                    = var.tag_npi
  tag_webhook                                = "n/a"
  tag_description                            = "XXX"
}
```

Comments:

---------
RG naming should follow naming conventions: [Best Practices](https://wiki.fnis.com/display/fiscld/Azure+Resource+Group+Best+Practices)

All Uppercase full values below used in the file should be replaced with the intended object value, these are the values requiring replacement in the file:

1. ENVIRONMENT: only uppercase environment need to be replaced, be careful if global replace is used.
1. RESOURCE_GROUP: resource group name
1. REGION: region to deploy resource group
1. INSTANCE_NAME
1. INSTANCE_SIZE
1. XXX: indicate generic value as numbers or descriptions
