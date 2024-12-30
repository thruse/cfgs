@echo off

echo this will create a .vscode folder in the current directory and create or overwrite settings.json with my version in my cfgs.

mkdir .vscode > nul 2> nul
pushd .vscode
call srm settings.json > nul 2> nul
copy "%devdir%\cfgs\vscode.json" settings.json
popd
