Clear-Host

function GggGetJavaVersion(){
    start-process  java  -ArgumentList "-version" -NoNewWindow -RedirectStandardError .\javaver.txt -Wait
    $javaver = Get-Content .\javaver.txt
    Remove-Item .\javaver.txt -Force 
    return $javaver;
}
