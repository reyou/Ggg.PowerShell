Clear-Host
 
Import-Module WebAdministration

#==============================================================================
# http://www.tomsitpro.com/articles/powershell-manage-iis-application-pools,2-992.html
function GggListIISPools(){
    $items = Get-ChildItem –Path IIS:\AppPools    
    $counter = 1
    $items | foreach {
        Write-Host $counter"-"
        $_
        Write-Host "===================================================`n"
        $counter++
    }
}

#==============================================================================
function GggListAppPoolProperties($appPoolName){
    Get-ItemProperty IIS:\AppPools\$appPoolName | select *
}
#==============================================================================
# https://technet.microsoft.com/en-us/library/ee790580.aspx?f=255&MSPPError=-2147217396
function GggRestartWebAppPool($appPoolName){
    Restart-WebAppPool -Name $appPoolName 
    Write-Host "GggMessage: $appPoolName has been restarted."  
}
#==============================================================================
GggRestartWebAppPool "DefaultAppPool"