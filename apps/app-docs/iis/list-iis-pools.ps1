Import-Module WebAdministration
$items = Get-ChildItem –Path IIS:\AppPools    
$counter = 1
$items | ForEach-Object {
    Write-Host $counter"-"
    $_
    Write-Host "===================================================`n"
    $counter++
}