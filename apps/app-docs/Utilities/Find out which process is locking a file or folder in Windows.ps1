#Find out which process is locking a file or folder in Windows
#https://superuser.com/questions/117902/find-out-which-process-is-locking-a-file-or-folder-in-windows

$FileOrFolderPath = "D:\Git\Ggg\Ggg.Jobs\seatgeek\sectionnorm"
If ((Test-Path -Path $FileOrFolderPath) -eq $false) {
    Write-Warning "File or directory does not exist."       
}
Else {
    $LockingProcess = CMD /C "openfiles /query /fo table | find /I ""$FileOrFolderPath"""
    Write-Host $LockingProcess
}
