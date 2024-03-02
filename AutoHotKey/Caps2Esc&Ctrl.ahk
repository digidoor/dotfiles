;#IfWinNotActive,ahk_group WorkIn
;Caps lock to esc if pressed once, ctrl if held
*CapsLock::
    Send {Blind}{Ctrl Down}
    cDown := A_TickCount
Return
;#IfWinNotActive

;#IfWinNotActive,ahk_group WorkIn
*CapsLock up::
    ; Modify the threshold time (in milliseconds) as necessary
    If ((A_TickCount-cDown) < 150){
        Send {Blind}{Ctrl Up}{Esc}
    }
    Else {
        Send {Blind}{Ctrl Up}
    }
Return
;#IfWinNotActive

~LShift & RShift::CapsLock
~RShift & LShift::CapsLock
