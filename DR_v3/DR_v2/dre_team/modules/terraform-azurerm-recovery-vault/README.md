# AzureRM Recovery Vault

## Features

Deploys an Azure Recovery Vault

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
|resource_group_name|Name of the Resource Group in which to deploy these resources|String|-|Yes|
|region|Region in which to deploy these resources|String|-|Yes|
|recovery_vault_name|The name of the Recovery Vault|String|-|Yes|
|recovery_vault_sku|The sku of the Recovery Vault|String|standard|No|

## Outputs

| Name | Description | Type |
|------|-------------|:----:|
|recovery_vault_id|The ID of the Recovery Vault|String|
|recovery_vault_name|The name of the Recovery Vault|String|
