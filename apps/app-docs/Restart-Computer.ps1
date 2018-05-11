# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/restart-computer?view=powershell-5.1
#==============================================================================
# Restart the local computer
function Ggg-Restart-Computer {
    Restart-Computer  
}
#==============================================================================
# Restart several computers including the local computer
function Ggg-Restart-Computer-Multi {
    Restart-Computer -ComputerName "Server01", "Server02", "localhost"
}
#==============================================================================
# Restart computers as a background job
function Ggg-Restart-Computer-Job {
    <#The first command uses the *AsJob* parameter to run the command as a background 
    job. The command stores the resulting job object in the $j variable.#>
    $j = Restart-Computer -ComputerName "Server01", "Server02" -AsJob
    <#The second command uses a pipeline operator to send the job object in 
    $j to the Receive-Job cmdlet, which gets the job results. 
    The command stores the results in the $Results variable.#>
    $Results = $j | Receive-Job
    <#The third command displays the result stores in the $Results variable.
    Because *AsJob* creates the job on the local computer and automatically returns 
    the results to the local computer, you can run **Receive-Job** as a local command.#>
    $Results
}
#==============================================================================
# Restart a remote computer
function Ggg-Restart-Computer-Remote {
    Restart-Computer -ComputerName "Server01" -Impersonation Anonymous -Authentication PacketIntegrity  
}
#==============================================================================
# Force restart of all computers in a domain
function Ggg-Restart-Computer-Force-All {
    <#The first command uses the Get-Content cmdlet to get a list of computers 
    in the domain from the Domain01.txt file. It stores the list in the $s 
    variable.#>
    $s = Get-Content Domain01.txt
    <#The second command gets the credentials of a domain administrator and stores 
    them in the $c variable.#>
    $c = Get-Credential Domain01\Admin01
    <#The third command restarts the computers. It uses the *ComputerName* parameter 
    to submit the list of computers in the $s variable, the *Force* parameter to 
    force an immediate restart, and the *Credential* parameter to submit the 
    credentials saved in the $c variable. It also uses the *ThrottleLimit* parameter 
    to limit the command to 10 concurrent connections.#>
    Restart-Computer -ComputerName $s -Force -ThrottleLimit 10 -Credential $c
}
#==============================================================================
$date = get-date
Write-Host "File has been compiled at $date." 
#==============================================================================
