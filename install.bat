@echo off
goto main

:announce
echo * * *
echo %*
echo * * *
exit /b 0

:main

call :announce Installing winget packages
set WINGETOPTS=--accept-source-agreements --accept-package-agreements --no-upgrade
call winget import %WINGETOPTS% --import-file "%CFGSDIR%\packages.json"
if not exist "%PROGRAMFILES%\emacs" (
    call winget install --source winget %WINGETOPTS% --exact --id GNU.Emacs --version 29.4
)
set WINGETOPTS=
call :announce Installed winget packages
echo.

call :announce Initialising Visual Studio
start "Visual Studio Initialisation" /wait "%CFGSDIR%\vsin.bat"
call :announce Initialised Visual Studio
echo.

call :announce All program installations complete
echo.

call :announce Setting up environment
call "%LOCALAPPDATA%\Programs\Python\Python312\python" -m venv "%DEVDIR%\.venv"
call "%CFGSDIR%\envin"
call :announce Environment initialised
echo.

call :announce Installing VS Code extensions
call code --install-extension ms-vscode.cpptools
call code --install-extension james-yu.latex-workshop
call code --install-extension ms-python.python
call code --install-extension ms-toolsai.jupyter
call code --install-extension reditorsupport.r
call :announce VS Code extensions installed
echo.

call :announce Installing R packages
call R -e "install.packages('languageserver')"
call :announce R packages installed
echo.

call :announce Installing Python packages
call pip install --requirement "%CFGSDIR%\requirements.txt"
call :announce Installed Python packages
echo.

exit

