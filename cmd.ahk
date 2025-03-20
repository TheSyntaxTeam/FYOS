#Persistent  ; Keep the script running

; Initial check for Command Prompt
SetTransparency()

; Set a timer to periodically check for Command Prompt
SetTimer, CheckForCmd, 1000  ; Checking more frequently (every 1 second)
return

CheckForCmd:
    SetTransparency()
return

; Function to set transparency for Command Prompt with more reliable detection
SetTransparency() {
    ; Method 1: By executable
    if WinExist("ahk_exe cmd.exe") {
        WinSet, Transparent, 200, ahk_exe cmd.exe
    }
    
    ; Method 2: By window class
    if WinExist("ahk_class ConsoleWindowClass") {
        WinSet, Transparent, 200, ahk_class ConsoleWindowClass
    }
    
    ; Method 3: By window title (partial match)
    if WinExist("Command Prompt") {
        WinSet, Transparent, 200, Command Prompt
    }
}