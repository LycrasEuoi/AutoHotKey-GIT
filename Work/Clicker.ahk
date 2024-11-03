; This is the third autoclicker ever made; all royalties to mikeyww, please
#Requires AutoHotkey v2.0
cps := 14
on  := False

^F12:: {
 Global on := !on
 SoundBeep 1000 + 500 * on
}

#HotIf on
RButton:: {
 start := A_TickCount, cliks := 0
 While GetKeyState(ThisHotkey, 'P') {
  Click
  Sleep start - A_TickCount + 1000 * ++cliks / cps
  ToolTip 'CPS = ' Round(1000 * cliks / (A_TickCount - start))
 }
 ToolTip
}
#HotIf