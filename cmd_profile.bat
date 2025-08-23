@echo off

call "%USERPROFILE%\setdirs"

call "%CFGSDIR%\envin"

if exist "%CFGSDIR%\local_profile.bat" (
    call "%CFGSDIR%\local_profile"
)

call "%CFGSDIR%\cmdrc"

