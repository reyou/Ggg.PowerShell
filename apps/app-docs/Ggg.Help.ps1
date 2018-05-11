function Ggg-GetHelp($helpTopic, $isOnline) {    
    if($isOnline){
    Get-Help $helpTopic -Online 
    }
    else
    {
    Get-Help $helpTopic -Detailed 
    }
}

# usages
<#
Ggg-GetHelp Clear-RecycleBin
#>

