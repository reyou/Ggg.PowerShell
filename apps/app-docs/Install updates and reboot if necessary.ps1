# https://community.spiceworks.com/topic/1394485-fun-with-powershell-install-updates-and-reboot-if-necessary-then-get-an-e-mail
$thisComputer = $env:COMPUTERNAME
 

#Define update criteria.

$Criteria = "IsInstalled=0 and Type='Software'"

#Search for relevant updates.

$Searcher = New-Object -ComObject Microsoft.Update.Searcher

$SearchResult = $Searcher.Search($Criteria).Updates

#Download updates.

$Session = New-Object -ComObject Microsoft.Update.Session

$Downloader = $Session.CreateUpdateDownloader()

$Downloader.Updates = $SearchResult

$Downloader.Download()


#Install updates.

$Installer = New-Object -ComObject Microsoft.Update.Installer

$Installer.Updates = $SearchResult

$Result = $Installer.Install()

#Reboot if required by updates.

If ($Result.rebootRequired) 
	{ 
		$timeStamp = get-date -Format hh:mm
		$todaysDate = get-date -format D
		$RebootResult = "The server: " + $thisComputer `
        + " has installed its updates and requires a reboot. It began rebooting at: " `
        + $timeStamp + " on " + $todaysDate
		Write-Host $RebootResult
		# shutdown.exe /t 0 /r 
	}
If (!$Result.rebootRequired)
	{
		$timeStamp = get-date -Format hh:mm
		$todaysDate = get-date -format D
		$RebootResult = "The server: " + $thisComputer `
        + " has installed its updates and did not require a reboot. It finished installing its updates at:" `
        + $timeStamp + " on " + $todaysDate
		Write-Host $RebootResult
	}
