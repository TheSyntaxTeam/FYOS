#Persistent  ; Keep the script running

; Initial check for VS Code
SetTransparency()

; Set a timer to periodically check for VS Code
SetTimer, CheckForVSCode, 2000
return

CheckForVSCode:
    SetTransparency()
return

; Function to set transparency for VS Code
SetTransparency() {
    if WinExist("ahk_exe Code.exe") {
        WinSet, Transparent, 200, ahk_exe Code.exe
    }
}