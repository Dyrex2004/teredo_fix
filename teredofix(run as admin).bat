@echo off
echo ######  Teredo Fix  ######
echo ######  fuckteredo  ######
echo ###### by Dyrex2004 ######
goto check_Permissions

:check_Permissions
echo.
:FROM https://www.quora.com/How-can-I-check-if-I-have-administrator-right-from-a-batch-file
echo Administrative permissions required. Detecting permissions...

net session >nul 2>&1
if %errorLevel% == 0 (
echo.
echo Success: Administrative permissions confirmed.
) else (
echo.
echo Failure: Current permissions inadequate.
goto End
)

echo.
echo This is your teredo configuration:
echo.
netsh interface Teredo show state
echo.
echo Resetting server
netsh interface Teredo set state servername=default
echo.
echo Set Interface as EnterpriseClient
netsh interface teredo set state type=enterpriseclient
echo.
echo Additionally: Resync time with NTP Pool server (Wrong System Time also breaks teredo). Resync manually if this fails!
echo.
w32tm /resync
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo ######  Teredo Fix  ######
echo ######  FUCKTEREDO  ######
echo ###### by Dyrex2004 ######
echo. 
echo (Scroll up to see the log)
echo Done. 
echo.

:End
pause