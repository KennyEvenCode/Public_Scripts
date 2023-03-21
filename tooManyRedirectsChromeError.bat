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


:: Check & Correct Date & Time Settings 
echo ""
echo "Setting Timezone to Pacific Standard Time"
echo ""
echo "Current TimeZone Setting:"
tzutil /g
tzutil /s "Dateline Standard Time"
tzutil /s "Pacific Standard Time"
echo "System set to Pacific Standard Time (UTC-08:00)"
echo ""


:: Flush the DNS (Domain Name System) 
echo ""
echo "Flushing DNS..."
ipconfig /flushdns
echo "Regsitering DNS..."
ipconfig /registerdns
echo "Releasing your IP address..."
ipconfig /release
echo "Renew your IP address..."
ipconfig /renew
echo "Resetting Winsock Catalog..."
netsh winsock reset