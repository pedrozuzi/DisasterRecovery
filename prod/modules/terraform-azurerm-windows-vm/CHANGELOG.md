# Changelog
# ICS Standard Terraform Module
All notable changes to this module will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this module adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.0] - 2024-10-14
### Changed
- Managed identity block to support user assigned identity type and option to input a list of user assigned managed identity ids

## [1.1.0] - 2024-10-09
### Changed
- enable_accelerated_networking properties are deprecated and superseded by the accelerated_networking_enabled in terraform provider release [3.108.0](https://learn.microsoft.com/en-us/azure/developer/terraform/provider-version-history-azurerm-3-0-0-to-3-116-0#31080-june-13-2024)
- Minimum required provider bumped up to 3.108.0
### Removed
- Log Analytics Agent related variables
## [1.0.0] - 2024-05-31
### Added
 - tf_module_tags for Module Name and version (values are pre-populated by module)

## [0.2.11] - 2024-04-12
### Changed
- Update for private managed disk access

## [0.2.10] - 2023-03-12
### Added
- Disk name in lifecycle ignore block to avoid vm getting recreated when migrating from deprecated vm module

## [0.2.9] - 2023-12-14
### Added
- Support for Azure Hybrid Use Benefit

## [0.2.8] - 2023-05-30
### Added
- Disk access creation for private access policy for managed disk

## [0.2.7] - 2023-05-30
### Changed
- lun logic to avoid destroy attachments

## [0.2.6] - 2023-05-23
### Added
 - 	source_image_reference to lifecycle ignore_changes

## [0.2.4] - 2023-04-18
### Added
-  remove public access to managed vm disk

## [0.2.3] - 2023-04-13
### Changed
-  fix public_ip_address_id value parsing error

## [0.2.3] - 2022-12-08
### Added
-  vm custom data support

## [0.2.1] - 2022-10-28
### Removed
-  BUC and CustomerCMRID tags

## [0.2.0] - 2022-10-18
### Changed
-  formatting var.vm_image_id as required var
### Removed
- Attributes for marketplace image specification on vm

## [0.1.0] - 2022-05-12
### Added
-  Initial Module