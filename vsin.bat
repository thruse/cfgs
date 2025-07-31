@echo off
call "%PROGRAMFILES(X86)%\Microsoft Visual Studio\Installer\setup" modify --quiet ^
--installpath "%PROGRAMFILES%\Microsoft Visual Studio\2022\Community" ^
--add Microsoft.VisualStudio.Component.VC.CoreIde ^
--add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 ^
--add Microsoft.VisualStudio.Component.VC.Redist.14.Latest ^
--add Microsoft.VisualStudio.Component.Windows10SDK ^
--add Microsoft.VisualStudio.Component.Windows11SDK.22621
exit
