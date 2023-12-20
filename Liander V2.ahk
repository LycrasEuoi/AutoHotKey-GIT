;
;   888      Y8P                        888                  
;   888      d8b                        888                  
;   888                                 888                  
;   888      888  8888b.  88888b.   .d88888  .d88b.  888d888 
;   888      888     "88b 888 "88b d88" 888 d8P  Y8b 888P"   
;   888      888 .d888888 888  888 888  888 88888888 888     
;   888      888 888  888 888  888 Y88b 888 Y8b.     888     
;   88888888 888 "Y888888 888  888  "Y88888  "Y8888  888 
;
;
;   Autohotkey script for productivity at work
;   Shortcuts
;   by Lycras Euoi
;   -------------------------------
;   |                             |
;   |  #   =   WIN                |
;   |  !   =   Alt                |
;   |  ^   =   Crtl               |
;   |  +   =   Shift              |
;   |                             |
;   ------------------------------- 

;================================================================ Default ==================================================================

#Requires AutoHotkey v2.0
#SingleInstance Force

; Checks is Settings.ini is created
if !(InStr( FileExist("C:\Users\" A_UserName "\Autohotkey\"), "D"))
    {
        DirCreate "C:\Users\" A_UserName "\Autohotkey\"
    }

MsgBox("The script has been succesfully executed", "Liander Script","T10")

;================================================================ Shortcuts ================================================================

; Search the selected text on google
; [Crtl] + [Shift] + [C]
^+c::
{
    Send "^c"
    Sleep 100
    Run ("https://www.google.com/search?q=" A_Clipboard)
}

^+r::
{
    Send "^c"
    Sleep 100
    Run ("https://big.cf.alliander.com/app/index.html#/cases/0" A_Clipboard "/informatie")
}

; Open Spotify
; [Crtl] + [Alt] + [s]
^!s::
{
    Run ("https://open.spotify.com/")
}

; Open Youtube Music
; [Crtl] + [Alt] + [y]
^!y::
{
    Run ("https://music.youtube.com/")
}

; open and close Calculator
; [Crtl] + [=]
; ^=::

; Keeps selected windows always on top off the other windows
; [Crtl] + [Space]
if !(ProcessExist("PowerToys.AlwaysOnTop.exe")){
    ^SPACE::
    {
        WinSetAlwaysOnTop(-1, "A")
    }
}
; Enter the current Date
; [Alt] + [;]
!SC027::
{
    Send A_DD "-" A_mm "-" A_YYYY
}

; Mediacontrol when its missing
; Next Song
; [Ctrl]+[Alt]+[(>)]
^!Right::
{
    Send "{Media_Next}"
}

; Previous Song
; [Ctrl]+[Alt]+[(<)]
^!Left::Send "{Media_Prev}"

; Start or Pause a song
; [Ctrl]+[Alt]+[Space]
^!Space::Send "{Media_Play_Pause}"

; Volume up
; [Windows]+[Scroll Up]winexproc
#WheelUp::Send "{Volume_Up}"

; Volume down
; [Windows]+[Scroll down]
#WheelDown::Send "{Volume_Down}"

; Translate keybinds
; [Windows]+[Numpad 1] = [Crtl]=[F2]
#Numpad1:: Send "^{F2}"

; [Windows]+[Numpad 2] = [Crtl]=[F3]
#Numpad2:: Send "^{F3}"

; [Windows]+[Numpad 3] = [Crtl]=[F4]
#Numpad3:: Send "^{F4}"

; [Windows]+[Numpad 0] = [Crtl]=[F5]
#Numpad0::Send "^{F5}"

; Opens Gaia
; [Crtl]+[Alt]+[1]
^!1::
{
   Run("P:\bis\GaiaW7\Gaia.exe")
   MsgBox("GAIA is starting this will take some time", "GAIA", "T5")
}

; If Powertoys doesn't work as it should, restart this keybind Powertoys
; [Crtl]+[Alt]+[Shift]+[ScrollLock]
^!+ScrollLock::
{
    ProcessClose(ProcessExist("PowerToys.exe"))
    ProcessClose(ProcessExist("PowerToys.KeyboardManagerEngine.exe"))
    ProcessClose(ProcessExist("PowerToys.FancyZones.exe"))
    ProcessClose(ProcessExist("PowerLauncher.exe"))
    Sleep 100
    Run("C:\Program Files\PowerToys\PowerToys.exe")
}



