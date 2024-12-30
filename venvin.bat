@echo off

deactivate

if "%1" == "--" (goto default_venv)
if exist .venv\bin\activate.bat (goto cd_venv)
if exist "%1\bin\activate.bat" (goto arg_venv)

:default_venv
set VIRTUAL_ENV_DISABLE_PROMPT=1
call "%devdir%\.venv\bin\activate"
set VIRTUAL_ENV_DISABLE_PROMPT=
goto :eof

:cd_venv
call .venv\bin\activate
goto :eof

:arg_venv
call "%1\bin\activate"

