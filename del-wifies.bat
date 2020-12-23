@Echo off
netsh wlan show profiles

:while 
set /p name="Enter SSID name for remove: "
echo %name%
netsh wlan delete profile name="%name%"
goto :while