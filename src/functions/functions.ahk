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

AjustarTexto(sText)
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
