$scriptPath = "C:\Scripts"
if (-not (Test-Path $scriptPath)) {
   New-Item -ItemType Directory -Path $scriptPath -Force
}
$psFile = "$scriptPath\Initialize_New_Disks.ps1"
$script = @'
$rawDisks = Get-Disk | Where-Object { $_.PartitionStyle -eq "RAW" -and $_.IsSystem -eq $false }
foreach ($disk in $rawDisks) {
   try {
       Initialize-Disk -Number $disk.Number -PartitionStyle GPT -PassThru | Out-Null
       Write-Output "Initialized disk number $($disk.Number)"
   } catch {
       Write-Warning "Failed to initialize disk $($disk.Number): $_"
   }
}
'@
$script | Set-Content -Path $psFile -Encoding UTF8
schtasks /Create /TN "InitializeNewDisksOnArrival" /TR "powershell.exe -ExecutionPolicy Bypass -File `"$psFile`"" /SC ONEVENT /EC System /MO "*[System[Provider[@Name='Disk'] and (EventID=11)]]" /RU SYSTEM /RL HIGHEST /F