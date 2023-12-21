#Requires AutoHotkey v2.0
#SingleInstance Force

LocationIni := "C:\Users\" A_UserName "\AutohotkeyLianderKeybinds\"
IniFile := "C:\Users\" A_UserName "\AutohotkeyLianderKeybinds\SettingsLianderKeybinds.ini"
Version := 1
;CurrentVersion := IniRead(IniFile, "Main", "CurrentVersion")
    ; Check if script has ever been executed, if not execute FirstInitialization()
    if !(InStr(FileExist(LocationIni), "D")){
        FirstInitialization(Version)
    }
    ; Check if script has ever been executed, if it has execute UpdateLianderKeybinds()
    else if (IniRead(IniFile, "Main", "CurrentVersion") < Version){
        UpdateLianderKeybinds("De update was een succes`n`nGroeten de Developer")
    }
    ; if its the same version or older
    else if (IniRead(IniFile, "Main", "CurrentVersion") >= Version){
        MsgBox("Het huidige script is al de laatste versie")
    }
    ; Error catch
    else if ((IniRead(IniFile, "Main", "CurrentVersion") = "")){
        MsgBox("Error, de versie is niet goed geïnitieerd neem contact op met Youri Claes")
    }
    ; Error catch
    else{
        MsgBox("Error, neem contact op met Youri Claes")
    }


FirstInitialization(Version){ ; this function handles the first initialization of the script
    
    ; Created the directory C:\Users\$Username\Autohotkey\
    DirCreate(LocationIni)
    ; Initiate the value of Currentversion
    IniWrite(Version, IniFile, "Main", "CurrentVersion")
    UpdateLianderKeybinds("De installatie was een succes`nHet script is verplaatst naar " A_Startup "\" A_ScriptName "`n`nGroeten Youri Claes")

}

UpdateLianderKeybinds(Message) { ; this function handles the updates of the script

    ; Update the value of Currentversion
    IniWrite(Version, IniFile, "Main", "CurrentVersion")
    ; Moves the Script to C:\Users\$Username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
    FileMove(A_ScriptFullPath, A_Startup "\" A_ScriptName, 1)
    ; Informs the user about the installation
    MsgBox(Message,"Installatie", "T10")
   
}


Key1 := "^"
Key2 := "+"
Key3 := "r"
;Hotkey(Key1 Key2 Key3, Func("SelectionToBIG"))

;SelectionToBIG(){
    ;Send "^c"
    ;Sleep 100
   ; Run "https://big.cf.alliander.com/app/index.html#/cases/0" A_Clipboard "/informatie"
;}