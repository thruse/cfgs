@echo off
goto main

:announce
echo * * *
echo %~1
echo * * *
exit /b 0

:announce Installing winget packages
set WINGETOPTS=--accept-source-agreements --accept-package-agreements --no-upgrade
call winget import %WINGETOPTS% --import-file "%CFGSDIR%\packages.json"
if not exist "%PROGRAMFILES%\emacs" (
    call winget install --source winget %WINGETOPTS% --exact --id GNU.Emacs --version 29.4
)
:announce Installed winget packages
echo.

:announce Initialising Visual Studio
start "Visual Studio Initialisation" "%CFGSDIR%\vsin.bat"
:announce Initialised Visual Studio
echo.

:announce All program installations complete
echo.

:announce Setting up environment
call "%LOCALAPPDATA%\Programs\Python\Python312\python" -m venv "%DEVDIR%\.venv"
envin
:announce Environment initialised
echo.

:announce Installing VS Code extensions
call code --install-extension ms-vscode.cpptools
call code --install-extension james-yu.latex-workshop
call code --install-extension ms-python.python
call code --install-extension reditorsupport.r
:announce VS Code extensions installed
echo.

rem :announce Installing Python packages
rem pip install --requirement "%CFGSDIR%\requirements.txt"
rem :announce Installed Python packages
rem echo.
