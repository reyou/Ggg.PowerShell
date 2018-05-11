Import-Module WebAdministration
$items = Get-ChildItem –Path IIS:\AppPools    
$counter = 1
$items | foreach {
    Write-Host $counter"-"
    $_
    Write-Host "===================================================`n"
    $counter++
}