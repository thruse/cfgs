@echo off

call %userprofile%\set_mydir

cd "%mydir%\dev"

call "c:\program files\microsoft visual studio\2022\community\vc\auxiliary\build\vcvarsall" x64 > nul

setlocal

set cmd=c:\windows\system32

set powershell=c:\windows\system32\windowspowershell\v1.0

set winget=%userprofile%\appdata\local\microsoft\windowsapps

set nvim=c:\program files\neovim\bin

set vscode=%userprofile%\appdata\local\programs\microsoft vs code\bin

setlocal enabledelayedexpansion
set emacs_dirs=
for /f "tokens=*" %%i in ('dir /ad /b "c:\program files\emacs\emacs-*"') do set emacs_dirs=c:\program files\emacs\%%i\bin;!emacs_dirs!
endlocal & set emacs=%emacs_dirs%
set emacs=c:\program files\emacs\bin;%emacs:~0,-1%

set git=c:\program files\git\cmd

set seven_zip=c:\program files\7-zip

set miktex=%userprofile%\appdata\local\programs\miktex\miktex\bin\x64

setlocal enabledelayedexpansion
set r_dirs=
for /f "tokens=*" %%i in ('dir /ad /b "c:\program files\r\r-*"') do set r_dirs=c:\program files\r\%%i\bin;!r_dirs!
endlocal & set r_project=%r_dirs%
set r_project=c:\program files\r\bin;%r_project:~0,-1%

endlocal & set path=%cmd%;%powershell%;%winget%;%nvim%;%vscode%;%emacs%;%git%;%seven_zip%;%miktex%;%r_project%;%path%

call %mydir%\dev\py_venv\scripts\activate

setlocal

set my_bin=%mydir%\dev\bin

endlocal & set path=%my_bin%;%path%
