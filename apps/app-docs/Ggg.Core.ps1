Clear-Host 

<#Ggg-FindModules "Sql" #>
function Ggg-FindModules($moduleName) {
    $results = Find-Module -Filter $moduleName
    ""
    "$($results.Length) results found."
    ""
    $results | Format-Table -Property *  
    return $results
}

function Ggg-GetAllModuleRepositories() {
    Get-PSRepository | Format-List -Property *
}

function GggRunProcess($filePath, $argumentList) {
    $pinfo = New-Object System.Diagnostics.ProcessStartInfo
    $pinfo.FileName = $filePath
    $pinfo.RedirectStandardError = $true
    $pinfo.RedirectStandardOutput = $true
    $pinfo.UseShellExecute = $false
    $pinfo.Arguments = $argumentList
    $p = New-Object System.Diagnostics.Process
    $p.StartInfo = $pinfo
    $p.Start() | Out-Null
    $p.WaitForExit()
    $stdout = $p.StandardOutput.ReadToEnd()
    $stderr = $p.StandardError.ReadToEnd()
    Write-Host "stdout: $stdout"
    Write-Host "stderr: $stderr"
    Write-Host "exit code: " + $p.ExitCode
}


