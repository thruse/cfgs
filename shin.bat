@echo off

cd /d "%USERPROFILE%"

call "%USERPROFILE%\.setdirs"

set VSCMD_SKIP_SENDTELEMETRY=1
call "%PROGRAMFILES%\microsoft visual studio\2022\community\vc\auxiliary\build\vcvarsall" x64 > nul
set VSCMD_SKIP_SENDTELEMETRY=

setlocal

set MYBIN=%DEVDIR%\bin
set NVIM=%PROGRAMFILES%\neovim\bin
set VSCODE=%USERPROFILE%\appdata\local\programs\microsoft vs code\bin
set EMACS=%PROGRAMFILES%\emacs\emacs-29.4\bin
set GIT=%PROGRAMFILES%\git\cmd
set SEVENZIP=%PROGRAMFILES%\7-zip
set MIKTEX=%USERPROFILE%\appdata\local\programs\miktex\miktex\bin\x64
set python=%USERPROFILE%\appdata\local\programs\python\python312;%USERPROFILE%\appdata\local\programs\python\python312\scripts
set RPROJECT=%PROGRAMFILES%\r\r-4.4.2\bin

endlocal & set PATH=%MYBIN%;%NVIM%;%VSCODE%;%EMACS%;%GIT%;%SEVENZIP%;%MIKTEX%;%python%;%RPROJECT%;%PATH%

call "%DEVDIR%\.venv\scripts\activate"
set PROMPT=%_OLD_VIRTUAL_PROMPT%

if exist "%DEVDIR%\cfgs\local.bat" (
    call "%DEVDIR%\cfgs\local"
)

cd /d "%DEVDIR%"
