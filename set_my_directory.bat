@echo off
setlocal

for /f "usebackq" %%i in (`powershell -noprofile -command "(get-item %~f0).linktype"`) do set symlink_target=%%i
if defined symlink_target goto symlink else goto file

:file
set current_directory=%~dp0
goto construct_my_directory

:symlink
for %%i in ("%symlink_target%") do set current_directory=%%~dpi

goto construct_my_directory

:construct_my_directory

set current_directory=%current_directory:~0,-1%\..\..
for %%i in ("%current_directory%") do set current_directory=%%~fi

endlocal & set my_directory=%current_directory%
