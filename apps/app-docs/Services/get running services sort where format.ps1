Clear-Host
Write-Host "Running Services"
# Format Table
Get-Service | Sort-Object { $_.Name } | Where-Object {$_.Status -eq "Running"}  | Format-Table -Property * 
# Filter by name and Format List
Get-Service | Where-Object {$_.Status -eq "Running" -and $_.Name.Contains("Telligent")} | Format-List -Property *
