#==============================================================================
Clear-Host
#==============================================================================
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
#==============================================================================
function GggRunMsBuild() {
$sln = "C:\WebMD_Projects\webmd.community\WebMD.Community.sln" 
$params = "/tv:14.0"
GggRunProcess "msbuild" "$sln $params"
}
# GggRunMsBuild
#==============================================================================
function GggRunMsBuild2() {
cd "C:\WebMD_Projects\webmd.community\"
$sln = "WebMD.Community.sln" 
$params = ""
$arguments = $sln + " " + $params
Write-Host "arguments: $arguments"
msbuild $arguments
}
GggRunMsBuild2
#==============================================================================