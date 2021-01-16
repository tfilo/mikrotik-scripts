:global daymode
:set $daymode true

:local Radio2Disabled [/interface get wlan1 disabled]
:local Radio5Disabled [/interface get wlan2 disabled]

if ($Radio2Disabled=true) do {
      /interface wireless enable wlan1
      :log info "2.4Ghz network enabled"
}
if ($Radio5Disabled=true) do {
      /interface wireless enable wlan2
      :log info "5Ghz network enabled"
}
