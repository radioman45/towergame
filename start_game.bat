@echo off
setlocal

set "ROOT=%~dp0"
set "INDEX=%ROOT%index.html"

if not exist "%INDEX%" (
  echo index.html not found in %ROOT%
  pause
  exit /b 1
)

for /f "usebackq delims=" %%I in (`powershell -NoProfile -Command "[Uri]::new((Resolve-Path '%INDEX%')).AbsoluteUri"`) do set "GAME_URL=%%I"

set "CHROME=C:\Program Files\Google\Chrome\Application\chrome.exe"
set "EDGE_X86=C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
set "EDGE=C:\Program Files\Microsoft\Edge\Application\msedge.exe"

if exist "%CHROME%" (
  start "" "%CHROME%" --allow-file-access-from-files "%GAME_URL%"
  exit /b 0
)

if exist "%EDGE_X86%" (
  start "" "%EDGE_X86%" --allow-file-access-from-files "%GAME_URL%"
  exit /b 0
)

if exist "%EDGE%" (
  start "" "%EDGE%" --allow-file-access-from-files "%GAME_URL%"
  exit /b 0
)

start "" "%INDEX%"
exit /b 0
