# MikroTik Scripts

This repository for now contains 4 scripts for Wifi control.

## Explanation:

This scripts are testet on Mikrotik hAP ac2. In this device I use wlan1 which is 2.4Ghz wifi, than wlan2 which is 5Ghz wifi and then wlan3 which is virtual network used as Guest Network and it is connected to wlan1. Scripts use MikroTik scripting language. And it was tested with firmware version 6.48.

## How to use:

1. Set scheduller at morning (for example at 8:00) to execute `enable-wifi.msl`.
2. Set scheduller at evening (for example at 22:00) to execute `disable-wifi.msl`.
3. Set mode button to execute script `toogle-wifi.msl`.
4. Set scheduller at required interval to send backup of configuration using `send-backup.msl`.

### Enable wifi explained
Script will enable wlan1 and wlan2 if disabled. It will set global variable **dayMode = true**.

### Disable wifi explained
Script will disable wlan1, wlan2 and wlan3 if enabled. It will set global variable **dayMode = false**.

### Toogle wifi explained
##### When dayMode == true, than it will do following:
* single press will disable/enable wlan3.

##### When dayMode == false, than it will do following:

###### When wlan1 and wlan2 is disabled:
* single press will enable wlan1 and wlan2,
* second press within 5 seconds, will enable wlan3 while wlan1 and wlan2 will remain enabled.

###### When wlan1 and wlan2 is enabled:
* single press will disable wlan1, wlan2 and if wlan3 is enabled it will disable wlan3 too.
