#PowerShell 5

$action = New-ScheduledTaskAction -Execute 'python.exe' -Argument '"C:\Path\To\cron-job.py"'
$trigger = New-ScheduledTaskTrigger -Daily -At 9am
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries
Register-ScheduledTask -Action $action -Trigger $trigger -Settings $settings -TaskName "MyPythonTask" -Description "Runs my Python script daily at 9 AM"

#PowerShell(CORE) 7

$action = New-ScheduledTaskAction -Execute 'python.exe' -Argument '"C:\Path\To\cron-job.py"'
$trigger = New-ScheduledTaskTrigger -Daily -At 9am
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries
Register-ScheduledTask -Action $action -Trigger $trigger -Settings $settings -TaskName "MyPythonTask" -Description "Runs my Python script daily at 9 AM"
