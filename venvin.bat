@echo off

deactivate

if "%1" == "--" (goto default_venv)
if exist .venv\scripts\activate.bat (goto cd_venv)
if exist "%1\scripts\activate.bat" (goto arg_venv)

:default_venv
set VIRTUAL_ENV_DISABLE_PROMPT=1
call "%devdir%\.venv\scripts\activate"
set VIRTUAL_ENV_DISABLE_PROMPT=
goto :eof

:cd_venv
call .venv\scripts\activate
goto :eof

:arg_venv
call "%1\scripts\activate"

