# Changelog
# ICS Standard Terraform Module
All notable changes to this module will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this module adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.3.0] - 2024-10-14
### Changed
- Managed identity block to support user assigned identity type and option to input a list of user assigned managed identity ids

## [1.2.0] - 2024-10-09
### Changed
- enable_accelerated_networking properties are deprecated and superseded by the accelerated_networking_enabled in terraform provider release [3.108.0](https://learn.microsoft.com/en-us/azure/developer/terraform/provider-version-history-azurerm-3-0-0-to-3-116-0#31080-june-13-2024)
- Minimum required provider bumped up to 3.108.0
### Removed
- Log Analytics Agent related variables
## [1.1.1] - 2024-07-03
### Added
 - License Type Support for the Virtual Machine

## [1.0.1] - 2024-06-19
### Fixed
- Patching script to download to /root instead of /tmp to fix permission denied error due to CIS standard enforcements 

## [1.0.0] - 2024-05-31
### Added
 - BoKS
 - New variable bks_pre_reg_grp_nm for BoKS pre-registration group
 - tf_module_tags for Module Name and version (values are pre-populated by module)
 - VM user data support 

## [0.6.8] - 2024-05-09
### Added
- source_image_id added to lifecycle ignore changes

## [0.6.7] - 2023-10-27
### Changed
- Linux AMA extension handler version from `1.28.0` to `1.28`

## [0.6.6] - 2023-10-27
### Changed
- AADSSHLoginForLinux extension dependency updated from DependencyAgentLinux to AzureMonitorLinuxAgent

## [0.6.6] - 2023-10-27
### Changed
- AADSSHLoginForLinux extension dependency updated from DependencyAgentLinux to AzureMonitorLinuxAgent

## [0.6.5] - 2023-10-27
### Added
- AzureMonitorLinuxAgent extension
### Removed
 - DependencyAgentLinux extension

## [0.6.4] - 2023-10-27
### Removed
 - OmsAgentForLinux extension

## [0.6.3] - 2023-10-20
### Added
-  disk_iops_read_write parameter added in azurerm_managed_disk resource

## [0.6.2] - 2023-06-28
### Changed
-  NSG rule to allow inbound from BoKS

## [0.6.1] - 2023-06-28
### Changed
-  NSG rule to allow inbound from BoKS

## [0.6.0] - 2023-06-28
### Changed
-  NSG rule to allow inbound from BoKS
-  Variables for NSG rules

## [0.5.9] - 2023-06-27
### Added
-  NSG rule to allow inbound from BoKS
-  Variables for NSG rules

## [0.5.8] - 2023-06-21
### Added
-  azurerm_disk_access resource
-  Variables for disk_access_name

## [0.5.7] - 2023-04-28
### Added
-  network_access_policy in azurerm_managed_disk resource
-  public_network_access_enabled in azurerm_managed_disk resource to block public access

### Removed
- remove the host entry from /etc/host due to issue with DR

## [0.5.6] - 2023-04-18
### Removed
- remove public access to managed vm disk

## [0.5.5] - 2023-04-04
### Changed
- fix public_ip_address_id  parameter logic in azurerm_network_interface

## [0.5.4] - 2023-04-04
### Changed
- fix public_ip_address_id  parameter logic in azurerm_network_interface

## [0.5.3] - 2023-04-04
### Changed
- update for oms agent extention type handler version variable

## [0.5.2] - 2023-04-03
### Changed
- variablize all the extension handler versions

## [0.5.1] - 2023-03-21
### Removed
- nswitch dependency for BoKS name and address resoulution

## [0.5.0] - 2023-03-01
### Added
- resource outputs for VMs & NICs

## [0.4.5] - 2022-12-08
### Added
- vm custom data support

## [0.4.4] - 2022-11-03
### Added
- domain-suffix in hostname

## [0.4.3] - 2022-11-03
### Removed
- BUC and CustomerCMRID tags

## [0.4.2] - 2022-10-07

### Changed
- updated patching script

## [0.4.1] - 2022-09-23

### Changed
- minor "list tag" update for element index wrapping

## [0.4.0] - 2022-09-22

### Removed
- marketplace image specs

## [0.3.0] - 2022-05-22
### Changed
- final certification mods (fmt)

## [0.2.4] - 2022-05-22
### Changed
- OmsAgentForLinux type handler version

### Removed
- AzureEnhancedMonitorForLinux extension

## [0.2.0] - 2022-05-06
### Added
- Patching extension

### Removed
- AzureEnhancedMonitorForLinux extension

## [0.1.3] - 2022-04-18
### Changed
- LUN operation fix in azurerm_virtual_machine_data_disk_attachment resource

## [0.1.0] - 2022-03-16
### Added
- Initial Module