@echo off
setlocal

for /f "usebackq" %%i in (`powershell -noprofile -command "(get-item '%~f0').target"`) do set symlink_target=%%i
if defined symlink_target goto symlink else goto file

:file
set current_directory=%~dp0

goto after_get_true_path

:symlink
for %%i in ("%symlink_target%") do set current_directory=%%~dpi

:after_get_true_path

set current_directory=%current_directory:~0,-1%\..\..
for %%i in ("%current_directory%") do set current_directory=%%~fi

endlocal & set mydir=%current_directory%
setlocal

if [%*] == [] goto installs else goto error_unrecognised_args

:installs

set get=winget install --source winget --silent --no-upgrade --exact --id

echo visual studio install
%get% Microsoft.VisualStudio.2022.Community --custom ^
"--add Microsoft.VisualStudio.Component.VC.CoreIde ^
--add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 ^
--add Microsoft.VisualStudio.Component.VC.Redist.14.Latest ^
--add Microsoft.VisualStudio.Component.Windows10SDK"

echo neovim install
%get% Neovim.Neovim

echo visual studio code install
%get% Microsoft.VisualStudioCode

echo emacs install
if not exist c:\program files\emacs goto install_emacs else goto emacs_installed

:install_emacs
%get% GNU.Emacs

goto after_emacs_install

:emacs_installed
echo emacs already installed

:after_emacs_install

echo git install
%get% Git.Git

echo 7zip install
%get% 7zip.7zip

echo miktex install
%get% MiKTeX.MiKTeX

echo r install
%get% RProject.R

echo make dev directories
mkdir "%mydir%\dev\bin"
mkdir "%mydir%\dev\tmp"
mkdir "%mydir%\dev\archive"

echo emacs cfg
mkdir "%userprofile%\appdata\roaming\.emacs.d\baks"
mkdir "%userprofile%\appdata\roaming\.emacs.d\autosaves"
type nul > "%userprofile%\appdata\roaming\.emacs.d\custom.el"
move "%userprofile%\appdata\roaming\.emacs.d\init.el" "%mydir%\dev\tmp\emacs_%random%.el" > nul 2> nul
copy "%mydir%\dev\cfgs\emacs.el" "%userprofile%\appdata\roaming\.emacs.d\init.el" 

echo git cfg
move "%userprofile%\.gitconfig" "%mydir%\dev\tmp\git_%random%.gitconfig" > nul 2> nul
copy "%mydir%\dev\cfgs\git.gitconfig" "%userprofile%\.gitconfig" 

echo nvim cfg
mkdir "%userprofile%\appdata\local\nvim"
move "%userprofile%\appdata\local\nvim\init.vim" "%mydir%\dev\tmp\nvim_%random%.vim" > nul 2> nul
copy "%mydir%\dev\cfgs\nvim.vim" "%userprofile%\appdata\local\nvim\init.vim" 

echo my bin cfg
copy "%mydir%\dev\cfgs\vscinit.bat" "%mydir%\dev\bin\vscinit.bat" 

echo cmd cfg
powershell -noprofile -file "%mydir%\dev\cfgs\cmd_cfg.ps1"

echo windows settings cfg
reg import "%mydir%\dev\cfgs\w32_cfg.reg"

echo shin
call "%mydir%\dev\cfgs\shin"

echo chrome install
%get% Google.Chrome

echo steam install
%get% Valve.Steam

echo make usual directories
mkdir "%mydir%\tmp"
mkdir "%mydir%\games"
mkdir "%mydir%\vids"
mkdir "%mydir%\misc_programs"
mkdir "%mydir%\misc"

goto :eof

:error_unrecognised_args
echo error: unrecognised arguments

