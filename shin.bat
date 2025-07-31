@echo off

cd /d "%USERPROFILE%"

call "%USERPROFILE%\.setdirs"

set VSCMD_SKIP_SENDTELEMETRY=1
call "%PROGRAMFILES%\microsoft visual studio\2022\community\vc\auxiliary\build\vcvarsall" x64 > nul
set VSCMD_SKIP_SENDTELEMETRY=

setlocal

set MYBIN=%DEVDIR%\bin
set NVIM=%PROGRAMFILES%\neovim\bin
set VSCODE=%LOCALAPPDATA%\Programs\Microsoft VS Code\bin
set EMACS=%PROGRAMFILES%\emacs\emacs-29.4\bin
set GIT=%PROGRAMFILES%\git\cmd
set SEVENZIP=%PROGRAMFILES%\7-zip
set MIKTEX=%LOCALAPPDATA%\Programs\MiKTeX\miktex\bin\x64
set PYTHON=%LOCALAPPDATA%\Programs\Python\Python312;%LOCALAPPDATA%\Programs\Python\Python312\Scripts
set RPROJECT=%PROGRAMFILES%\r\r-4.4.2\bin

endlocal & set PATH=%MYBIN%;%NVIM%;%VSCODE%;%EMACS%;%GIT%;%SEVENZIP%;%MIKTEX%;%PYTHON%;%RPROJECT%;%PATH%

call "%DEVDIR%\.venv\scripts\activate"
set PROMPT=%_OLD_VIRTUAL_PROMPT%

if exist "%DEVDIR%\cfgs\local.bat" (
    call "%DEVDIR%\cfgs\local"
)

cd /d "%DEVDIR%"
