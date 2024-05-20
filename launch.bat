@echo off
color a
cls

echo DOWNLOADING UPDATE FILE
echo.
curl -O http://deu01.ps3.update.playstation.net/update/ps3/image/eu/2024_0227_3694eb3fb8d9915c112e6ab41a60c69f/PS3UPDAT.PUP
mkdir PS3\UPDATE
copy PS3UPDAT.PUP PS3\UPDATE
del PS3UPDAT.PUP
echo.
echo.

echo STARTING ELEVATE SCRIPT
powershell -File elevate.ps1

rmdir /s /q PS3

echo.
echo.
echo FINISH
echo.
pause