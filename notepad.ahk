#Persistent  ; Keep the script running

; Initial check for Notepad
SetTransparencyNotepad()

; Set a timer to periodically check for Notepad
SetTimer, CheckForNotepad, 2000
return

CheckForNotepad:
    SetTransparencyNotepad()
return

; Function to set transparency for Notepad
SetTransparencyNotepad() {
    if WinExist("ahk_exe notepad.exe") {
        ; Check if the window is found, then set the transparency to 200
        WinSet, Transparent, 200, ahk_exe notepad.exe
    }
}
