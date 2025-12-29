# MikroTik Scripts

This repository contains four scripts for MikroTik devices that I find useful.

## Overview

These scripts were tested on a MikroTik **hAP ac2** running **RouterOS 7.20.6**. In my setup, I renamed `wlan1` and `wlan2` to indicate their frequencies ("2ghz" and "5ghz"). If you use different interface names, please update the scripts accordingly. Additionally, I use virtual interfaces for "iot" and "guest." If you do not have these interfaces, you should remove them from the scripts.

## How to Use

1.  **Morning Schedule:** Set a scheduler (e.g., at 08:00) to execute `wlan-enable.msl`.
2.  **Evening Schedule:** Set a scheduler (e.g., at 22:00) to execute `wlan-disable.msl`.
3.  **Mode Button:** Set the "Mode" button to execute the `wlan-toggle.msl` script.
4.  **Backups:** Set a scheduler at your preferred interval to send a configuration backup using `send-backup.msl`.

---

### wlan-enable.msl
This script checks if the "2ghz," "5ghz," and "iot" interfaces are disabled. Based on the state of these interfaces, it will enable them as needed.

### wlan-disable.msl
This script checks if the "2ghz," "5ghz," "iot," and "guest" interfaces are enabled. Based on their state, it will disable them as needed.

### wlan-toggle.msl
This script checks the current state of the "guest" interface and toggles it. If the interface is enabled, the script will disable it; if it is disabled, the script will enable it.

### send-backup.msl
This script creates an `.rsc` backup and exports the configuration to temporary files. These files are then sent as email attachments. 

> **Note:** On line 6, please update the recipient address to your actual email: `to="*****@*****.**"`. 

After a successful submission, the temporary files are automatically deleted after 30 seconds.