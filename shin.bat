@echo off

call "%USERPROFILE%\.setdirs"

call "%CFGSDIR%\envin"

if exist "%DEVDIR%\cfgs\local.bat" (
    call "%DEVDIR%\cfgs\local"
)

if not defined SHIN (
    cd /d "%DEVDIR%"
)

set SHIN=1

