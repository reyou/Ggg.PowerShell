Clear-Host
$logPath = "E:\app.log"
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-content?view=powershell-6
$lastEventTime = Get-Date -Date "1970-01-01 00:00:00Z" 
while($true) 
{

$contents = Get-Content -Path $logPath -Tail 5

$contents | ForEach-Object { 
$jsonObject = ConvertFrom-Json $_ 

if($jsonObject.EventTime -gt $lastEventTime) {
$lastEventTime = $jsonObject.EventTime

Write-Host "level: " $jsonObject.level
Write-Host "env: " $jsonObject.env
Write-Host "EventTime: " $jsonObject.EventTime
Write-Host "message: " $jsonObject.message
# Write-Host "exception: " $jsonObject.exception
Write-Host ""
Write-Host "=============================================="
Write-Host ""
}

}

Start-Sleep -Seconds 3
}
