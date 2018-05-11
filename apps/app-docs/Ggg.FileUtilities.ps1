Clear-Host

<#import begin#>
$currentDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
. "$currentDir\Ggg.Core.ps1"
<#import end#>

#==============================================================================
function GggCopyWithExtension($fileName, $extension){
$file  = Get-Item $fileName
#$file | Format-List -Property *
$directoryName = $file.DirectoryName
$fullName = $file.FullName;
$baseName = $file.BaseName;
$targetFileName = $directoryName + "\" + $baseName + $extension;
$targetFileName
Copy-Item -Path $fileName -Destination $targetFileName -Force
}
# GggCopyWithExtension "Ggg.NugetApp.First.1.0.0.nupkg" ".zip"
#==============================================================================
function GggFirstFileWithExtension($folder, $extension) {
$fileWithExtension = Get-ChildItem $folder -Recurse -Filter "*$extension" | Select-Object -First 1
return $fileWithExtension.FullName
}
# GggFirstFileWithExtension "C:\Github\Ggg\Ggg.NuGet\app\NugetClassLibrary" ".nupkg"
#==============================================================================
function GggCopyFilesToFolder ($fromFolder, $toFolder) {
    $childItems = Get-ChildItem $fromFolder
    $childItems | ForEach-Object {
         Copy-Item -Path $_.FullName -Destination $toFolder -Recurse -Force
    }
}

<#GggSearchInFolder "c:\" "*tensor*"#>
function GggSearchInFolder($folder, $filter) {
    $items = Get-ChildItem $folder -Filter "$filter" -Recurse -ErrorAction Ignore
    ""
    "Ggg Total Result: $($items.Length)."
    ""
    $items | Sort-Object {
        $_.Directory.FullName
    }
}

<#GggGetInstalledFiles "python*"#>
function GggGetInstalledFiles($filter) {
    $programFiles = "C:\Program Files"
    $programFiles32 = "C:\Program Files (x86)"
    $items = Get-ChildItem $programFiles, $programFiles32 -Filter "$filter" -Recurse -ErrorAction Ignore
    $items | Sort-Object {
        $_.Directory.FullName
    }
}

<# get file into and print last N Lines #>
<#GggGetFileInfoAndPrint "E:\webmd\apps\community\logs\app\community_api.log" 10#>
function GggGetFileInfoAndPrint($logFilePath, $lastNLines) {           
    Get-Item $logFilePath
    Write-Output ""
    Get-Content $logFilePath -Tail $lastNLines
}

<#GggCreateFolder "C:\Github\Ggg\Ggg.TypeScript\.vscode"#>
<# creates folder #>
function GggCreateFolder($fullPath) {   
    New-Item $fullPath -type directory;
    GggLog "Folder '$fullPath' has been created."
    GggOpenFolder $fullPath
}

function GggOpenFolder ($fullPath) {
    explorer.exe $fullPath
}

<#gets the current running directory #>
function GggGetCurrentDirectory() {
    $currentDirectory = (Get-Item -Path ".\" -Verbose).FullName;
    return $currentDirectory;
}

<# #>
function GggParentDirectory($filePath) {
    $currentDirectory = (Get-Item -Path filePath).Parent;
    return $currentDirectory;
}

 
<# creates folder in current directory #>
function GggCreateFolderInCurrentDirectory($folderName) {   
    $currentDir = GggGetCurrentDirectory
    $folderToCreate = $currentDir + "/" + $folderName;
    New-Item $folderToCreate -type directory -Force
    GggLog "Folder '$folderToCreate' has been created."
}



<#GggCreateFile "C:\Github\Ggg\GameGoGo.ClassLibrary\.nuget" "Nuget.Config"#>
<# creates file #>
function GggCreateFile($folder, $fileName) {   
    $fullPath = $folder + "\" + $fileName;
    New-Item $fullPath -type File -Force;
}

<# clears the recyclebin #>
function GggClearRecycleBin {   
    Clear-RecycleBin -Force 
}
 