<#
.SYNOPSIS
    Compiles Cyclops AutoHotkey v2 into a standalone executable using Ahk2Exe.
.DESCRIPTION
    Searches for Ahk2Exe in standard install paths or PATH, sets up destination directory,
    and invokes compilation with the application icon.
#>

[CmdletBinding()]
param(
    [string]$CompilerPath = "",
    [string]$OutputDir = "$PSScriptRoot\dist",
    [string]$OutputName = "Cyclops.exe"
)

$ErrorActionPreference = "Stop"

Write-Host "=========================================================" -ForegroundColor Cyan
Write-Host " Cyclops AutoHotkey v2 PowerShell Build Script           " -ForegroundColor Cyan
Write-Host "=========================================================" -ForegroundColor Cyan

$srcFile = Join-Path $PSScriptRoot "src\Cyclops.ahk"
$iconFile = Join-Path $PSScriptRoot "img\cyclops.ico"
$outputExe = Join-Path $OutputDir $OutputName

if (-not (Test-Path $srcFile)) {
    Write-Error "Source file not found at: $srcFile"
}

if (-not (Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir -Force | Out-Null
}

if (-not $CompilerPath) {
    $searchPaths = @(
        "$env:ProgramFiles\AutoHotkey\Compiler\Ahk2Exe.exe",
        "$env:LOCALAPPDATA\Programs\AutoHotkey\Compiler\Ahk2Exe.exe"
    )
    foreach ($p in $searchPaths) {
        if (Test-Path $p) {
            $CompilerPath = $p
            break
        }
    }

    if (-not $CompilerPath) {
        $cmd = Get-Command "Ahk2Exe.exe" -ErrorAction SilentlyContinue
        if ($cmd) {
            $CompilerPath = $cmd.Source
        }
    }
}

if (-not $CompilerPath -or -not (Test-Path $CompilerPath)) {
    Write-Error @"
[ERROR] Ahk2Exe.exe not found!
Please install AutoHotkey v2 with the Compiler feature enabled.
Download: https://www.autohotkey.com/v2/
"@
}

Write-Host "Compiler: $CompilerPath" -ForegroundColor Gray
Write-Host "Source:   $srcFile" -ForegroundColor Gray
Write-Host "Output:   $outputExe" -ForegroundColor Gray
Write-Host "Icon:     $iconFile" -ForegroundColor Gray
Write-Host "`nCompiling..." -ForegroundColor Yellow

$process = Start-Process -FilePath $CompilerPath `
    -ArgumentList "/in", "`"$srcFile`"", "/out", "`"$outputExe`"", "/icon", "`"$iconFile`"" `
    -NoNewWindow -Wait -PassThru

if ($process.ExitCode -eq 0) {
    Write-Host "`n[SUCCESS] Build completed successfully: $outputExe" -ForegroundColor Green
} else {
    Write-Error "Compilation failed with exit code $($process.ExitCode)"
}
