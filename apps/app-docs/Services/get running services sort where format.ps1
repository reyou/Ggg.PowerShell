Clear-Host
Write-Host "Running Services"
Get-Service | Sort-Object { $_.Name } | Where-Object {$_.Status -eq "Running"}  | Format-Table -Property *