#Requires AutoHotkey v2.0+
; -----------------------------------------------------------------------------
; CYCLOPS MEMORY & DYNAMIC HOTKEY ENGINE (AutoHotkey v2)
; SOLID, DRY, and KISS compliant dynamic hotkey registration
; -----------------------------------------------------------------------------

save_memory(v_index, v_type)
{
    v_ini := A_ScriptDir . "\Cyclops.ini"
    v_memo_text := private_get_memory(v_index, v_type)

    if (v_type = "T") ; TEXT
    {
        ib := InputBox("Typist the text to save in Cyclops[" . v_index . "]", "Save Text", "w400 h130", v_memo_text)
        if (ib.Result = "OK" && StrLen(ib.Value) > 0)
            IniWrite(ib.Value, v_ini, "Memory", "Memo" . v_index)
    }

    if (v_type = "E") ; EXECUTE
    {
        ib := InputBox("Typist the File Path or URL to save in Cyclops[" . v_index . "]", "Save Path", "w400 h130", v_memo_text)
        if (ib.Result = "OK" && StrLen(ib.Value) > 0)
            IniWrite(ib.Value, v_ini, "Memory", "EXEMemo" . v_index)
    }

    if (v_type = "W") ; WINDOW
    {
        ib := InputBox("Typist the part of Window Caption to save in Cyclops[" . v_index . "]", "Save Window Caption", "w400 h130", v_memo_text)
        if (ib.Result = "OK" && StrLen(ib.Value) > 0)
            IniWrite(ib.Value, v_ini, "Memory", "WindowMemo" . v_index)
    }
}

load_memory(v_index, v_type)
{
    v_ini := A_ScriptDir . "\Cyclops.ini"

    if (v_type = "T") ; TEXT
    {
        v_text := IniRead(v_ini, "Memory", "Memo" . v_index, "")
        if (v_text != "" && v_text != "Error")
        {
            v_text := Adjust_Text(v_text)
            Send(v_text)
        }
    }

    if (v_type = "E") ; EXECUTE
    {
        v_path := IniRead(v_ini, "Memory", "EXEMemo" . v_index, "")
        if (v_path != "" && v_path != "Error")
            Run(v_path)
    }

    if (v_type = "W") ; WINDOW
    {
        v_caption := IniRead(v_ini, "Memory", "WindowMemo" . v_index, "")
        if (v_caption != "" && v_caption != "Error")
        {
            if WinExist(v_caption)
                WinActivate(v_caption)
        }
    }
}

private_get_memory(v_index, v_type)
{
    v_ini := A_ScriptDir . "\Cyclops.ini"
    v_text := ""

    if (v_type = "T")
        v_text := IniRead(v_ini, "Memory", "Memo" . v_index, "")

    if (v_type = "E")
        v_text := IniRead(v_ini, "Memory", "EXEMemo" . v_index, "")

    if (v_type = "W")
        v_text := IniRead(v_ini, "Memory", "WindowMemo" . v_index, "")

    return (v_text = "Error") ? "" : v_text
}

; -----------------------------------------------------------------------------
; CUSTOM KEY MEMORY (Ctrl+Alt+Win+M to save, Ctrl+Alt+Shift+M to load)
; -----------------------------------------------------------------------------

^!#m::
{
    ib_key := InputBox("Typist the Key Name:", "Save Text with Key", "w350 h130")
    if (ib_key.Result != "OK" || StrLen(ib_key.Value) = 0)
        return

    v_key := ib_key.Value
    v_memo_text := private_get_memory(v_key, "T")

    ib_val := InputBox("Typist the text to save for key [" . v_key . "]:", "Save Text", "w400 h130", v_memo_text)
    if (ib_val.Result = "OK" && StrLen(ib_val.Value) > 0)
        IniWrite(ib_val.Value, A_ScriptDir . "\Cyclops.ini", "Memory", "Memo" . v_key)
}

^!+m::
{
    ib_key := InputBox("Typist the Key Name to type:", "Type Text with Key", "w350 h130")
    if (ib_key.Result = "OK" && StrLen(ib_key.Value) > 0)
        load_memory(ib_key.Value, "T")
}

; -----------------------------------------------------------------------------
; DYNAMIC HOTKEY REGISTRATION (DRY)
; Binds all alphanumeric keys [a-z, 0-9] and Numpad [0-9]
; -----------------------------------------------------------------------------

Register_Memory_Hotkeys()
{
    ; Letters a-z
    loop 26
    {
        k := Chr(96 + A_Index) ; 97 = a ... 122 = z
        bind_alphanumeric_key(k)
    }

    ; Numbers 0-9
    loop 10
    {
        k := String(A_Index - 1)
        bind_alphanumeric_key(k)
    }

    ; Numpad keys 0-9 for Window Switcher
    loop 10
    {
        n := String(A_Index - 1)
        bind_numpad_window_key(n)
    }
}

bind_alphanumeric_key(key)
{
    ; Alt + Win + <Key> -> Save Text
    Hotkey("!#" . key, (*) => save_memory(key, "T"))

    ; Alt + Shift + <Key> -> Type Text
    Hotkey("!+" . key, (*) => load_memory(key, "T"))

    ; Ctrl + Win + <Key> -> Save Executable / URL
    Hotkey("^#" . key, (*) => save_memory(key, "E"))

    ; Ctrl + Shift + <Key> -> Launch Executable / URL
    Hotkey("^+" . key, (*) => load_memory(key, "E"))
}

bind_numpad_window_key(num)
{
    ; Alt + Win + Numpad<N> -> Save Window Caption
    Hotkey("!#Numpad" . num, (*) => save_memory(num, "W"))

    ; Ctrl + Win + Numpad<N> -> Activate Window
    Hotkey("^#Numpad" . num, (*) => load_memory(num, "W"))
}

; Execute dynamic registrations on module include
Register_Memory_Hotkeys()
