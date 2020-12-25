@Echo off

goto check_Permissions

:check_Permissions
    echo Administrative permissions required. Detecting permissions...

    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Success: Administrative permissions confirmed.
    ) else (
        echo Failure: Run this script as Administrator.
        pause 
        exit
    )

echo.
echo ---Port Forwarding Table---
netsh interface portproxy show v4tov4

:while 
echo ---Delete Port Forward---
set /p ip="-> Listening IP Address: "
set /p port="-> Listening Port(Ex:80,445): "

netsh interface portproxy delete v4tov4 listenaddress=%ip% listenport=%port% 

echo.
echo ---Port Forwarding Table---
netsh interface portproxy show v4tov4
goto :while

PAUSE

netsh interface portproxy delete v4tov4 listenaddress=127.0.0.1 listenport=9000