# https://stackoverflow.com/questions/3487265/powershell-script-to-return-versions-of-net-framework-on-a-machine
# Get the text from github
$url = "https://raw.githubusercontent.com/dotnet/docs/master/docs/framework/migration-guide/how-to-determine-which-versions-are-installed.md"
$md = Invoke-WebRequest $url -UseBasicParsing

# Replace the weird text in the tables, and the padding
# Then trim the | off the front and end of lines
$map = $md -split "`n" -replace " installed [^|]+" -replace "\s+\|" -replace "\|$" |

# Then select all the lines that start with ".NET Framework"
# and make sure we don't have duplicates
Select-String "^.NET" | Select -Unique 

# Then remove the .NET Framework
$map = $map -replace ".NET Framework " -join "`n"

# And just output the script
 
$Lookup = ConvertFrom-Csv 'Version|Release $map' -Delimiter "|"

Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP' -recurse |
    Get-ItemProperty -name Version, Release -EA 0 |
    Where { $_.PSChildName -match '^(?!S)\p{L}'} |
    Select PSChildName, Version, Release, @{
    name       = "Product"
    expression = {
        $Lookup | ? Release -eq $_.Release | % Version
    }
}

