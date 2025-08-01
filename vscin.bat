@echo off

mkdir .vscode > nul 2> nul
pushd .vscode
if exist settings.json (
    echo error: .vscode already exists>&2
) else (
    copy "%CFGSDIR%\settings.json" settings.json > nul
)
popd

