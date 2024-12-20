@echo off

echo this will create a .vscode folder in the current directory and create or overwrite settings.json with my version in my cfgs.

mkdir .vscode > nul 2> nul
pushd .vscode
move settings.json "%my_directory%\dev\tmp\settings_%random%.json" > nul 2> nul
copy "%my_directory%\dev\cfgs\vscode.json" settings.json
popd
