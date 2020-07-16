@echo off
echo ######  Teredo Fix  ######
echo ######  fuckteredo  ######
echo ###### by Dyrex2004 ######
goto check_Permissions

:check_Permissions
echo.
rem https://www.quora.com/How-can-I-check-if-I-have-administrator-right-from-a-batch-file
echo Administrative permissions required. Detecting permissions...

net session >nul 2>&1
if %errorLevel% == 0 (
echo Success: Administrative permissions confirmed.
) else (
echo.
echo Failure: Current permissions inadequate.
goto End
)

echo.
echo This is your teredo configuration:
netsh interface Teredo show state
netsh interface Teredo set state servername=default
netsh interface teredo set state type=enterpriseclient
echo Additionally: Resync time with NTP Pool server (Wrong System Time also breaks teredo). Resync manually if this fails!
w32tm /resync
echo.
echo Done. 
:End
pause
