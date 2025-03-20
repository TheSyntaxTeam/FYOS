#Persistent  ; Keep the script running

; Initial check for File Explorer
SetTransparency()

; Set a timer to periodically check for File Explorer
SetTimer, CheckForFileExplorer, 2000
return

CheckForFileExplorer:
    SetTransparency()
return

; Function to set transparency only for File Explorer windows
SetTransparency() {
    ; Loop through all Explorer windows
    WinGet, id, list, ahk_exe explorer.exe
    Loop, %id%
    {
        this_id := id%A_Index%
        WinGetClass, this_class, ahk_id %this_id%
        
        ; Check if it's a file explorer window (CabinetWClass)
        if (this_class = "CabinetWClass")
        {
            WinSet, Transparent, 200, ahk_id %this_id%
        }
    }
}