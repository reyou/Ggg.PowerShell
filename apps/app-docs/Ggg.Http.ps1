<#Makes web request to url#>
<#Ggg-WebRequest www.gamegogo.org#>
function Ggg-WebRequest($url){
  return Invoke-WebRequest $url
}


<#get images from web request#>
<#Ggg-GetWebRequestImages www.gamegogo.org#>
function Ggg-GetWebRequestImages($url){
    $response = Ggg-WebRequest $url
    return $response.Images;
}

function Ggg-Get-WebClient(){
    $webClient = (New-Object System.Net.WebClient);
    return $webClient
}


<#Ggg-WebRequest-Get http://www.gamegogo.org#>
function Ggg-WebRequest-Get($url){
    $webClient = Ggg-Get-WebClient;
    $webClient.DownloadString($url)
}