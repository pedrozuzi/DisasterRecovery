# Connect to Azure Account
# Connect-AzAccount

# Variables
$sub = "zuzi-02"
$vaultResourceGroup = "rg-secondary"
$vaultName = "secondary-rsv"
$DrApplicationGatewayName = "secondary_appgw"
$DrApplicationGatewayResourceGroup = "rg-secondary"
$ProdApplicationGatewayName = "primary_appgw"
$ProdApplicationGatewayResourceGroup = "rg-primary"
$recoveryPlanName = "recover-plan"
$primaryPlanVMs = @()
$secondaryPlanVMs = @()

# Select the subscription
Select-AzSubscription -Subscription $sub | Out-Null

# Set Recovery Services Vault Context
$vault = Get-AzRecoveryServicesVault -ResourceGroupName $vaultResourceGroup -Name $vaultName
Set-AzRecoveryServicesAsrVaultContext -Vault $vault | Out-Null

# Get the ASR fabric and protection container
$fabric = Get-AzRecoveryServicesAsrFabric | Where-Object { $_.Name -like "*primary*" }
$container = Get-AzRecoveryServicesAsrProtectionContainer -Fabric $fabric

# Get all replicated items (DR protected items) in the Recovery Services Vault
$replicatedItems = Get-AzRecoveryServicesAsrReplicationProtectedItem -ProtectionContainer $container

$plan = Get-AzRecoveryServicesAsrRecoveryPlan -Name $recoveryPlanName

#Get all Replicated VMs (secondary Region) from the Recovery Plan to stop
foreach ($item in $plan.Groups[2].ReplicationProtectedItems) {
    # Find the corresponding VM in the replicated items
    $vm = $replicatedItems | Where-Object { $_.Id -eq $item.Id }

    if ($vm) {
        # Extract VM details
        $vmName = $vm.Name
        $vmResourceGroup = $vm.ProviderSpecificDetails.RecoveryFabricObjectId
        $vmResourceGroup = ($vmResourceGroup -split "/")[4]

        Write-Output "VM in Recovery Plan & Secondary Region: $vmName (RG: $vmResourceGroup)"

        # Store VM details
        $SecondaryPlanVMs += [PSCustomObject]@{
            Name = $vmName
            ResourceGroup = $vmResourceGroup
        }
    }
}

#Get all VMs from the Recovery Plan to start (primary Region)
foreach ($item in $plan.Groups[2].ReplicationProtectedItems) {
    # Find the corresponding VM in the replicated items
    $vm = $replicatedItems | Where-Object { $_.Id -eq $item.Id }

    if ($vm) {
        # Extract VM details
        $vmName = $vm.FriendlyName
        $vmResourceGroup = $vm.ProviderSpecificDetails.FabricObjectId
        $vmResourceGroup = ($vmResourceGroup -split "/")[4]

        Write-Output "VM in Recovery Plan & Primary Region: $vmName (RG: $vmResourceGroup)"

        # Store VM details
        $primaryPlanVMs += [PSCustomObject]@{
            Name = $vmName
            ResourceGroup = $vmResourceGroup
        }
    }
}

# Output list of Secondary region VMs in the recovery plan
Write-Output "Total Secondary Region VMs in Recovery Plan: $($SecondaryPlanVMs.Count)"

# Stop VMs in the secondary region
foreach ($vm in $SecondaryPlanVMs) {
    Write-Output "Stopping VM: $($vm.Name) in RG: $($vm.ResourceGroup)"
    Stop-AzVM -ResourceGroupName $vm.ResourceGroup -Name $vm.Name -force -NoWait
}

# Wait until all DR VMs are stopped
Write-Output "Waiting for all DR VMs to be stopped..."
$allStopped = $false

while (-not $allStopped) {
    Start-Sleep -Seconds 10  # Wait before checking again

    # Check the power state of each VM
    $stoppedCount = 0
    foreach ($vm in $SecondaryPlanVMs) {
        $status = (Get-AzVM -ResourceGroupName $vm.ResourceGroup -Name $vm.Name -Status).Statuses |
                  Where-Object { $_.Code -like "PowerState*" } | Select-Object -ExpandProperty Code

        Write-Output "VM: $($vm.Name) - Status: $status"

        if ($status -eq "PowerState/deallocated") {
            $stoppedCount++
        }
    }

    # If all VMs are stopped, exit loop
    if ($stoppedCount -eq $SecondaryPlanVMs.Count) {
        $allStopped = $true
    }
}

Write-Output "All DR VMs are stopped. Proceeding..."

Write-Output "stopping AppGw: $($DrApplicationGatewayName)"
sleep 2
$appgw=Get-AzApplicationGateway -Name $DrApplicationGatewayName -ResourceGroupName $DrApplicationGatewayResourceGroup
Stop-AzApplicationGateway -ApplicationGateway $appgw

# Output list of primary region VMs in the recovery plan
Write-Output "Total Primary Region VMs in Recovery Plan: $($primaryPlanVMs.Count)"

# Start VMs in the primary region
foreach ($vm in $primaryPlanVMs) {
    Write-Output "Starting VM: $($vm.Name) in RG: $($vm.ResourceGroup)"
    Start-AzVM -ResourceGroupName $vm.ResourceGroup -Name $vm.Name -NoWait
}

Write-Output "All primary region VMs from the recovery plan are starting..."

Write-Output "starting AppGw: $($prodApplicationGatewayName)" 
sleep 2
$appgw = Get-AzApplicationGateway -Name $prodApplicationGatewayName -ResourceGroupName $ProdApplicationGatewayResourceGroup
Start-AzApplicationGateway -ApplicationGateway $appgw