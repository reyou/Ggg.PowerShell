# https://www.youtube.com/watch?v=Ab46gHXNm8Q&t=50s&list=WL&index=1
cls
$uri = "http://www.gamegogo.org"
$x = Invoke-WebRequest $uri
# $x.GetType() | Format-List -Property *
# Install-Package powershellcookbook -AllowClobber
#Show-Object $x
$rm =  Invoke-RestMethod "api.github.com/repos/Powershell/Powershell/releases"
Show-Object $rm

