param(
    [Object]$RecoveryPlanContext
)

$clientid = "{clientidtoreplace}"

try
{
    Disable-AzContextAutosave -Scope Process
    "Logging in to Azure..."
    Connect-AzAccount -Identity -AccountId $clientid
    Get-AzSubscription
}
catch {
    Write-Error -Message $_.Exception
    throw $_.Exception
}

# Get Automation Variables
Try
{
    $SubscriptionId = Get-AutomationVariable -Name "asg_association_subscription_id"
    $Subscription = Get-AzSubscription -SubscriptionId $SubscriptionId
} Catch {
    $ErrorMessage = 'Failed to retrieve Load Balancer info from Automation variables.'
    $ErrorMessage += " `n"
    $ErrorMessage += 'Error: '
    $ErrorMessage += $_
    Write-Error -Message $ErrorMessage `
                   -ErrorAction Stop

}

Set-AzContext -SubscriptionObject $Subscription | Out-Null

# Get ASR Recovery Plan Context VM Map
$VMinfo = $RecoveryPlanContext.VmMap | Get-Member | Where-Object MemberType -EQ NoteProperty | select -ExpandProperty Name
$vmMap = $RecoveryPlanContext.VmMap

# Get all VMs, update corresponding NICs
foreach ($VMID in $VMinfo) {
    $VMtemp = $vmMap.$VMID
    $VM = Get-AzVM -ResourceGroupName $VMtemp.ResourceGroupName -Name $VMtemp.RoleName
    
    # Get NIC & target appropriate ASG
    $NIC = Get-AzNetworkInterface -Name ($VM.NetworkProfile.NetworkInterfaces.Id -split "/")[-1] -ResourceGroupName $VM.ResourceGroupName
    $ASG = Get-AzApplicationSecurityGroup -ResourceGroupName $Vm.ResourceGroupName -Name $VM.Tags.ASG
    if ($NIC.IpConfigurations.LoadBalancerBackendAddressPools.Count -eq 0) {

        # No LB Backends present
        Set-AzNetworkInterfaceIpConfig -NetworkInterface $NIC -Name $NIC.IpConfigurations[0].Name -ApplicationSecurityGroup $ASG | Out-Null

    } else {

        # LB Backends present
        Set-AzNetworkInterfaceIpConfig -NetworkInterface $NIC -Name $NIC.IpConfigurations[0].Name -ApplicationSecurityGroup $ASG -LoadBalancerBackendAddressPool $NIC.IpConfigurations.LoadBalancerBackendAddressPools | Out-Null

    }
    Set-AzNetworkInterface -NetworkInterface $NIC | Out-Null
    "$($NIC.Name) assigned to $($ASG.Name)..."

}