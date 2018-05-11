#==============================================================================
Clear-Host

# GggGetRunningServices
#==============================================================================

# GggGetServicesByStatus 
#==============================================================================
function GggGetServicesByName($filter) {
    Get-Service -Include "*$filter*" | Sort-Object -Descending {
        $_.Status
    } | Format-List 
}
#==============================================================================
function GggStopService($name) {
    Stop-Service -Name $name -Force
}
# GggStopService "CouchbaseServer"
# GggStopService "MSSQLSERVER"
#==============================================================================
function GggStartService($name) {
    start-Service -Name $name 
}
#==============================================================================