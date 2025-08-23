@echo off
goto main

:default_venv
call "%DEVDIR%\.venv\scripts\activate"
set PROMPT=%_OLD_VIRTUAL_PROMPT%
goto end

:try_cd_venv
if exist .venv\scripts\activate.bat (
    call .venv\scripts\activate.bat
) else (
    goto default_venv
)
goto end

:main
call deactivate
if "%~1" == "" (
    goto try_cd_venv
) else (
    goto default_venv
)

:end

