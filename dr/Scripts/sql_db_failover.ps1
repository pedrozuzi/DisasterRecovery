# Az.Accounts (≥ 2.11.2)

# Az.Automation (≥ 1.9.1)

$clientid = "00fb0b14-6235-4d9c-a9ab-187f0555c601"

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
    $SQLServerName = Get-AutomationVariable -Name "sql_server_name"
    $SQLServerRGName = Get-AutomationVariable -Name "sql_server_rg_name"
    $SubscriptionId = Get-AutomationVariable -Name "sql_db_failover_subscription_id"
    $Subscription = Get-AzSubscription -SubscriptionId $SubscriptionId
}
Catch
{
    $ErrorMessage = 'Failed to retrieve Load Balancer info from Automation variables.'
    $ErrorMessage += " `n"
    $ErrorMessage += 'Error: '
    $ErrorMessage += $_
    Write-Error -Message $ErrorMessage `
                   -ErrorAction Stop
}

Set-AzContext -SubscriptionObject $Subscription | Out-Null

$SQLFailoverConfig = Get-AzSqlDatabaseFailoverGroup -ServerName $SQLServerName -ResourceGroupName $SQLServerRGName

if ($SQLFailoverConfig.ReplicationRole -eq "Primary") {
    $SQLServer = Get-AzSqlServer -ResourceGroupName $SQLFailoverConfig.PartnerResourceGroupName -ServerName $SQLFailoverConfig.PartnerServerName
} elseif ($SQLFailoverConfig.ReplicationRole -eq "Secondary") {
    $SQLServer = Get-AzSqlServer -ResourceGroupName $SQLFailoverConfig.ResourceGroupName -ServerName $SQLFailoverConfig.ServerName
}

# Set appropriate context in relation to direction
$SQLFailoverConfig = Get-AzSqlDatabaseFailoverGroup -ServerName $SQLServer.ServerName -ResourceGroupName $SQLServer.ResourceGroupName

# Trigger DB failover
try {
    Switch-AzSqlDatabaseFailoverGroup -ResourceGroupName $SQLFailoverConfig.ResourceGroupName -ServerName $SQLFailoverConfig.ServerName -FailoverGroupName $SQLFailoverConfig.FailoverGroupName -ErrorVariable $FailoverError
    "Failover complete from $($SQLFailoverConfig.PartnerLocation) to $($SQLFailoverConfig.Location)"
    "`tNew primary server: $($SQLFailoverConfig.ServerName)"
    "`tNew secondary server: $($SQLFailoverConfig.PartnerServerName)"
}
catch {
    "Error with DB failover:"
    $FailoverError
}