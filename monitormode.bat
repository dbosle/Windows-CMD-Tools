@Echo off

netsh wlan show wirelesscapabilities | findstr monitor
PAUSE