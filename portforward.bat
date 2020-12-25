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


echo ---Port Forwarding---
rem Belirtilen ip:port adresine bağlanacak ve o adresteki çıktıyı çekecek
set /p ip="-> Target IP Address: "
set /p port="-> Target Port(Ex:80,445): "

echo.
echo Set Local Listening Address
rem Bağlanılan target adresin localde yönlendirileceği adres
set /p lip="-> Local IP Address(Ex: localhost, 127.0.0.1, 192.168.0.1): "
set /p lport="-> Local Port(Ex:80,445): "

netsh interface portproxy add v4tov4 listenaddress=%lip% listenport=%lport% connectaddress=%ip% connectport=%port%

echo.
echo ---Port Forwarding Table---
netsh interface portproxy show v4tov4

PAUSE