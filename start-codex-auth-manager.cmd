@echo off
setlocal

cd /d "%~dp0"
set "CODEX_MANAGER_START_HIDDEN=1"

powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "if (Get-Process -Name 'codex-manager' -ErrorAction SilentlyContinue) { exit 0 } else { exit 1 }"
if not errorlevel 1 (
  echo Codex Auth Manager is already running.
  exit /b 0
)

if not exist node_modules (
  echo Installing dependencies...
  call npm.cmd install
  if errorlevel 1 exit /b %errorlevel%
)

echo Starting Codex Auth Manager...
call npm.cmd run tauri:dev

endlocal
