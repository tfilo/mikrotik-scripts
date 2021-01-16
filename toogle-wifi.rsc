:global daymode
:global lastBtnPress

# 2.4ghz and 5ghz wifi
:local Radio2Disabled [/interface get wlan1 disabled]
:local Radio5Disabled [/interface get wlan2 disabled]
# virual wifi
:local RadioGuestDisabled [/interface get wlan3 disabled]

if ($daymode=true) do {
   # During day toogle guest wifi only.
   if ($RadioGuestDisabled=false) do {
      /interface wireless disable wlan3
      :log info "Guest network disabled"
   } else {
      /interface wireless enable wlan3
      :log info "Guest network enabled"
   }
} else {
   # During night toogle all wifi.
   # When disabled than first press will enable 2.4 and 5ghz wifi.
   # Then second press within 5s enable guest wifi.
   # If wifi is already enabled, press will disable all wifi at once.
   if ($Radio2Disabled=false && [:typeof $lastBtnPress]="time" && $lastBtnPress > ([/system clock get time] - 00:00:05)) do {
      # Enable guest network only on second push in 5 seconds and only when 2ghz enabled already
      if ($RadioGuestDisabled=true) do {
          /interface wireless enable wlan3
         :log info "Guest network enabled"
         # Set time to old value so next press will be handled as first press
         :set $lastBtnPress ([/system clock get time] - 00:00:10)
      }
   } else {
      if ($RadioGuestDisabled=false) do {
         /interface wireless disable wlan3
         :log info "Guest network disabled"
      }
      if ($Radio2Disabled=false) do {
         /interface wireless disable wlan1
         :log info "2.4Ghz network disabled"
      } else {
         /interface wireless enable wlan1
         :log info "2.4Ghz network enabled"
      }
      if ($Radio5Disabled=false) do {
         /interface wireless disable wlan2
         :log info "5Ghz network disabled"
      } else {
         /interface wireless enable wlan2
         :log info "5Ghz network enabled"
         # after enabling wifi save time for next press
         :set $lastBtnPress [/system clock get time]
      }
   }
}
