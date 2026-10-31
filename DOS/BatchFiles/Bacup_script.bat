@echo off
:: ========================================================
:: Script Name: Bacup.bat
:: Description: Backs up files from the local IAC repository 
::              Data folder to a dated backup folder, then 
::              sets the read-only flag on the copied files.
:: ========================================================

echo ******************************************************************************
echo                 AUTOMATED DAILY BACKUP ENGINE
echo ******************************************************************************

:: Define two variable for the path source and destination 
set SRC=C:\Users\cassi\Documents\GitHub\IAC\DOS\Data
set DEST_BASE=C:\Users\cassi\Documents\GitHub\IAC\DOS\Backups

:: Check if source directory exists
if not exist "%SRC%" (
    echo [ERROR] Source directory "%SRC%" does not exist. Aborting backup.
    goto :eof
)

:: Create dated folder (Format: DDMMMYY, e.g., 30OCT26)
set TARGET=%DEST_BASE%\%DATE:~0,2%%DATE:~3,3%%DATE:~8,2%

echo [INFO] Source Folder:  %SRC%
echo [INFO] Backup Folder:  %TARGET%

:: Create the target backup directory if it doesn't exist
if not exist "%TARGET%" mkdir "%TARGET%"

:: Copy all files from Data folder to the new dated folder
copy "%SRC%\*.*" "%TARGET%\"

:: Set the read-only attribute on all files in the backup destination
attrib +r "%TARGET%\*.*"

echo [SUCCESS] Backup completed successfully!



