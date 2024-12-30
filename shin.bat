@echo off

call "%userprofile%\.setdirs"

cd "%devdir%"

call "%programfiles%\microsoft visual studio\2022\community\vc\auxiliary\build\vcvarsall" x64 > nul

setlocal

setlocal enabledelayedexpansion
set emacs_dirs=
for /f "tokens=*" %%i in ('dir /ad /b "%programfiles%\emacs\emacs-*"') do set emacs_dirs=%programfiles%\emacs\%%i\bin;!emacs_dirs!
endlocal & set emacs=%emacs_dirs%
set emacs=%programfiles%\emacs\bin;%emacs:~0,-1%

setlocal enabledelayedexpansion
set r_dirs=
for /f "tokens=*" %%i in ('dir /ad /b "%programfiles%\r\r-*"') do set r_dirs=%programfiles%\r\%%i\bin;!r_dirs!
endlocal & set r_project=%r_dirs%
set r_project=%programfiles%\r\bin;%r_project:~0,-1%

set my_bin=%devdir%\bin
set nvim=%programfiles%\neovim\bin
set vscode=%userprofile%\appdata\local\programs\microsoft vs code\bin
set git=%programfiles%\git\cmd
set seven_zip=%programfiles%\7-zip
set miktex=%userprofile%\appdata\local\programs\miktex\miktex\bin\x64

endlocal & set path=%my_bin%;%nvim%;%vscode%;%emacs%;%git%;%seven_zip%;%miktex%;%r_project%;%path%

call "%devdir%\.venv\scripts\activate"

