# MikroTik Scripts

This repository for now contains 3 scripts for Wifi control.

## How to use:

1. Set scheduller at morning (for example at 8:00) to execute `enable-wifi.rsc`.
2. Set scheduller at evening (for example at 22:00) to execute `disable-wifi.rsc`.
3. Set mode button to execute script `toogle-wifi.rsc`.

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
