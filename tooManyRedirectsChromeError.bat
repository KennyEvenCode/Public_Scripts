@echo off 

:: Check for Admin Privileges 
whoami /groups | find "S-1-16-12288" && set ELEVATED=true || set ELEVATED=false
if %ELEVATED%==false (
echo  "Please start over and right-click on this file,"
echo  "then select 'Run as administrator' to execute successfully."
echo.&pause&exit)


echo ""
echo "At this time, please do the following:"
echo ""
:: Clear your Internet Browser Cookies and Cache
echo "  - Manually clear all cookies and cache from your web browser before continuing."
echo ""
:: Scan for Viruses 
echo "  - Run a Full System Scan and Offline System Scan via Windows Security Console."
echo ""
echo "Upon completeing these tasks..."
pause


:: Create a Restore Point 
echo "Creating a Restore Point..."
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Restore Point: Before executing tooManyRedirects.bat", 100, 7
