DOS
:: ==============================================================================
:: Batch Script: Backup.bat
:: Description:  Automates daily file backups, dynamically generates a date-stamped
::               folder (DDMMMYY format), copies source files, and sets read-only flags.
:: Author:       JOR / Student
:: Date:         25-OCT-2026
:: ==============================================================================

@echo off
setlocal enabledelayedexpansion
cls

:: Title & Header
title Automated Daily Backup System
echo ******************************************************************************
echo                 AUTOMATED DAILY BACKUP ENGINE
echo ******************************************************************************
echo.

:: 1. Define Source and Target Directories
set "SOURCEDIR=C:\DOS\Data"
set "BACKUPROOT=C:\Users\cassi\Documents\GitHub\IAC\DOS\Backup"

:: 2. Extract Date Components in DDMMMYY format via PowerShell (locale-independent)
for /f "usebackq tokens=*" %%i in (`powershell -Command "Get-Date -Format 'ddMMMyy'"`) do set "DATESTAMP=%%i"
set "TARGETDIR=%BACKUPROOT%\%DATESTAMP%"

echo [INFO] Source Folder:  %SOURCEDIR%
echo [INFO] Backup Folder:  %TARGETDIR%
echo.

:: 3. Validate Source Directory Exists
if not exist "%SOURCEDIR%" (
    echo [ERROR] Source directory "%SOURCEDIR%" does not exist! Aborting backup.
    goto :END
)

:: 4. Create Target Date-Stamped Backup Folder
if not exist "%TARGETDIR%" (
    echo [INFO] Creating directory: "%TARGETDIR%"...
    mkdir "%TARGETDIR%" 2>nul
    if %ERRORLEVEL% NEQ 0 (
        echo [ERROR] Failed to create backup directory. Exiting.
        goto :END
    )
    echo [SUCCESS] Directory created successfully.
) else (
    echo [INFO] Backup folder for today already exists. Proceeding with sync...
)

echo.
echo [INFO] Starting file transfer...
echo ------------------------------------------------------------------------------

:: 5. Copy Files from Source to Backup Folder
xcopy "%SOURCEDIR%\*.*" "%TARGETDIR%\" /Y /I /Q >nul 2>&1

if %ERRORLEVEL% EQU 0 (
    echo [SUCCESS] Files successfully copied to: %TARGETDIR%
) else (
    echo [ERROR] An error occurred during file copying. Error code: %ERRORLEVEL%
    goto :END
)

echo.
echo [INFO] Setting READ-ONLY flag on backed up files...
echo ------------------------------------------------------------------------------

:: 6. Set Read-Only (+R) Attribute on Backed Up Files
attrib +R "%TARGETDIR%\*.*" /S /D

if %ERRORLEVEL% EQU 0 (
    echo [SUCCESS] Read-Only attribute (+R) applied to all backed-up files.
) else (
    echo [WARNING] Failed to set Read-Only attribute on some files.
)

echo.
echo ******************************************************************************
echo                           BACKUP COMPLETED SUCCESSFULLY
echo ******************************************************************************

:END
endlocal
echo.
pause