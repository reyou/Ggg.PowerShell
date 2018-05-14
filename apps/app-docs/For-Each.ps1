Get-Service | Sort-Object {$_.Status} | ForEach-Object {
    $_ 
}