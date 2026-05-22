@echo off
setlocal

cd /d "%~dp0"

if not exist node_modules (
  echo Installing dependencies...
  call npm.cmd install
  if errorlevel 1 exit /b %errorlevel%
)

echo Starting Codex Auth Manager...
call npm.cmd run tauri:dev

endlocal
