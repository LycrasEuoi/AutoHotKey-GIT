#Requires AutoHotkey v2.0
#SingleInstance Force

TestGUI := Gui(,"Test")

TestGUI.Add("text",, "First name:")
TestGUI.Add("text",, "Last name:")
TestGUI.Add("Edit","w150 vFirstName ym")
TestGUI.Add("Edit","w50 vLastName")
TestGUI.Add("Button", "default", "OK").OnEvent("Click", ProcessUserInput)
TestGUI.OnEvent("Close", ProcessUserInput)
TestGUI.Show("w1000 h300")

ProcessUserInput(*)
{
    Saved := TestGUI.Submit()
    MsgBox("You Entered: " Saved.FirstName " " Saved.LastName)
}
