@echo off
goto main

:init
cd /d "%DEVDIR%"
set SHIN=1
exit /b 0

:main
if not defined SHIN (
    call :init
)

