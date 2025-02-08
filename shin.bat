rem @echo off

call "%userprofile%\.setdirs"
echo on

cd /d "%userprofile%"

call "%programfiles%\microsoft visual studio\2022\community\vc\auxiliary\build\vcvarsall" x64
rem call "%programfiles%\microsoft visual studio\2022\community\vc\auxiliary\build\vcvarsall" x64 > nul
echo on

cd /d "%devdir%"

setlocal

set my_bin=%devdir%\bin
set nvim=%programfiles%\neovim\bin
set vscode=%userprofile%\appdata\local\programs\microsoft vs code\bin
set emacs=%programfiles%\emacs\emacs-29.4\bin
set git=%programfiles%\git\cmd
set seven_zip=%programfiles%\7-zip
set miktex=%userprofile%\appdata\local\programs\miktex\miktex\bin\x64
set python=%userprofile%\appdata\local\programs\python\python312;%userprofile%\appdata\local\programs\python\python312\scripts
set r_project=%programfiles%\r\r-4.4.2\bin

endlocal & set path=%my_bin%;%nvim%;%vscode%;%emacs%;%git%;%seven_zip%;%miktex%;%python%;%r_project%;%path%

call "%devdir%\.venv\scripts\activate"
echo on
set prompt=%_old_virtual_prompt%

if exist "%devdir%\cfgs\local.bat" (
    call "%devdir%\cfgs\local"
)

