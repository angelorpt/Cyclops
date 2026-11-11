#Requires AutoHotkey v2.0+
;------------------------
; FUNCTIONS & OUTPUT ENGINE
;------------------------

^#!r::
{
    result := MsgBox("Deseja reiniciar o Cyclops?", "Cyclops", "YesNo 4096")
    if (result = "Yes")
        Reload()
}

; High-fidelity output engine with modifier stabilization
Output_Text(v_text)
{
    if (v_text == "")
        return

    ; 1. Wait for physical modifier keys to be released
    KeyWait "Alt"
    KeyWait "Shift"
    KeyWait "Ctrl"
    KeyWait "LWin"
    KeyWait "RWin"

    v_ini := A_ScriptDir . "\Cyclops.ini"
    textMode := IniRead(v_ini, "Settings", "TextMode", "clipboard")

    if (textMode = "clipboard")
    {
        ; Atomic clipboard paste with clean backup and restore
        clipSaved := ClipboardAll()
        A_Clipboard := v_text
        Sleep 20
        Send "^v"
        Sleep 50
        A_Clipboard := clipSaved
    }
    else
    {
        ; Simulated keystrokes with delay for environments without Ctrl+V
        delay := Integer(IniRead(v_ini, "Settings", "KeyDelay", "10"))
        SetKeyDelay delay, delay
        SendEvent "{Text}" . v_text
    }
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
