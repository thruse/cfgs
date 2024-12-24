@echo off
setlocal

for /f "usebackq" %%i in (`powershell -noprofile -command "(get-item '%~f0').target"`) do set symlink_target=%%i
if defined symlink_target goto symlink else goto file

:symlink
for %%i in ("%symlink_target%") do set current_directory=%%~dpi

goto after_get_true_path

:file
set current_directory=%~dp0

:after_get_true_path

set current_directory=%current_directory:~0,-1%\..\..
for %%i in ("%current_directory%") do set current_directory=%%~fi

set mydir=%current_directory%

echo @echo off>%userprofile%\set_mydir.bat
echo set mydir=%mydir%>>%userprofile%\set_mydir.bat
attrib +h %userprofile%\set_mydir.bat

mkdir "%mydir%\dev\bin"
mkdir "%mydir%\dev\tmp"
mkdir "%mydir%\dev\archive"

mkdir "%mydir%\tmp"
mkdir "%mydir%\games"
mkdir "%mydir%\vids"
mkdir "%mydir%\misc_programs"
mkdir "%mydir%\misc"

set get=winget install --source winget --silent --no-upgrade --exact --id

%get% Microsoft.VisualStudio.2022.Community --custom ^
"--add Microsoft.VisualStudio.Component.VC.CoreIde ^
--add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 ^
--add Microsoft.VisualStudio.Component.VC.Redist.14.Latest ^
--add Microsoft.VisualStudio.Component.Windows10SDK"

%get% Neovim.Neovim

%get% Microsoft.VisualStudioCode

if not exist c:\program files\emacs goto install_emacs else goto emacs_installed

:install_emacs
%get% GNU.Emacs

goto after_emacs_install

:emacs_installed
echo emacs already installed

:after_emacs_install

%get% 7zip.7zip

%get% MiKTeX.MiKTeX

%get% RProject.R

%get% Google.Chrome

%get% Valve.Steam

%get% Spotify.Spotify

reg import "%mydir%\dev\cfgs\w32_cfg.reg"

powershell -noprofile -file "%mydir%\dev\cfgs\cmd_cfg.ps1"

mkdir "%userprofile%\appdata\local\nvim"
move "%userprofile%\appdata\local\nvim\init.vim" "%mydir%\dev\tmp\nvim_%random%.vim" > nul 2> nul
copy "%mydir%\dev\cfgs\nvim.vim" "%userprofile%\appdata\local\nvim\init.vim" 

move "%mydir%\dev\bin\vscin.bat" "%mydir%\dev\tmp\vscin_%random%.bat" > nul 2> nul
copy "%mydir%\dev\cfgs\vscin.bat" "%mydir%\dev\bin\vscin.bat" 

mkdir "%userprofile%\appdata\roaming\.emacs.d\baks"
mkdir "%userprofile%\appdata\roaming\.emacs.d\autosaves"
type nul > "%userprofile%\appdata\roaming\.emacs.d\custom.el"
move "%userprofile%\appdata\roaming\.emacs.d\init.el" "%mydir%\dev\tmp\emacs_%random%.el" > nul 2> nul
copy "%mydir%\dev\cfgs\emacs.el" "%userprofile%\appdata\roaming\.emacs.d\init.el" 

move "%userprofile%\.gitconfig" "%mydir%\dev\tmp\git_%random%.gitconfig" > nul 2> nul
copy "%mydir%\dev\cfgs\git.gitconfig" "%userprofile%\.gitconfig" 

