# Reset Valorant Script

This script is designed to reset Valorant's graphic settings, clean up related folders, and uninstall Riot Vanguard.

## Features
- Resets Valorant's graphic settings.
- Cleans up Valorant-related folders in `AppData`.
- Uninstalls Riot Vanguard by deleting its folder and terminating its processes.
- Sets DNS resolver to Cloudflare's DNS (`1.1.1.1` and `1.0.0.1`).

## Prerequisites
- **Windows OS**: This script is designed for Windows operating systems.
- **Administrator Privileges**: The script requires administrator privileges to delete files and folders, and to modify DNS settings.

## How to Use
1. **Download the Script**:
   - Download the `Reset Valorant.bat` file to your computer.

2. **Run the Script**:
   - Right-click on the `Reset Valorant.bat` file and select **Run as Administrator**.

3. **Follow the Prompts**:
   - The script will display a warning message and ask you to select the Valorant installation directory.
![image](https://github.com/user-attachments/assets/98faebca-0845-41ae-87a5-4baa19e67fff)

   - After selecting the directory, the script will proceed to clean up the necessary folders and reset settings.

4. **Repair Valorant**:
   - Once the script completes, you will need to start the Riot Client or Login to Valorant to repair Valorant files.

## What the Script Does
1. **Resets Graphic Settings**:
   - Deletes the contents of the `Win64` folder in the Valorant installation directory.
```batch
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
```
2. **Cleans Up AppData Folders**:
   - Deletes the following folders:
 - `%localappdata%\Riot Games\Riot Client`
```batch
:: Clean AppData\Riot Games\Riot Client folder
echo Deleting AppData\Riot Games\Riot Client...
rd /s /q "%localappdata%\Riot Games\Riot Client"
if %errorlevel%==0 (
    echo AppData\Riot Games\Riot Client folder cleaned successfully.
) else (
    echo Failed to clean AppData\Riot Games\Riot Client folder.
)
echo.
```
  - `%localappdata%\Riot Games\VALORANT`
```batch
:: Clean AppData\Local\Riot Games\VALORANT folder
echo Deleting AppData\Local\Riot Games\VALORANT...
rd /s /q "%localappdata%\Riot Games\VALORANT"
if %errorlevel%==0 (
    echo AppData\Local\Riot Games\VALORANT folder cleaned successfully.
) else (
    echo Failed to clean AppData\Local\Riot Games\VALORANT folder.
)
echo.
```

3. **Uninstalls Riot Vanguard**:
   - Terminates the `vgtray.exe` and `vgc.exe` processes.

```batch
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
```

   - Deletes the `C:\Program Files\Riot Vanguard` folder.

```batch
:: Delete Riot Vanguard folder
echo Deleting Riot Vanguard folder...
rd /s /q "C:\Program Files\Riot Vanguard"
if %errorlevel%==0 (
    echo Riot Vanguard folder deleted successfully.
) else (
    echo Failed to delete Riot Vanguard folder.
)
echo.
```


3. **Sets DNS Resolver**:
   - Configures the DNS resolver to `1.1.1.1` (primary) and `1.0.0.1` (secondary).
   - If you want to use Google DNS proceed to this Documention [Google Public DNS Documentation](https://developers.google.com/speed/public-dns/docs/using)
   
```batch
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
```

## Warning
- **This script will reset your Valorant graphic settings and uninstall Riot Vanguard.**
- **Make sure to back up any important data before running the script.**
- **A complete PC Restart is must after Installing Vanguard.**
