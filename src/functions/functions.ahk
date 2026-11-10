#Requires AutoHotkey v2.0+
;------------------------
; FUNCTIONS
;------------------------

^#!r::
{
    result := MsgBox("Deseja reiniciar o Cyclops?", "Cyclops", "YesNo 4096")
    if (result = "Yes")
        Reload()
}

Adjust_Text(sText)
{
    sText := StrReplace(sText, "!", "{!}")
    sText := StrReplace(sText, "+", "{+}")
    sText := StrReplace(sText, "#", "{#}")
    sText := StrReplace(sText, "^", "{^}")
    sText := StrReplace(sText, "?", "{?}")
    sText := StrReplace(sText, "@", "{@}")
    return sText
}

HideTrayTip()
{
    TrayTip()
}
