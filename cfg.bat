@echo off
setlocal

for /f "usebackq" %%i in (`powershell -noprofile -command "(get-item '%~f0').target"`) do set symlink_target=%%i
if defined symlink_target (goto symlink) else (goto file)

:symlink
for %%i in ("%symlink_target%") do set current_directory=%%~dpi

goto after_get_true_path

:file
set current_directory=%~dp0

:after_get_true_path

set mydir=%current_directory:~0,-1%\..\..
for %%i in ("%mydir%") do set mydir=%%~fi

set devdir=%current_directory:~0,-1%\..
for %%i in ("%devdir%") do set devdir=%%~fi

echo @echo off>"%userprofile%\.setdirs.bat"
echo set mydir=%mydir%>>"%userprofile%\.setdirs.bat"
echo set devdir=%devdir%>>"%userprofile%\.setdirs.bat"

mkdir "%devdir%\bin"
mkdir "%devdir%\tmp"
mkdir "%devdir%\archive"

mkdir "%mydir%\tmp"
mkdir "%mydir%\games"
mkdir "%mydir%\vids"
mkdir "%mydir%\misc_programs"
mkdir "%mydir%\misc"
mkdir "%mydir%\scrap"

winget import --no-upgrade --import-file 

set get=winget install --source winget --silent --no-upgrade --exact --moniker

%get% vs2022-community
rem "--add Microsoft.VisualStudio.Component.VC.CoreIde ^
rem --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 ^
rem --add Microsoft.VisualStudio.Component.VC.Redist.14.Latest ^
rem --add Microsoft.VisualStudio.Component.Windows10SDK"

if not exist "c:\program files\emacs" (goto install_emacs) else (goto emacs_installed)
:install_emacs
%get% emacs
goto after_emacs_install
:emacs_installed
echo emacs already installed
:after_emacs_install

winget install --source winget --silent --no-upgrade --exact --id Valve.Steam
winget install --source winget --silent --no-upgrade --exact --id Spotify.Spotify

%get% nvim
%get% vscode
%get% 7zip
%get% miktex
%get% python
%get% r

%get% chrome

reg import "%devdir%\cfgs\w32_cfg.reg"

python3 -m venv "%devdir%\.venv"

call "%devdir%\cfgs\shin"

move "%devdir%\bin\srm.bat" "%devdir%\tmp\srm.bat_%random%" > nul 2> nul
copy "%devdir%\cfgs\srm.bat" "%devdir%\bin\srm.bat" 

call srm "%devdir%\bin\vscin.bat" > nul 2> nul
copy "%devdir%\cfgs\vscin.bat" "%devdir%\bin\vscin.bat" 

call srm "%devdir%\bin\venvin.bat" > nul 2> nul
copy "%devdir%\cfgs\venvin.bat" "%devdir%\bin\venvin.bat" 

powershell -noprofile -file "%devdir%\cfgs\cmd_cfg.ps1"

mkdir "%userprofile%\appdata\local\nvim"
call srm "%userprofile%\appdata\local\nvim\init.vim" > nul 2> nul
copy "%devdir%\cfgs\nvim.vim" "%userprofile%\appdata\local\nvim\init.vim" 

mkdir "%userprofile%\appdata\roaming\.emacs.d\baks"
mkdir "%userprofile%\appdata\roaming\.emacs.d\autosaves"
type nul > "%userprofile%\appdata\roaming\.emacs.d\custom.el"
call srm "%userprofile%\appdata\roaming\.emacs.d\init.el" > nul 2> nul
copy "%devdir%\cfgs\emacs.el" "%userprofile%\appdata\roaming\.emacs.d\init.el" 

call srm "%userprofile%\.gitconfig" > nul 2> nul
copy "%devdir%\cfgs\git.gitconfig" "%userprofile%\.gitconfig" 

