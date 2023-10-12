@echo off
setlocal EnableDelayedExpansion

set user=%USERNAME%
set versions_dir=C:\Users\!user!\AppData\Local\Roblox\Versions

for /f "delims=" %%i in ('dir /b /a:d /od "!versions_dir!"') do set latest_version=%%i

set dir=!versions_dir!\!latest_version!\ClientSettings

mkdir "!dir!"
cd "!dir!"

curl -o "!dir!\ClientAppSettings.json" 

echo source - https://github.com/cincotres

echo.
color
echo Choose an option:

echo [1] Add ClientSettings to every version
echo [2] Remove ClientSettings from every version

echo.
set /p choice=Enter your choice (1/2): 

if "%choice%"=="1" (
    color 0A
    echo ClientSettings Added to every version.
) else if "%choice%"=="2" (
    color 0C
    echo Removing ClientSettings from every version.
    for /d %%d in ("!versions_dir!\*") do (
        rmdir /s /q "%%d\ClientSettings"
    )
)

pause

