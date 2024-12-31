rem @echo off
rem soft remove
setlocal

for %%i in ("%~1") do set base_name=%%~nxi

move "%~1" "%mydir%\scrap\%base_name%_%random%"

