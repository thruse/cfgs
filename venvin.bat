@echo off
set arg1=%~1
goto main

:default_venv
call "%devdir%\.venv\scripts\activate"
set prompt=%_old_virtual_prompt%
exit /b 0

:try_cd_venv
if exist .venv\scripts\activate.bat (
    call .venv\scripts\activate.bat
) else (
    call :default_venv
)
exit /b 0

:path_venv
cd /d "%arg1%"
call "%arg1%\.venv\scripts\activate"
exit /b 0

:try_path_venv
if exist "%arg1%\.venv\scripts\activate.bat" (
    call :path_venv
) else (
    call :default_venv
)
exit /b 0

:try_venv
if "%arg1%" == "" (
    call :try_cd_venv
) else (
    call :try_path_venv
)
exit /b 0

:main

call deactivate

if "%arg1%" == "--" (
    call :default_venv
) else (
    call :try_venv
)

set arg1=

