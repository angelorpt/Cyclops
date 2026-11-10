@echo off
setlocal enabledelayedexpansion

echo =========================================================
echo  Cyclops AutoHotkey v2 Build Script (Ahk2Exe)
echo =========================================================

set SCRIPT_DIR=%~dp0
set SRC_FILE=%SCRIPT_DIR%src\Cyclops.ahk
set ICON_FILE=%SCRIPT_DIR%img\cyclops.ico
set DIST_DIR=%SCRIPT_DIR%dist
set OUT_EXE=%DIST_DIR%\Cyclops.exe

if not exist "%DIST_DIR%" (
    mkdir "%DIST_DIR%"
)

set AHK2EXE=
if exist "%ProgramFiles%\AutoHotkey\Compiler\Ahk2Exe.exe" (
    set "AHK2EXE=%ProgramFiles%\AutoHotkey\Compiler\Ahk2Exe.exe"
) else if exist "%LOCALAPPDATA%\Programs\AutoHotkey\Compiler\Ahk2Exe.exe" (
    set "AHK2EXE=%LOCALAPPDATA%\Programs\AutoHotkey\Compiler\Ahk2Exe.exe"
) else (
    where Ahk2Exe.exe >nul 2>&1
    if !errorlevel! equ 0 (
        for /f "delims=" %%i in ('where Ahk2Exe.exe') do set "AHK2EXE=%%i"
    )
)

if "%AHK2EXE%"=="" (
    echo [ERROR] Ahk2Exe.exe not found!
    echo Please install AutoHotkey v2 with the Compiler feature enabled.
    echo Download: https://www.autohotkey.com/v2/
    exit /b 1
)

echo Found Compiler: "%AHK2EXE%"
echo Source:         "%SRC_FILE%"
echo Output:         "%OUT_EXE%"
echo Icon:           "%ICON_FILE%"
echo.
echo Compiling...

"%AHK2EXE%" /in "%SRC_FILE%" /out "%OUT_EXE%" /icon "%ICON_FILE%"

if %errorlevel% equ 0 (
    echo.
    echo [SUCCESS] Build completed successfully: "%OUT_EXE%"
) else (
    echo.
    echo [ERROR] Compilation failed with exit code %errorlevel%.
    exit /b %errorlevel%
)

endlocal
