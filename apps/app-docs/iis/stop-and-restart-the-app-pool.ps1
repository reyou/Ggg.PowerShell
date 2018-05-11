# Use PowerShell to stop and restart the app pool (requires PowerShell 5 or later):
# https://docs.microsoft.com/en-us/aspnet/core/host-and-deploy/iis/?view=aspnetcore-2.1&tabs=aspnetcore2x

$webAppPoolName = 'APP_POOL_NAME'

# Stop the AppPool
if ((Get-WebAppPoolState $webAppPoolName).Value -ne 'Stopped') {
    Stop-WebAppPool -Name $webAppPoolName
    while ((Get-WebAppPoolState $webAppPoolName).Value -ne 'Stopped') {
        Start-Sleep -s 1
    }
    Write-Host `-AppPool Stopped
}

# Provide script commands here to deploy the app

# Restart the AppPool
if ((Get-WebAppPoolState $webAppPoolName).Value -ne 'Started') {
    Start-WebAppPool -Name $webAppPoolName
    while ((Get-WebAppPoolState $webAppPoolName).Value -ne 'Started') {
        Start-Sleep -s 1
    }
    Write-Host `-AppPool Started
}

