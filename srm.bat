rem @echo off
setlocal

for %%i in ("%1") do set basename=%%~nxi

move "%1" "%mydir%\scrap\%basename%_%random%"

