Write-Host "Creating program folder into appdata"
New-Item -Path $env:APPDATA -Name "ps3update_00000000" -ItemType Directory

Write-Host "Installing binaries into appdata"
Copy-item -Force -Recurse -Verbose "bin\" -Destination $env:APPDATA"\ps3update_00000000"

Write-Host "Starting the usb configurator"
Start-Process -FilePath $env:APPDATA"\ps3update_00000000\bin\script.bat" -Wait -Verb RunAs -WorkingDirectory $env:APPDATA"\ps3update_00000000\bin"

Write-Host "Configuring files and folders of the usb key, please dont remove it! "
$scriptDrive = Get-Volume -FileSystemLabel "PS3UPDATE"
$drive = $scriptDrive.DriveLetter
$DestinationPath = $drive+":"
Write-Host "Destination path: "+$DestinationPath
Copy-item -Force -Recurse -Verbose "PS3\" -Destination $DestinationPath

Write-Host "Nettoyage..."
Remove-Item $env:APPDATA"\ps3update_00000000" -Recurse -Include *.*
Get-ChildItem -Recurse $env:APPDATA"\ps3update_00000000" | where { $_.PSISContainer -and @( $_ | Get-ChildItem ).Count -eq 0 } | Remove-Item
Remove-Item $env:APPDATA"\ps3update_00000000"