Clear-Host
Write-Host "begin"
$services = Get-Service
$firstService = $services[0] 
$firstService | Format-List -Property *
"Name: " + $firstService.Name
"DependentServices: " + $firstService.DependentServices
Write-Host "end"