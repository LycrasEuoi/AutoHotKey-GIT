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

; Create a ChatGPT prompt
^+?::
{
    Trigger := AdditionalTriggerHandeling()

    if (Trigger = "m")
        {
            ChatGPT_Prompts("Verbeter de spelling en zinsbouw van de onderstaande e-mail, zonder de betekenis en gedachten aan te passen. Hanteer een schrijfstijl die past bij een engineer en gebruik semi-formeel taalgebruik.`rHier is de email:`"`r")
        }
    else if (Trigger = "s")
        {
            ChatGPT_Prompts("Samenvatting van de e-mail:`r`r1. Inleiding tot het onderwerp van de e-mail.`r2. Belangrijkste punten of problemen die worden besproken.`r3. Eventuele relevante details die in de e-mail staan vermeld.`r4. Actielijst voor de engineer, inclusief taken, deadlines en verantwoordelijkheden.`r`r Indien de e-mail meer informatie bevat, zal de samenvatting worden uitgebreid om alle relevante details en actiepunten te omvatten.`r Hier is de email:`"`r")
        }
}


; Search on a Google
; [Crtl] + [Alt] + [C]
^!c::
{
    Send "^c" ; Copy's selected text tot A_Clipboard
    Sleep 100 ; Pause for a little
    Run ("https://www.google.com/search?q=" A_Clipboard) ; Search the selected text on google
}

; Search on a choosen website
; [Crtl] + [Shift] + [Alt] + [S]
^+!s::
{
    ; Allow for a secondary trigger after the keybind
    Trigger := AdditionalTriggerHandeling()

    ; Secondary trigger [c]
    if (Trigger = "i")
        {
            Send "^c" ; Copy's selected text tot A_Clipboard
            Sleep 100 ; Pause for a little
            Run ("https://intranet.alliander.com/search?q=" A_Clipboard) ; Search the selected text on google

        }
    ; Secondary trigger [b]
    else if (Trigger = "b") {
        Send "^c" ; Copy's selected text tot A_Clipboard
        Sleep 100 ; Pause for a little
        Run ("https://big.cf.alliander.com/app/index.html#/cases/0" A_Clipboard "/informatie") ; Search a work related number in a work related app
        
    }
}


; Open Media
; [Crtl] + [Alt] + [m]
^m::
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

;================================================================ Functions ================================================================


AdditionalTriggerHandeling()
{
    TriggerHandler :=InputHook("L1")
    TriggerHandler.Start()
    TriggerHandler.Wait()
    return TriggerHandler.Input
}

ChatGPT_Prompts(Prompt)
{
    Send "^c"
    Sleep 100
    New_Clipboard := Prompt A_Clipboard "`""
    A_Clipboard := New_Clipboard
}
