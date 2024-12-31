@echo off
setlocal

mkdir .vscode > nul 2> nul
pushd .vscode
call srm settings.json > nul 2> nul
copy "%devdir%\cfgs\settings.json" settings.json
popd
