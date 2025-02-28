Connect-AzAccount

#variables
$drNSGName = "secondary_nsg"
$drNSGResourceGroupName = "rg-secondary"

$drNSG = Get-AzNetworkSecurityGroup -Name $drNSGName -ResourceGroupName $drNSGResourceGroupName

$vault = Get-AzRecoveryServicesVault -Name "secondary-rsv"
Set-AzRecoveryServicesAsrVaultContext -Vault $vault | Out-Null

$fabric = Get-AzRecoveryServicesAsrFabric  | Where-Object  {$_.Name -like "*primary*"}
$container = Get-AzRecoveryServicesAsrProtectionContainer -Fabric $fabric

# Get all replicated items (DR protected items) in the Recovery Services Vault
$replicatedItems = Get-AzRecoveryServicesAsrReplicationProtectedItem -ProtectionContainer $container

# Fetching the Protected Item Object (for the Protected VM)

if ($drNSG){
    foreach ($item in $replicatedItems) {
        if ($item.NicDetailsList.count -eq 1){
            Write-Output "Changing NSG Failover configuration from: ($($item.FriendlyName))"
            $nicId = $item.NicDetailsList[0].NicId
            $nic1 = New-AzRecoveryServicesAsrVMNicConfig -NicId $nicId `
                -ReplicationProtectedItem $item `
                -RecoveryVMNetworkId $item.NicDetailsList[0].RecoveryVMNetworkId `
                -RecoveryNetworkSecurityGroupId $drNSG.Id
        
            $nics = @($nic1)
            $job = Set-AzRecoveryServicesAsrReplicationProtectedItem -InputObject $item -ASRVMNicConfiguration $nics
            sleep 7
            Write-Host "($($item.FriendlyName)) : " -NoNewline
            Write-Host (Get-AzRecoveryServicesAsrJob -Job $job).State

        } else {
            Write-Error "VM has more than one NIC"
            $item.NicDetailsList
            exit
        }
    }
} else {
    Write-Error "NSG not found"
    exit
}