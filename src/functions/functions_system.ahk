#Requires AutoHotkey v2.0+
; -----------------------------------------------------------------------------
; CYCLOPS SYSTEM APPLICATIONS & SHORTCUTS (AutoHotkey v2)
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
; DEFAULT APPS
; -----------------------------------------------------------------------------

; Notepad / Bloco de Notas (Ctrl + Alt + 1 or Ctrl + Alt + Numpad 1)
^!numpad1::
^!1::
{
    TrayTip "Opening Notepad", "Notepad"
    Run "notepad.exe"
}

; Calculator / Calculadora (Ctrl + Alt + 2 or Ctrl + Alt + Numpad 2)
^!numpad2::
^!2::
{
    TrayTip "Opening Calculator", "Calculator"
    Run "calc.exe"
}
