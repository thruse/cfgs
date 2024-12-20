@echo off

rem REM VS, MSVC 
rem call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" x64
rem 
rem REM personal things; cmd; VS Code; WinGet; Git; MiKTeX; R; 7-Zip; Emacs; Neovim;
rem set Path=D:\dev\bin;C:\Windows\System32;%USERPROFILE%\AppData\Local\Programs\Microsoft VS Code\bin;%USERPROFILE%\AppData\Local\Microsoft\WindowsApps;C:\Program Files\Git\cmd;%USERPROFILE%\AppData\Local\Programs\MiKTeX\miktex\bin\x64;C:\Program Files\R\R-4.4.0\bin\x64;C:\Program Files\7-Zip;C:\Program Files\Emacs\bin;C:\Program Files\Neovim\bin;%Path%

call "c:\program files\microsoft visual studio\2022\community\vc\auxiliary\build\vcvarsall" x64 > nul
rem my executables; cmd; nvim; winget; git; 7z; code
set path=%my_directory%\dev\bin;c:\windows\system32;c:\program files\neovim\bin;%userprofile%\appdata\local\microsoft\windowsapps;c:\program files\git\cmd;c:\program files\7-zip;%userprofile%\appdata\local\programs\microsoft vs code\bin;%path%

