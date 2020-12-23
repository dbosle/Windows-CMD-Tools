@Echo off
netsh wlan show profiles

:while 
set /p name="Enter SSID name: "
echo %name%

netsh wlan show profile name="%name%" key=clear | findstr "SSID name"
netsh wlan show profile name="%name%" key=clear | findstr "Key"
goto :while