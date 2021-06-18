; --------------------------------------------- 
; CODES CYCLOPS.INI - MEMORY - NUMBERS 
; --------------------------------------------- 

save_memory(v_index, v_type)
{   
    v_memo_text := private_get_memory(v_index, v_type)

    if (v_type = "T") ; TEXT
    {
        InputBox, v_text, Save Text, Typist the text to save in Cyclops[%v_index%],,,,,,,, %v_memo_text%
        if ErrorLevel 
            Return
        StringLen v_size, v_text
        if (v_size > 0)
            IniWrite, %v_text%, %A_ScriptDir%\Cyclops.ini, Memory, Memo%v_index%
    }    

    if (v_type = "E") ; EXECUTE
    {
        InputBox, v_path, Save Path, Typist the File Path or URL to save in Cyclops[%v_index%],,,,,,,, %v_memo_text%
        if ErrorLevel 
            Return
        StringLen tam, v_path
        if (tam > 0)
            IniWrite, %v_path%, %A_ScriptDir%\Cyclops.ini, Memory, EXEMemo%v_index%
    }

    if (v_type = "W") ; WINDOW
    {
        InputBox, v_window_caption, Save Window Caption, Typist the part of Window Caption to save in Cyclops[%v_index%],,,,,,,, %v_memo_text%
        if ErrorLevel 
            Return
		
		IniWrite, %v_window_caption%, %A_ScriptDir%\Cyclops.ini, Memory, WindowMemo%v_index%
    }    

}

load_memory(v_index, v_type)
{

    if (v_type = "T") ; TEXT
    {    
        IniRead, v_text, %A_ScriptDir%\Cyclops.ini, Memory, Memo%v_index%
        if v_text = Error
            Return

        v_text := Adjust_Text(v_text)
        StringLen v_size, v_text

        if (v_size > 0) 
        {
            ; HideTrayTip()
            ; TrayTip, Cyclops - Type, Typing a Text, , 16
            Send, %v_text%    
        }
    }

    if (v_type = "E") ; EXECUTE
    {
        IniRead, v_file_path, %A_ScriptDir%\Cyclops.ini, Memory, EXEMemo%v_index%
        if v_file_path = Error 
            Return

        HideTrayTip()
        TrayTip, Cyclops - Execute, %v_file_path%, , 16

        Run, %v_file_path%        
    }

    if (v_type = "W") ; WINDOW
    {
        IniRead, v_window_caption, %A_ScriptDir%\Cyclops.ini, Memory, WindowMemo%v_index%
        if v_window_caption = Error 
            Return

        SetTitleMatchMode, 2
        SetTitleMatchMode, slow
        WinActivate, %v_window_caption%
        ;Sleep, 100
        ;WinGetActiveTitle, v_win_caption

        ; HideTrayTip()
        ; TrayTip, Cyclops - Activate, %v_window_caption%, , 16
    }    
}

private_get_memory(v_index, v_type)
{

    if (v_type = "T") ; TEXT
    {    
        IniRead, sText, %A_ScriptDir%\Cyclops.ini, Memory, Memo%v_index%
        if sText = Error
            Return
        sText := Adjust_Text(sText)
        StringLen tam, sText
        if (tam > 0)
            Return %sText%    
    }

    if (v_type = "E") ; EXECUTE
    {
        IniRead, v_file_exec, %A_ScriptDir%\Cyclops.ini, Memory, EXEMemo%v_index%
        if v_file_exec = Error 
            Return
        Return, %v_file_exec%        
    }

    if (v_type = "W") ; WINDOW
    {
        IniRead, v_window_name, %A_ScriptDir%\Cyclops.ini, Memory, WindowMemo%v_index%
        if v_window_name = Error 
            Return
        Return, %v_window_name%        
    }    
}

^#!i::
    ; Input Key
    ;----------------
    InputBox, v_key, Key of Text, Typist the text to save in Cyclops[key]
    if ErrorLevel 
        Return
    v_key := Trim(v_key)
    StringUpper, v_key, v_key
    StringLen v_size, v_key
    if (v_size <= 0)
    {
        MsgBox, Invalid Key
        Return
    }

    ; Input Text
    ;----------------
    InputBox, v_text, Text, 
    (
        Typist the text to save in Cyclops

        Key: "%v_key%"
    )
    if ErrorLevel 
        Return
    StringLen v_size_text, v_text
    if (v_size_text > 0)
        IniWrite, %v_text%, %A_ScriptDir%\Cyclops.ini, Memory, %v_key%

Return

^#!o::
    ; Input Key
    ;----------------
    InputBox, v_key, Key of Text, Typist the text to save in Cyclops[key]
    if ErrorLevel 
        Return
    v_key := Trim(v_key)
    StringUpper, v_key, v_key
    StringLen v_size, v_key
    if (v_size <= 0)
    {
        MsgBox, Invalid Key
        Return
    }

    ; Write value
    ;----------------
    IniRead, v_text, %A_ScriptDir%\Cyclops.ini, Memory, %v_key%
    if v_text = Error
        Return

    v_text := Adjust_Text(v_text)
    StringLen v_size, v_text

    if (v_size > 0) 
        Send, %v_text%

Return


; ----------------------
; -- SHOTCUTS -- TEXT
; ----------------------

!#1::
    save_memory("1", "T")
Return

!+1::
    load_memory("1", "T")
Return

!#2::
    save_memory("2", "T")
Return

!+2::
    load_memory("2", "T")
Return

!#3::
    save_memory("3", "T")
Return

!+3::
    load_memory("3", "T")
Return

!#4::
    save_memory("4", "T")
Return

!+4::
    load_memory("4", "T")
Return

!#5::
    save_memory("5", "T")
Return

!+5::
    load_memory("5", "T")
Return

!#6::
    save_memory("6", "T")
Return

!+6::
    load_memory("6", "T")
Return

!#7::
    save_memory("7", "T")
Return

!+7::
    load_memory("7", "T")
Return

!#8::
    save_memory("8", "T")
Return

!+8::
    load_memory("8", "T")
Return

!#9::
    save_memory("9", "T")
Return

!+9::
    load_memory("9", "T")
Return

!#0::
    save_memory("0", "T")
Return

!+0::
    load_memory("0", "T")
Return

; ----------------------------------
; -- SHOTCUTS -- TEXT -- LETTERS
; ----------------------------------

!#a::
    save_memory("A", "T")
Return

!+a::
    load_memory("A", "T")
Return

!#b::
    save_memory("B", "T")
Return

!+b::
    load_memory("B", "T")
Return

!#c::
    save_memory("C", "T")
Return

!+c::
    load_memory("C", "T")
Return

!#d::
    save_memory("D", "T")
Return

!+d::
    load_memory("D", "T")
Return

!#e::
    save_memory("E", "T")
Return

!+e::
    load_memory("E", "T")
Return

!#f::
    save_memory("F", "T")
Return

!+f::
    load_memory("F", "T")
Return

!#g::
    save_memory("G", "T")
Return

!+g::
    load_memory("G", "T")
Return

!#h::
    save_memory("H", "T")
Return

!+h::
    load_memory("H", "T")
Return

!#i::
    save_memory("I", "T")
Return

!+i::
    load_memory("I", "T")
Return

!#j::
    save_memory("J", "T")
Return

!+j::
    load_memory("J", "T")
Return

!#k::
    save_memory("K", "T")
Return

!+k::
    load_memory("K", "T")
Return

!#l::
    save_memory("L", "T")
Return

!+l::
    load_memory("L", "T")
Return

!#m::
    save_memory("M", "T")
Return

!+m::
    load_memory("M", "T")
Return

!#n::
    save_memory("N", "T")
Return

!+n::
    load_memory("N", "T")
Return

!#o::
    save_memory("O", "T")
Return

!+o::
    load_memory("O", "T")
Return

!#p::
    save_memory("P", "T")
Return

!+p::
    load_memory("P", "T")
Return

!#q::
    save_memory("Q", "T")
Return

!+q::
    load_memory("Q", "T")
Return

!#r::
    save_memory("R", "T")
Return

!+r::
    load_memory("R", "T")
Return

!#s::
    save_memory("S", "T")
Return

!+s::
    load_memory("S", "T")
Return

!#t::
    save_memory("T", "T")
Return

!+t::
    load_memory("T", "T")
Return

!#u::
    save_memory("U", "T")
Return

!+u::
    load_memory("U", "T")
Return

!#v::
    save_memory("V", "T")
Return

!+v::
    load_memory("V", "T")
Return

!#w::
    save_memory("W", "T")
Return

!+w::
    load_memory("W", "T")
Return

!#x::
    save_memory("X", "T")
Return

!+x::
    load_memory("X", "T")
Return

!#y::
    save_memory("Y", "T")
Return

!+y::
    load_memory("Y", "T")
Return

!#z::
    save_memory("Z", "T")
Return

!+z::
    load_memory("Z", "T")
Return

!#ç::
    save_memory("Ç", "T")
Return

!+ç::
    load_memory("Ç", "T")
Return


; -----------------------------------
; -- SHOTCUTS -- EXECUTE -- NUMBERS
; -----------------------------------

^#1::
    save_memory("1", "E")
Return

#+1::
    load_memory("1", "E")
Return

^#2::
    save_memory("2", "E")
Return

#+2::
    load_memory("2", "E")
Return

^#3::
    save_memory("3", "E")
Return

#+3::
    load_memory("3", "E")
Return

^#4::
    save_memory("4", "E")
Return

#+4::
    load_memory("4", "E")
Return

^#5::
    save_memory("5", "E")
Return

#+5::
    load_memory("5", "E")
Return

^#6::
    save_memory("6", "E")
Return

#+6::
    load_memory("6", "E")
Return

^#7::
    save_memory("7", "E")
Return

#+7::
    load_memory("7", "E")
Return

^#8::
    save_memory("8", "E")
Return

#+8::
    load_memory("8", "E")
Return

^#9::
    save_memory("9", "E")
Return

#+9::
    load_memory("9", "E")
Return

^#0::
    save_memory("0", "E")
Return

#+0::
    load_memory("0", "E")
Return

; -----------------------------------
; -- SHOTCUTS -- EXECUTE -- LETTERS
; -----------------------------------


^#a::
    save_memory("A", "E")
Return

#+a::
    load_memory("A", "E")
Return

^#b::
    save_memory("B", "E")
Return

#+b::
    load_memory("B", "E")
Return

^#c::
    save_memory("C", "E")
Return

#+c::
    load_memory("C", "E")
Return

^#d::
    save_memory("D", "E")
Return

#+d::
    load_memory("D", "E")
Return

^#e::
    save_memory("E", "E")
Return

#+e::
    load_memory("E", "E")
Return

^#f::
    save_memory("F", "E")
Return

#+f::
    load_memory("F", "E")
Return

^#g::
    save_memory("G", "E")
Return

#+g::
    load_memory("G", "E")
Return

^#h::
    save_memory("H", "E")
Return

#+h::
    load_memory("H", "E")
Return

^#i::
    save_memory("I", "E")
Return

#+i::
    load_memory("I", "E")
Return

^#j::
    save_memory("J", "E")
Return

#+j::
    load_memory("J", "E")
Return

^#k::
    save_memory("K", "E")
Return

#+k::
    load_memory("K", "E")
Return

^#l::
    save_memory("L", "E")
Return

#+l::
    load_memory("L", "E")
Return

^#m::
    save_memory("M", "E")
Return

#+m::
    load_memory("M", "E")
Return

^#n::
    save_memory("N", "E")
Return

#+n::
    load_memory("N", "E")
Return

^#o::
    save_memory("O", "E")
Return

#+o::
    load_memory("O", "E")
Return

^#p::
    save_memory("P", "E")
Return

#+p::
    load_memory("P", "E")
Return

^#q::
    save_memory("Q", "E")
Return

#+q::
    load_memory("Q", "E")
Return

^#r::
    save_memory("R", "E")
Return

#+r::
    load_memory("R", "E")
Return

^#s::
    save_memory("S", "E")
Return

#+s::
    load_memory("S", "E")
Return

^#t::
    save_memory("T", "E")
Return

#+t::
    load_memory("T", "E")
Return

^#u::
    save_memory("U", "E")
Return

#+u::
    load_memory("U", "E")
Return

^#v::
    save_memory("V", "E")
Return

#+v::
    load_memory("V", "E")
Return

^#w::
    save_memory("W", "E")
Return

#+w::
    load_memory("W", "E")
Return

^#x::
    save_memory("X", "E")
Return

#+x::
    load_memory("X", "E")
Return

^#y::
    save_memory("Y", "E")
Return

#+y::
    load_memory("Y", "E")
Return

^#z::
    save_memory("Z", "E")
Return

#+z::
    load_memory("Z", "E")
Return

^#ç::
    save_memory("Ç", "E")
Return

#+ç::
    load_memory("Ç", "E")
Return


; ------------------------------------------
; -- SHOTCUTS -- WINDOW ACTIVATE -- NUMPAD
; ------------------------------------------

#!Numpad1::
    save_memory("1", "W")
Return

^#Numpad1::
    load_memory("1", "W")
Return

#!Numpad2::
    save_memory("2", "W")
Return

^#Numpad2::
    load_memory("2", "W")
Return

#!Numpad3::
    save_memory("3", "W")
Return

^#Numpad3::
    load_memory("3", "W")
Return

#!Numpad4::
    save_memory("4", "W")
Return

^#Numpad4::
    load_memory("4", "W")
Return

#!Numpad5::
    save_memory("5", "W")
Return

^#Numpad5::
    load_memory("5", "W")
Return

#!Numpad6::
    save_memory("6", "W")
Return

^#Numpad6::
    load_memory("6", "W")
Return

#!Numpad7::
    save_memory("7", "W")
Return

^#Numpad7::
    load_memory("7", "W")
Return

#!Numpad8::
    save_memory("8", "W")
Return

^#Numpad8::
    load_memory("8", "W")
Return

#!Numpad9::
    save_memory("9", "W")
Return

^#Numpad9::
    load_memory("9", "W")
Return

#!Numpad0::
    save_memory("0", "W")
Return

^#Numpad0::
    load_memory("0", "W")
Return