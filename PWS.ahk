#Persistent  ; Keep the script running

; Set a timer to check for PowerShell windows
SetTimer, CheckForPowerShell, 1000  ; Check every second
return

CheckForPowerShell:
    ; Method 1: By executable
    SetTitleMatchMode, 2  ; Sets the matching behavior to "contains"
    if WinExist("ahk_exe powershell.exe") {
        WinGet, TransLevel, Transparent, ahk_exe powershell.exe
        if (TransLevel != 200) {  ; Only change if not already set
            WinSet, Transparent, 200, ahk_exe powershell.exe
        }
    }
    
    ; Method 2: By title
    if WinExist("Windows PowerShell") {
        WinGet, TransLevel, Transparent, Windows PowerShell
        if (TransLevel != 200) {
            WinSet, Transparent, 200, Windows PowerShell
        }
    }
    
    ; Method 3: More aggressive title match
    Loop, 10 {  ; Check all potential PowerShell windows
        if WinExist("ahk_class ConsoleWindowClass") {
            WinGetTitle, CurrentTitle, ahk_class ConsoleWindowClass
            if InStr(CurrentTitle, "PowerShell") {
                WinSet, Transparent, 200, ahk_class ConsoleWindowClass ahk_title %CurrentTitle%
            }
        }
    }
return