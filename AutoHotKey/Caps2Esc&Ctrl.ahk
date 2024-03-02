;-----------sends ESC if no other kb key is pressed regardless how long CAPS is held  -------
; if CAPS+V -> release CAPS is done quickly, this sends CTRL+V followed by ESC
;Caps lock to esc if pressed once, ctrl if held
;*CapsLock::
;    cDown := A_TickCount
;    Send {Blind}{Ctrl Down}
;Return
;
;*CapsLock up::
;    ; Modify the threshold time (in milliseconds) as necessary
;    If ((A_TickCount-cDown) < 150){
;        Send {Blind}{Ctrl Up}{Esc}
;    }
;    Else {
;        Send {Blind}{Ctrl Up}
;    }
;Return
; ---------------------END---------------------------------------------

;-----------sends ESC if no other kb key is pressed regardless how long CAPS is held  -------
; this one does not send ESC if CTRL+V is done very quickly, only if it is doubled
; e.g. CTRL+V -> release -> CTRL+V -> release  leads to CRTL+V, CTRL+V, ESC
;Caps lock to esc if pressed once, ctrl if held
;*CapsLock::
;;    cDown := A_TickCount
;    Send {Blind}{Ctrl Down}
;Return
;
;*CapsLock up::
;    ; Modify the threshold time (in milliseconds) as necessary
;    If (A_TimeSincePriorHotkey < 150){
;        Send {Blind}{Ctrl Up}{Esc}
;    }
;    Else {
;        Send {Blind}{Ctrl Up}
;    }
;Return
; ---------------------END---------------------------------------------

; ----------------- THIS ONE WORKS BEST SO FAR --------------------------------
; A long hold of CAPS will not send ESC even if no other keys are pressed during the hold.
; CTRL+V -> release -> CTRL+V -> release  leads to CRTL+V, CTRL+V, ESC, like some of the
; other versions, unfortunately.

; AutoHotkey script to map CapsLock to Escape if tapped and to Ctrl if held down

; Set CapsLock to act as Ctrl when held down
CapsLock::Ctrl

; Map CapsLock to Escape if tapped
CapsLock Up::
    KeyWait, CapsLock
    if (A_TimeSincePriorHotkey < 100) ; Adjust the time (in milliseconds) as needed for the tap duration
    {
    	Send {Ctrl Up}
        Send {Esc}
    }
    else
    {
        Send {Ctrl Down}
        Sleep 50 ; Adjust the duration of holding CapsLock before releasing it as Ctrl
        Send {Ctrl Up}
    }
return

~LShift & RShift::CapsLock
~RShift & LShift::CapsLock
;---------------------------END-------------------------------------------

;---sends ESC if nothing else is pressed no matter how long you wait ------
;CTRL+V quickly does not send escape, nor if it is doubled, BUT, ESC is sent
;if you do another CTRL key, such as CTRL+V -> release -> CTRL+I
; Caps lock to esc if pressed briefly, ctrl if held
;*CapsLock::
;    cDown := A_TickCount
;    Send {Blind}{Ctrl Down}
;    KeyWait, CapsLock, T0.15 ; Wait for CapsLock release or a short timeout
;    if ErrorLevel = 0
;    {
;        ; CapsLock was released quickly
;        Send {Blind}{Ctrl Up}{Esc}
;        return
;    }
;return
;
;*CapsLock up::
;    Send {Blind}{Ctrl Up}
;return

; ---------------- Doesn't send Esc no matter what ---------------------------------
; Caps lock to esc if pressed briefly and not held, ctrl if held
;*CapsLock::
;    cDown := A_TickCount
;    Send {Blind}{Ctrl Down}
;    KeyWait, CapsLock, T0.15 ; Wait for CapsLock release or a short timeout
;    if ErrorLevel = 0
;    {
;        ; CapsLock released quickly, check for no other key pressed
;        if (A_PriorKey = "")
;        {
;            Send {Blind}{Ctrl Up}{Esc}
;            return
;        }
;    }
;return
;
;*CapsLock up::
;    Send {Blind}{Ctrl Up}
;return
;----------------------------END----------------------------------------
