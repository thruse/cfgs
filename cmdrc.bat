@echo off
goto main

:init
cd /d "%DEVDIR%"
set SHIN=1
goto end

:main
if not defined SHIN (
    goto init
)

:end

