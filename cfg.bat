@echo off
goto main

:install

set WINGETOPTS=--accept-source-agreements --accept-package-agreements --no-upgrade --disable-interactivity

call winget import %WINGETOPTS% --import-file "%CFGSDIR%\packages.json" > nul

if not exist "%PROGRAMFILES%\emacs" (
    call winget install --source winget --silent %WINGETOPTS% --exact --id GNU.Emacs --version 29.4 > nul
)
set WINGETOPTS=

call "%LOCALAPPDATA%\Programs\Python\Python312\python" -m venv "%DEVDIR%\.venv"

start "Visual Studio Initialisation" "%CFGSDIR%\vsin.bat"

pushd "%DEVDIR%\tmp"

call "%CFGSDIR%\shin"

call code --install-extension ms-vscode.cpptools > nul
call code --install-extension james-yu.latex-workshop > nul
call code --install-extension ms-python.python > nul
call code --install-extension reditorsupport.r > nul

rem pip install --requirement "%CFGSDIR%\requirements.txt"

popd

exit /b 0

:main

set CFGSDIR=%~f0
for %%i in ("%CFGSDIR%") do set CFGSDIR=%%~dpi
set CFGSDIR=%CFGSDIR:~0,-1%

set MYDIR=%~f0\..\..
for %%i in ("%MYDIR%") do set MYDIR=%%~dpi
set MYDIR=%MYDIR:~0,-1%

set DEVDIR=%~f0\..
for %%i in ("%DEVDIR%") do set DEVDIR=%%~dpi
set DEVDIR=%DEVDIR:~0,-1%

set BINDIR=%DEVDIR%\bin

echo @echo off>"%USERPROFILE%\.setdirs.bat"
echo set MYDIR=%MYDIR%>>"%USERPROFILE%\.setdirs.bat"
echo set DEVDIR=%DEVDIR%>>"%USERPROFILE%\.setdirs.bat"
echo set CFGSDIR=%CFGSDIR%>>"%USERPROFILE%\.setdirs.bat"
echo set BINDIR=%BINDIR%>>"%USERPROFILE%\.setdirs.bat"

mkdir "%BINDIR%" > nul 2> nul
mkdir "%DEVDIR%\tmp" > nul 2> nul
mkdir "%DEVDIR%\archive" > nul 2> nul

mkdir "%MYDIR%\tmp" > nul 2> nul
mkdir "%MYDIR%\reading" > nul 2> nul
mkdir "%MYDIR%\reading\Calibre Library" > nul 2> nul

copy "%CFGSDIR%\vscin.bat" "%BINDIR%\vscin.bat" > nul
copy "%CFGSDIR%\venvin.bat" "%BINDIR%\venvin.bat" > nul
copy "%CFGSDIR%\juplab.bat" "%BINDIR%\juplab.bat" > nul

call powershell -noprofile -file "%CFGSDIR%\cmd_cfg.ps1"

mkdir "%LOCALAPPDATA%\nvim" > nul 2> nul
copy "%CFGSDIR%\init.vim" "%LOCALAPPDATA%\nvim\init.vim" > nul

mkdir "%APPDATA%\.emacs.d\backups" > nul 2> nul
mkdir "%APPDATA%\.emacs.d\autosaves" > nul 2> nul
type nul > "%APPDATA%\.emacs.d\custom.el"
copy "%CFGSDIR%\init.el" "%APPDATA%\.emacs.d\init.el" > nul

copy "%CFGSDIR%\.gitconfig" "%USERPROFILE%\.gitconfig" > nul

if "%~1" == "--install" (
    start "Installing" "%CFGSDIR%\install"
)

call "%CFGSDIR%\envin"

rem soon we will automate getting "%MYDIR%\g"
rmdir /s /q "%USERPROFILE%\music\my_music" > nul 2> nul
xcopy "%MYDIR%\g\music" "%USERPROFILE%\music\my_music" /e /i > nul

