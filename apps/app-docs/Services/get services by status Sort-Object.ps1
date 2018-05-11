Clear-Host
Get-Service | Sort-Object -Descending {
    $_.Status
}