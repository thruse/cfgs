@echo off
goto main

:default_venv
call "%devdir%\.venv\scripts\activate"
set prompt=%_old_virtual_prompt%
goto end

:try_cd_venv
if exist .venv\scripts\activate.bat (
    call .venv\scripts\activate.bat
) else (
    goto default_venv
)
goto end

:path_venv
cd "%arg1%"
call "%arg1%\.venv\scripts\activate"
goto end

:try_path_venv
if exist "%arg1%\.venv\scripts\activate.bat" (
    call path_venv
) else (
    goto default_venv
)
goto end

:main

call deactivate

if "%arg1%" == "--" (
    goto default_venv
) else (
    if "%arg1%" == "" (
        goto try_cd_venv
    ) else (
        goto try_path_venv
    )
)

:end

