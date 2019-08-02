
ActivateLauncher()
{
  If WinExist("Primu$ 7")
    and !WinExist("PRIMU$ - Black Box Design")
    {
      WinActivate, Primu$ 7
    }
  else
    MsgBox, Cannot Activate Launcher
}

ClickWrench()
{
ActivateLauncher()
Click 515, 49
WinWait PRIMU$ -- Configuration
}

click_backtesting_time_intervals_tab() {
  WinActivate, PRIMU$ -- Configuration
  WinWait, PRIMU$ -- Configuration
  MouseClick, Left, 350, 42
  sleep, 200
}


; Backtesting Time Intervals ----------------------------------
click_one_day_radio_button() {
WinActivate, PRIMU$ -- Configuration
WinWait, PRIMU$ -- Configuration
  MouseClick, Left, 63, 80
  sleep, 200
}

enter_single_date(date_str) {
  WinActivate, Primu$ 7
  WinWait, Primu$ 7
  ClickWrench()
  sleep, 100

  tokens := StrSplit(date_str, "-")
  year := tokens[1]
  month := tokens[2]
  day := tokens[3]
  jay_style := month . "/" . day . "/" . SubStr(year, 3)


  WinActivate, PRIMU$ -- Configuration
  WinWait, PRIMU$ -- Configuration

  click_backtesting_time_intervals_tab()

  click_one_day_radio_button()

  MouseClick, Left, 190, 76
  sleep, 200

  send, %jay_style%

  send, {tab}

  MouseClick, Left, 519, 462
  sleep, 200

}

enter_single_date("2009-12-23")
