@echo off
setlocal
goto main

:set_dir_symlink
for %%i in ("%symlink_target%") do set current_directory=%%~dpi
exit /b 0

:set_dir_real
set current_directory=%~dp0
exit /b 0

:install

set winget_opts=--accept-source-agreements --accept-package-agreements --no-upgrade --disable-interactivity

call winget import %winget_opts% --import-file "%devdir%\cfgs\packages.json"

if not exist "%programfiles%\emacs" (
    call winget install --source winget --silent %winget_opts% --exact --id GNU.Emacs --version 29.4
)

call "%userprofile%\appdata\local\programs\python\python312\python" -m venv "%devdir%\.venv"

call "%programfiles(x86)%\microsoft visual studio\installer\setup" modify --quiet ^
--installpath "%programfiles%\microsoft visual studio\2022\community" ^
--add Microsoft.VisualStudio.Component.VC.CoreIde ^
--add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 ^
--add Microsoft.VisualStudio.Component.VC.Redist.14.Latest ^
--add Microsoft.VisualStudio.Component.Windows10SDK ^
--add Microsoft.VisualStudio.Component.Windows11SDK.22621

call "%devdir%\cfgs\shin"

call code --install-extension ms-vscode.cpptools
call code --install-extension james-yu.latex-workshop
call code --install-extension ms-python.python
call code --install-extension reditorsupport.r

rem pip install --requirement "%devdir%\cfgs\requirements.txt"

exit /b 0

:sscp
rem soft silent copy
setlocal
call srm "%~2" > nul 2> nul
copy "%~1" "%~2"
exit /b 0

:main

for /f "usebackq" %%i in (`call powershell -noprofile -command "(get-item '%~f0').target"`) do set symlink_target=%%i
if defined symlink_target (
    call :set_dir_symlink
) else (
    call :set_dir_real
)

set current_directory=%current_directory:~0,-1%

set mydir=%current_directory%\..\..
for %%i in ("%mydir%") do set mydir=%%~fi

set devdir=%current_directory%\..
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

if "%~1" == "--install" (
    call :install
)

call taskkill /f /im explorer.exe
call reg import "%devdir%\cfgs\w32_cfg.reg"
start explorer

move "%devdir%\bin\srm.bat" "%mydir%\scrap\srm.bat_%random%" > nul 2> nul
copy "%devdir%\cfgs\srm.bat" "%devdir%\bin\srm.bat" 

call :sscp "%devdir%\cfgs\vscin.bat" "%devdir%\bin\vscin.bat" 

call :sscp "%devdir%\cfgs\venvin.bat" "%devdir%\bin\venvin.bat" 

call powershell -noprofile -file "%devdir%\cfgs\cmd_cfg.ps1"

mkdir "%userprofile%\appdata\local\nvim"
call :sscp "%devdir%\cfgs\init.vim" "%userprofile%\appdata\local\nvim\init.vim" 

mkdir "%userprofile%\appdata\roaming\.emacs.d\baks"
mkdir "%userprofile%\appdata\roaming\.emacs.d\autosaves"
type nul > "%userprofile%\appdata\roaming\.emacs.d\custom.el"
call :sscp "%devdir%\cfgs\init.el" "%userprofile%\appdata\roaming\.emacs.d\init.el" 

call :sscp "%devdir%\cfgs\.gitconfig" "%userprofile%\.gitconfig" 

