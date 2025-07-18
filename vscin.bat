@echo off
setlocal
goto main

:initialise

mkdir .vscode > nul 2> nul
pushd .vscode
call srm settings.json > nul 2> nul
copy "%devdir%\cfgs\settings.json" settings.json
popd

exit /b 0

:main

if exist .vscode (
    echo error: .vscode already exists
) else (
    call :initialise
)

