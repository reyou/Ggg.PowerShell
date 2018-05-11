$moduleName = "Bing"
$results = Find-Module -Name $moduleName 
$results | Format-List -Property *  
foreach ($item in $results) {
    $item
}