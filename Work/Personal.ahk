/*
 
 d8888b. d88888b d8888b. .d8888.  .d88b.  d8b   db  .d8b.  db      
 88  `8D 88'     88  `8D 88'  YP .8P  Y8. 888o  88 d8' `8b 88      
 88oodD' 88ooooo 88oobY' `8bo.   88    88 88V8o 88 88ooo88 88      
 88~~~   88~~~~~ 88`8b     `Y8b. 88    88 88 V8o88 88~~~88 88      
 88      88.     88 `88. db   8D `8b  d8' 88  V888 88   88 88booo. 
 88      Y88888P 88   YD `8888Y'  `Y88P'  VP   V8P YP   YP Y88888P 
                                                                   
                                                                   
 

   Autohotkey script for productivity at work
   Shortcuts
   by Lycras Euoi
   -------------------------------
   |                             |
   |  #   =   WIN                |
   |  !   =   Alt                |
   |  ^   =   Crtl               |
   |  +   =   Shift              |
   |                             |
   ------------------------------- 
*/
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

; Search on a choosen website
; [Crtl] + [Shift] + [C]
^+C::
{
        Send "^c" ; Copy's selected text tot A_Clipboard
        Sleep 100 ; Pause for a little
        Run ("https://www.google.com/search?q=" A_Clipboard) ; Search the selected text on google
}

; Open Media
; [Crtl] + [shift] + [M]
^+M::
{
    ; Allow for a secondary trigger after the keybind
    Trigger := AdditionalTriggerHandeling()

    if (Trigger = "s") ; Secondary trigger [s]
    {   
        Run ("https://open.spotify.com/") ; Open Spotify 
        
    }
    else if (Trigger = "y") ; Secondary trigger [y]
    {   
        Run ("https://music.youtube.com/") ; Open Youtube Music
    }
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

; If Powertoys doesn't work as it should, restarts this keybind Powertoys
; [Crtl]+[Alt]+[Shift]+[ScrollLock]
^!+ScrollLock::
{
    ProcessClose(ProcessExist("PowerToys.exe"))
    ProcessClose(ProcessExist("PowerToys.AlwaysOnTop.exe"))
    ProcessClose(ProcessExist("PowerToys.Awake.exe"))
    ProcessClose(ProcessExist("PowerToys.ColorPickerUI.exe"))
    ProcessClose(ProcessExist("PowerToys.FancyZones.exe"))
    ProcessClose(ProcessExist("PowerToys.KeyboardManagerEngine.exe"))
    ProcessClose(ProcessExist("PowerToys.PowerOCR.exe"))
    ProcessClose(ProcessExist("PowerToys.Run.exe"))
    ProcessClose(ProcessExist("PowerToys.Runner.exe"))
    ProcessClose(ProcessExist("PowerToys.Settings.exe"))
    Sleep 100
    Run("C:\Program Files\PowerToys\PowerToys.exe")
}

^+A::
{
    Run "http://172.233.60.193/add_to_playlist"
}

;================================================================ Functions ================================================================


AdditionalTriggerHandeling()
{
    TriggerHandler :=InputHook("L1")
    TriggerHandler.Start()
    TriggerHandler.Wait()
    return TriggerHandler.Input
}