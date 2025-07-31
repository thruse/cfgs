@echo off
goto main

:default_venv
call "%DEVDIR%\.venv\scripts\activate"
set PROMPT=%_OLD_VIRTUAL_PROMPT%
exit /b 0

:try_cd_venv
if exist .venv\scripts\activate.bat (
    call .venv\scripts\activate.bat
) else (
    call :default_venv
)
exit /b 0

:main
call deactivate
if "%~1" == "" (
    call :try_cd_venv
) else (
    call :default_venv
)

