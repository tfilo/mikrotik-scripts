:global daymode
:set $daymode false

:local Radio2Disabled [/interface get wlan1 disabled]
:local Radio5Disabled [/interface get wlan2 disabled]
:local RadioGuestDisabled [/interface get wlan3 disabled]

if ($RadioGuestDisabled=false) do {
      /interface wireless disable wlan3
      :log info "Guest network disabled"
}
if ($Radio2Disabled=false) do {
      /interface wireless disable wlan1
      :log info "2.4Ghz network disabled"
}
if ($Radio5Disabled=false) do {
      /interface wireless disable wlan2
      :log info "5Ghz network disabled"
}
