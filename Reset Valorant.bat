@echo off
:: Display warning message
echo This cleaning process will reset your graphic settings in Valorant and uninstall Riot Vanguard.
pause
echo.

:: Use PowerShell to open a folder selection dialog
echo Please select the Valorant installation directory...
for /f "delims=" %%i in ('powershell -command "& {Add-Type -AssemblyName System.Windows.Forms; $folder = New-Object System.Windows.Forms.FolderBrowserDialog; $folder.Description = 'Select the Valorant installation directory'; if ($folder.ShowDialog() -eq 'OK') { $folder.SelectedPath } }"') do set "valorantPath=%%i"
echo.

:: Check if the user selected a directory
if not defined valorantPath (
    echo No directory selected. Exiting...
    pause
    exit /b
)

:: Construct the full path to VALORANT-Win64-Shipping.exe
set "valorantExe=%valorantPath%\live\ShooterGame\Binaries\Win64\VALORANT-Win64-Shipping.exe"

:: Validate the user-provided path
if not exist "%valorantExe%" (
    echo Invalid Valorant directory provided. Exiting...
    pause
    exit /b
)

:: Delete the contents of the Win64 folder
echo Deleting contents of %win64Path%...
set "win64Path=%valorantPath%\live\ShooterGame\Binaries\Win64"
rd /s /q "%win64Path%"
if %errorlevel%==0 (
    echo Win64 folder contents deleted successfully.
) else (
    echo Failed to delete Win64 folder contents.
)
echo.

:: Clean AppData\Riot Games\Riot Client folder
echo Deleting AppData\Riot Games\Riot Client...
rd /s /q "%localappdata%\Riot Games\Riot Client"
if %errorlevel%==0 (
    echo AppData\Riot Games\Riot Client folder cleaned successfully.
) else (
    echo Failed to clean AppData\Riot Games\Riot Client folder.
)
echo.

:: Clean AppData\Local\Riot Games\VALORANT folder
echo Deleting AppData\Local\Riot Games\VALORANT...
rd /s /q "%localappdata%\Riot Games\VALORANT"
if %errorlevel%==0 (
    echo AppData\Local\Riot Games\VALORANT folder cleaned successfully.
) else (
    echo Failed to clean AppData\Local\Riot Games\VALORANT folder.
)
echo.

:: End vgtray.exe and vgc.exe processes
echo Ending vgtray.exe and vgc.exe processes...
taskkill /f /im vgtray.exe
taskkill /f /im vgc.exe
if %errorlevel%==0 (
    echo vgtray.exe and vgc.exe processes ended successfully.
) else (
    echo Failed to end vgtray.exe and vgc.exe processes.
)
echo.

:: Delete Riot Vanguard folder
echo Deleting Riot Vanguard folder...
rd /s /q "C:\Program Files\Riot Vanguard"
if %errorlevel%==0 (
    echo Riot Vanguard folder deleted successfully.
) else (
    echo Failed to delete Riot Vanguard folder.
)
echo.

:: Set DNS resolver to 1.1.1.1 and 1.0.0.1
echo Setting DNS resolver to 1.1.1.1 and 1.0.0.1...
netsh interface ipv4 set dns name="Ethernet" static 1.1.1.1 primary
netsh interface ipv4 add dns name="Ethernet" 1.0.0.1 index=2
if %errorlevel%==0 (
    echo DNS resolver set successfully.
) else (
    echo Failed to set DNS resolver.
)
echo.

:: Display completion message
echo Process completed successfully.
echo Please start the Riot Client to repair Valorant files.
pause