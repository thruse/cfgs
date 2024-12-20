rem @echo off
setlocal

set get=winget install --source winget --silent --no-upgrade --exact --id

echo visual studio
%get% Microsoft.VisualStudio.2022.Community --custom ^
"--add Microsoft.VisualStudio.Component.VC.CoreIde ^
--add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 ^
--add Microsoft.VisualStudio.Component.VC.Redist.14.Latest ^
--add Microsoft.VisualStudio.Component.Windows10SDK"

echo neovim
%get% Neovim.Neovim

echo visual studio code
rem note that mergetasks will overwrite the previous mergetasks parameter
%get% Microsoft.VisualStudioCode --custom "/mergetasks=!associatewithfiles,!runcode"

echo emacs
if not exist c:\program files\emacs\bin\runemacs.exe goto install_emacs else goto emacs_installed

:install_emacs
%get% GNU.Emacs
pushd c:\program files\emacs
cd emacs*
for /f "tokens=*" %%i in ('dir /b') do move %%i ..
cd ..
for /f "tokens=*" %%i in ('dir /ad /b emacs*') do rmdir %%i
popd
goto after_emacs_install

:emacs_installed
echo emacs already installed
goto after_emacs_install

:after_emacs_install

echo git
%get% Git.Git

echo 7zip
%get% 7zip.7zip

echo miktex
%get% MiKTeX.MiKTeX

echo r
%get% RProject.R

