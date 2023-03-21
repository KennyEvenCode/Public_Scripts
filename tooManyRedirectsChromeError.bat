@echo off 

:: Check for Admin Privileges 
whoami /groups | find "S-1-16-12288" && set ELEVATED=true || set ELEVATED=false
if %ELEVATED%==false (
echo  "Please start over and right-click on this file,"
echo  "then select 'Run as administrator' to execute successfully."
echo.&pause&exit)