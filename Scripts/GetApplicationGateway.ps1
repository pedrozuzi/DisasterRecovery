$clientId = "cfcd1bfe-fc19-4d9d-8509-9adcd4ba4dff"

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
    $AppGwStartName = Get-AutomationVariable -Name "appgw_name_start"
    $AppGwRGStartName = Get-AutomationVariable -Name "appgw_rg_name_start"
    $AppGwStopName = Get-AutomationVariable -Name "appgw_name_stop"
    $AppGwRGStopName = Get-AutomationVariable -Name "appgw_rg_name_stop"
    
    $SubscriptionId = Get-AutomationVariable -Name "appgw_subscription_id"
    $Subscription = Get-AzSubscription -SubscriptionId $SubscriptionId
} catch {
    $ErrorMessage = "Failed to retrieve Load Balancer info from Automation variables."
    Write-Error -Message $ErrorMessage -ErrorAction Stop
}

Set-AzContext -SubscriptionObject $Subscription | Out-Null

# Stop AppGw
if ($AppGwStopName -ne "none") {
    $AppGwStop = Get-AzApplicationGateway -Name $AppGwStopName -ResourceGroupName $AppGwRGStopName

    # Only stop AppGw if it's already running
    if ($AppGwStop.OperationalState -eq "Running") {
        Write-Output "Stopping $($AppGwStop.Name)..."
        Stop-AzApplicationGateway -ApplicationGateway $AppGwStop
    } else {
        Write-Output "Application Gateway $($AppGwStop.Name) is already stopped"
    }
}

# Start AppGw
$AppGwStart = Get-AzApplicationGateway -Name $AppGwStartName -ResourceGroupName $AppGwRGStartName

# Check if target AppGw is already running; if so, stop it first
if ($AppGwStart.OperationalState -eq "Running") {
    Write-Output "Application Gateway $($AppGwStart.Name) is already running. Stopping first..."
    Stop-AzApplicationGateway -ApplicationGateway $AppGwStart
}

try {
    Write-Output "Starting $($AppGwStart.Name)..."
    Start-AzApplicationGateway -ApplicationGateway $AppGwStart
} catch {
    Write-Output "Error stopping $($AppGwStart.Name)"
}

Write-Output "Starting $($AppGwStart.Name)..."
Start-AzApplicationGateway -ApplicationGateway $AppGwStart