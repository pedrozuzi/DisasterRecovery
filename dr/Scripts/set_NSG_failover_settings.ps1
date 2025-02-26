Connect-AzAccount

$vault = Get-AzRecoveryServicesVault -Name "secondary-rsv"
Set-AzRecoveryServicesAsrVaultContext -Vault $vault | Out-Null

$fabric = Get-AzRecoveryServicesAsrFabric  | Where-Object  {$_.Name -like "*primary*"}
$container = Get-AzRecoveryServicesAsrProtectionContainer -Fabric $fabric

# Get all replicated items (DR protected items) in the Recovery Services Vault
$replicatedItems = Get-AzRecoveryServicesAsrReplicationProtectedItem -ProtectionContainer $container

# Fetching the Protected Item Object (for the Protected VM)

foreach ($item in $replicatedItems) {
    $nic1 = New-AzRecoveryServicesAsrVMNicConfig -NicId $nicId `
        -ReplicationProtectedItem $item `
        -RecoveryVMNetworkId $item.NicDetailsList[0].RecoveryVMNetworkId `
        -RecoveryNetworkSecurityGroupId "/subscriptions/d0eff89d-ff78-4c52-be45-e46370c50d94/resourceGroups/rg-secondary/providers/Microsoft.Network/networkSecurityGroups/secondary_nsg"

    $nics = @($nic1)
    $job = Set-AzRecoveryServicesAsrReplicationProtectedItem -InputObject $item -ASRVMNicConfiguration $nics
}