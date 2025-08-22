@echo off

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

call powershell -noprofile -file "%CFGSDIR%\cmd_cfg.ps1"

mkdir "%LOCALAPPDATA%\nvim" > nul 2> nul
copy "%CFGSDIR%\init.vim" "%LOCALAPPDATA%\nvim\init.vim" > nul

mkdir "%APPDATA%\.emacs.d\backups" > nul 2> nul
mkdir "%APPDATA%\.emacs.d\autosaves" > nul 2> nul
type nul > "%APPDATA%\.emacs.d\custom.el"
copy "%CFGSDIR%\init.el" "%APPDATA%\.emacs.d\init.el" > nul

copy "%CFGSDIR%\.gitconfig" "%USERPROFILE%\.gitconfig" > nul
copy "%CFGSDIR%\.Rprofile" "%USERPROFILE%\.Rprofile" > nul

if "%~1" == "--install" (
    start "Installing" /wait "%CFGSDIR%\install"
)

call "%CFGSDIR%\envin"

rem soon we will automate getting "%MYDIR%\g"
rmdir /s /q "%USERPROFILE%\music\my_music" > nul 2> nul
xcopy "%MYDIR%\g\music" "%USERPROFILE%\music\my_music" /e /i > nul

