;------------------------
; FUNCTIONS
;------------------------

^#!r::
    MsgBox, 4, , Deseja reiniciar o Cyclops?, 5
    IfMsgBox, No
        Return
    IfMsgBox, Timeout
        Return
    Gosub, restart_cyclops_sub
Return

restart_cyclops_sub:
    Reload
Return

Adjust_Text(sText)
{
    ; StringReplace, sText, sText, {, {{}, All ; x
    ; StringReplace, sText, sText, }, {}}, All ; x
    StringReplace, sText, sText, !, {!}, All
    StringReplace, sText, sText, +, {+}, All
    StringReplace, sText, sText, #, {#}, All
    StringReplace, sText, sText, ^, {^}, All
    StringReplace, sText, sText, ?, {?}, All
    StringReplace, sText, sText, @, {@}, All
    ; StringReplace, sText, sText, %%, {%}, All
    ; StringReplace, sText, sText, , {;}, All
    Return sText
}

; Copy this function into your script to use it.
HideTrayTip() {
    TrayTip  ; Attempt to hide it the normal way.
    if SubStr(A_OSVersion,1,3) = "10." {
        Menu Tray, NoIcon
        Sleep 50  ; It may be necessary to adjust this sleep.
        Menu Tray, Icon
    }
}