#Persistent

; Initialize - make sure desktops exist
InitializeDesktops()

; Alt+Win+1-4: Switch to Desktop 1-4 (creating if needed)
!#1::GoToDesktop(1)
!#2::GoToDesktop(2)
!#3::GoToDesktop(3)
!#4::GoToDesktop(4)

; Alt+Win+Left/Right: Move to previous/next desktop
!#Left::SendInput, #^{Left}
!#Right::SendInput, #^{Right}

; Alt+Win+N: Create a new desktop
!#n::SendInput, #^d

; Alt+Win+W: Close current desktop
!#w::SendInput, #^{F4}

; Alt+Win+M: Move current window to next desktop
!#m::
    WinGetTitle, activeWindow, A
    SendInput, #^{Right}
    Sleep, 100
    SendInput, #+{Left}
    Sleep, 100
    WinActivate, %activeWindow%
return

; Function to initialize desktops
InitializeDesktops() {
    ; First go all the way left to first desktop
    SendInput, #^{Left 10}
    Sleep, 200
    
    ; Create missing desktops up to 4
    Loop, 3 {
        SendInput, #^{Right}
        Sleep, 100
        if ErrorLevel {
            SendInput, #^d
            Sleep, 100
        }
    }
    
    ; Go back to desktop 1
    SendInput, #^{Left 10}
    Sleep, 100
}

; Function to go to a specific desktop
GoToDesktop(desktopNumber) {
    ; First go all the way left
    SendInput, #^{Left 10}
    Sleep, 100
    
    ; Then go right to desired desktop
    if (desktopNumber > 1) {
        rightCount := desktopNumber - 1
        SendInput, #^{Right %rightCount%}
        Sleep, 100
    }
    
    ; If we get an error, we need to create this desktop
    if ErrorLevel {
        ; Create missing desktops
        Loop, %rightCount% {
            SendInput, #^d
            Sleep, 100
        }
        
        ; Navigate to the desired desktop
        SendInput, #^{Left 10}
        Sleep, 100
        SendInput, #^{Right %rightCount%}
    }
}