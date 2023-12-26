#Requires AutoHotkey v2.0

; Create GUI
Timer := Gui()
;Timer.Add("Te" "vClock w200 Center", A_Now)
Timer.AddText("vStopwatch w200 Center", "00:00:00")
Timer.AddButton("Start", "StartStopwatch").Name := "StartStopwatch"
Timer.AddButton("Reset", "ResetStopwatch")
Timer.Show()

; Variables for Stopwatch
stopwatchRunning := false
stopwatchStartTime := 0
stopwatchPauseTime := 0

; Update Clock every second
SetTimer("UpdateClock", 1000)
SetTimer("UpdateStopwatch", 100)

; Start the script
return

; Update Clock
UpdateClock() {
    Timer.Clock.Text := A_Now
}

; Update Stopwatch
UpdateStopwatch() {
    if (stopwatchRunning) {
        elapsedTime := A_TickCount - stopwatchStartTime + stopwatchPauseTime
        hours := Floor(elapsedTime / 3600000)
        minutes := Floor((elapsedTime - (hours * 3600000)) / 60000)
        seconds := Floor((elapsedTime - (hours * 3600000) - (minutes * 60000)) / 1000)
        formattedTime := Format("{:02d}:{:02d}:{:02d}", hours, minutes, seconds)
        Timer.Stopwatch.Text := formattedTime
    }
}

; Start/Stop Stopwatch
StartStopwatch(this) {
    global stopwatchRunning
    global stopwatchStartTime
    global stopwatchPauseTime

    if (!stopwatchRunning) {
        stopwatchRunning := true
        stopwatchStartTime := A_TickCount
        this.Text := "Stop"
    } else {
        stopwatchRunning := false
        stopwatchPauseTime += A_TickCount - stopwatchStartTime
        this.Text := "Start"
    }
}

; Reset Stopwatch
ResetStopwatch() {
    global stopwatchRunning
    global stopwatchPauseTime

    stopwatchRunning := false
    stopwatchPauseTime := 0
    Timer.Stopwatch.Text := "00:00:00"
    Timer.StartStopwatch.Text := "Start"
}

; Close GUI
GuiClose() {
    ExitApp
}

