#Requires AutoHotkey v2.0
#SingleInstance Force

; ========================================================================== Paths ====================================================================

LocationIni := "C:\Users\" A_UserName "\AutohotkeyLianderKeybinds\"
IniFile := "C:\Users\" A_UserName "\AutohotkeyLianderKeybinds\SettingsLianderKeybinds.ini"

; ===================================================================== Initialization ================================================================

if !(InStr(FileExist(LocationIni), "D") )
    {
        ;If C:\Users\$CurrentUser\Autohotkey\ doesn't exists created it
        DirCreate (LocationIni)
    }
if (IniRead(IniFile, "Main", "CurrentVersion") = ""){
    IniWrite(1, IniFile, "Main", "CurrentVersion")
}

; Version management    
CurrentVersion := IniRead(IniFile, "Main", "CurrentVersion")
UpdateVersion := 2

; ====================================================================== Installation =================================================================

; Checks if C:\Users\$CurrentUser\Autohotkey\ exists

;IniWrite(UpdateVersion, IniFile, "Main", "updateVersion")


; Checks if the Currentversion is New, Older, or the same as the scripts version
if (IniRead(IniFile, "Main", "CurrentVersion") < CurrentVersion)
    {
        ; Write the new currentversion to de ini file
        IniWrite(CurrentVersion, IniFile, "Main", "CurrentVersion")

        ; Moves the Script to C:\Users\$Username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
        ;FileMove(A_ScriptFullPath, A_Startup "\" A_ScriptName, 1) 

        ; Informs the user about the installatiion
        MsgBox("De installatie was een succes`nHet script is verplaatst naar " A_Startup "\" A_ScriptName "`n Groeten Youri Claes`a", "Installatie", "T10")
    }
else if (Iniread(IniFile, "Main", "CurrentVersion") = CurrentVersion)
    {
        ; Informs user when currentverion is scripts version
        MsgBox("Dit is de laatste versie`a")
    }
else if (Iniread(IniFile, "Main", "CurrentVersion") > CurrentVersion)
    {
        ; Informs user when currentverion newer than scripts version
        MsgBox("Deze versie is ouder dan dat de Huidige versie")
    }
Else
    {
        ; Catch every other error, set settings first time
        MsgBox("Onbekende fout probeer opnieuw of neem contact op met ontwikkelaar`nYouri Claes`n06 1431858`nyouri.claes@alliander.com`a")
        IniWrite(CurrentVersion, "C:\Users\" A_UserName "\Autohotkey\SettingsLianderKeybinds.ini", "Main", "CurrentVersion")
    }

; ====================================================================== IKey binds ===================================================================

^+r::
{
    Send "^c"
    Sleep 100
    Run "https://big.cf.alliander.com/app/index.html#/cases/0" A_Clipboard "/informatie"
}