@echo off

if not exist "%mydir%\tmp\drive_downloads" (
    mkdir "%mydir%\tmp\drive_downloads"
)

pushd "%mydir%\tmp\drive_downloads"
del /q * > nul 2> nul
move "%userprofile%\downloads\g-*" .
rmdir /q /s "%mydir%\g" > nul 2> nul
call 7z x "*.zip" -o"%mydir%"
popd

