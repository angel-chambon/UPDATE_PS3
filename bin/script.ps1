$DiskLetter = Read-Host "Enter the letter of usb disk to format"
Write-Host "Formatting the Flash Disk: "+$DiskLetter+" using powershell"
Format-Volume -DriveLetter $DiskLetter -FileSystem FAT32 -NewFileSystemLabel "PS3UPDATE"