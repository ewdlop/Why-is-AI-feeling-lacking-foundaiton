#PowerShell 5

$action = New-ScheduledTaskAction -Execute 'pwsh.exe' -Argument '-File "C:\Path\To\YourScript.ps1"'
$trigger = New-ScheduledTaskTrigger -Daily -At 9am
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries
Register-ScheduledTask -Action $action -Trigger $trigger -Settings $settings -TaskName "MyPowerShellTask" -Description "Runs my PowerShell script daily at 9 AM"

#PowerShell(CORE) 7

$action = New-ScheduledTaskAction -Execute 'pwsh.exe' -Argument '-File "C:\Path\To\YourScript.ps1"'
$trigger = New-ScheduledTaskTrigger -Daily -At 9am
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries
Register-ScheduledTask -Action $action -Trigger $trigger -Settings $settings -TaskName "MyPowerShellTask" -Description "Runs my PowerShell script daily at 9 AM"
