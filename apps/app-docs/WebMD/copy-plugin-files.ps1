# QA02
# AFOWS98Q-CON-08 
# E:\Telligent\PluginLibraries\copy-plugin-files.ps1
clear-host
# stop service
$serviceName = "Telligent Community Job Service"
$pluginsFolder = "E:\Telligent\PluginLibraries"
$serviceFolder = "E:\Telligent\JobService"
$webFolder = "E:\Telligent\Web\bin"
$waitSeconds = 5
$service = Get-Service | Where-Object {$_.Name.Contains($serviceName)} | Select-Object -Last 1
if ((Test-Path -Path $pluginsFolder) -eq $true) {
    if ($service.Status -eq "Running") {
        write-host "Stopping Service:" $service.Name
        stop-service $service.Name -Force 
        write-host "Waiting" $waitSeconds "seconds"
        Start-Sleep -Seconds $waitSeconds
        write-host "Stopped Service:" $service.Name
        write-host
    }
    # copy files to target
    $plugInFiles = Get-ChildItem $pluginsFolder
    foreach ($plugInFile in $plugInFiles) {
        if (!$plugInFile.Name.EndsWith(".ps1")) {
            # copy to service folder
            Copy-Item -Path $plugInFile.FullName -Destination $serviceFolder -Force
            write-host "Copied:" $plugInFile.FullName
            write-host "To:" $serviceFolder
            write-host
            # copy to web folder
            Copy-Item -Path $plugInFile.FullName -Destination $webFolder -Force
            write-host "Copied:" $plugInFile.FullName
            write-host "To:" $webFolder
            write-host
        }
    }
    # start service
    write-host "Starting Service:" $service.Name
    start-service $service.Name 
    write-host "Started Service:" $service.Name
}
else {
    Write-Warning "File or directory does not exist: $pluginsFolder"        
}
