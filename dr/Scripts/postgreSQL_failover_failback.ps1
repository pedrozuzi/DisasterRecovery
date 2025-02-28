$clientId = "00fb0b14-6235-4d9c-a9ab-187f0555c601"

try {
    Disable-AzContextAutosave -Scope Process
    Write-Output "Logging in to Azure..."
    Connect-AzAccount -Identity -AccountId $clientId
    Get-AzSubscription
} catch {
    Write-Error -Message $_.Exception
    throw $_.Exception
}

# Get Automation Variables
try {
    #$postgreStartName = Get-AutomationVariable -Name "postgre_name_start"
    #$postgreRGStartName = Get-AutomationVariable -Name "postgre_rg_name_start"
    $postgreStopName = Get-AutomationVariable -Name "postgre_name_stop"
    $postgreRGStopName = Get-AutomationVariable -Name "postgre_rg_name_stop"
    
    $SubscriptionId = Get-AutomationVariable -Name "appgw_subscription_id"
    $Subscription = Get-AzSubscription -SubscriptionId $SubscriptionId
} catch {
    $ErrorMessage = "Failed to retrieve Load Balancer info from Automation variables."
    Write-Error -Message $ErrorMessage -ErrorAction Stop
}

Set-AzContext -SubscriptionObject $Subscription | Out-Null
az login --identity --username $clientId

#promote secondary PostgreSQL to primary
az postgres flexible-server replica promote --resource-group $postgreRGStopName --name $postgreStopName --promote-mode switchover --promote-option planned --yes