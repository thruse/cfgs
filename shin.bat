@echo off

call "%USERPROFILE%\.setdirs"
call "%CFGSDIR%\envin"
if exist "%DEVDIR%\cfgs\local.bat" (
    call "%DEVDIR%\cfgs\local"
)
cd /d "%DEVDIR%"

