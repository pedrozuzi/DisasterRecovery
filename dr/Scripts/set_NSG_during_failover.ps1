# param (
#     [string]$ResourceGroupName,
#     [string]$NSGName,
#     [string]$NSGResourceGroupName,
#     [array]$VMNames
# )

# # Connect to Azure
# try {
#     $AzureContext = (Connect-AzAccount -Identity).Context
#     Write-Output "Authenticated successfully as Managed Identity."
# } catch {
#     Write-Error "Failed to authenticate to Azure. Ensure the runbook has a Managed Identity assigned."
#     exit
# }

# Get NSG
$NSG = Get-AzNetworkSecurityGroup -ResourceGroupName $NSGResourceGroupName -Name $NSGName
if (-not $NSG) {
    Write-Error "NSG '$NSGName' not found in resource group '$NSGResourceGroupName'."
    exit
}

Write-Output "Found NSG: $NSGName"

foreach ($VMName in $VMNames) {
    Write-Output "Processing VM: $VMName"

    # Get VM details
    $VM = Get-AzVM -ResourceGroupName $ResourceGroupName -Name $VMName -ErrorAction SilentlyContinue
    if (-not $VM) {
        Write-Error "VM '$VMName' not found in resource group '$ResourceGroupName'. Skipping..."
        continue
    }

    # Get the primary NIC
    $NIC = Get-AzNetworkInterface | Where-Object { $_.Id -eq $VM.NetworkProfile.NetworkInterfaces[0].Id }
    if (-not $NIC) {
        Write-Error "NIC for VM '$VMName' not found. Skipping..."
        continue
    }

    Write-Output "Associating NSG '$NSGName' with NIC '$($NIC.Name)'..."

    # Associate NSG with NIC
    $NIC.NetworkSecurityGroup = $NSG
    Set-AzNetworkInterface -NetworkInterface $NIC

    Write-Output "Successfully associated NSG with VM: $VMName"
}

Write-Output "NSG association process completed."
