
;------------------------
; FUNÇÕES DO SISTEMA
;------------------------

; Informacoes do sistema
; ^#!i::
;     if (A_Is64bitOS = 1)
;         Sistema := "64 bits"
;     else
;         Sistema := "32 bits"    
    
;     Msgbox, 
; (
; PC Name: %A_ComputerName%

; System: %A_OSVersion%
; Type: %Sistema%

; User: %A_UserName%

; IP: %A_IPAddress1%
; )
; Return

;------------------------
; DEFAULT APPS
;------------------------

; Bloco de Notas / Notepad
^!numpad1::
    TrayTip Notepad, Opening Notepad
    run, notepad.exe
Return

; Bloco de Notas / Notepad
^!1::
    TrayTip Notepad, Opening Notepad
    run, notepad.exe
Return

; Calculadora / Calculator
^!numpad2::
    TrayTip Calculator, Opening Calculator
    run, calc.exe
Return

; Calculadora / Calculator
^!2::
    TrayTip Calculator, Opening Calculator
    run, calc.exe
Return

;------------------------
; Shut Down / Reboot
;------------------------

;Logoff 		0
;Shutdown 		1
;Reboot 		2
;Force 			4
;Power down 	8

;------------
; SHUTDOWN 
;------------
^#!numpad0::
    MsgBox, 4, , Do you want to turn off your pc now?, 5
    IfMsgBox, No
        Return
    IfMsgBox, Timeout
        Return

    Gosub, close_all_windows_sub

    Sleep, 1000
    TrayTip Shut Down, Your PC is shutting down., 3000
	Shutdown, 1
Return

^#!0::
    MsgBox, 4, , Do you want to turn off your pc now?, 5
    IfMsgBox, No
        Return
    IfMsgBox, Timeout
        Return

    Gosub, close_all_windows_sub

    Sleep, 1000
    TrayTip Shut Down, Your PC is shutting down., 3000
	Shutdown, 1
Return



;----------------------
; REINICIAR / REBOOT
;----------------------

^#!numpad8::
    MsgBox, 4, , Do you want to reboot your pc now?, 5
    IfMsgBox, No
        Return
    IfMsgBox, Timeout
        Return

    TrayTip Reiniciar, Your PC is restarting., 3000
	Shutdown, 2
Return

^#!8::
    MsgBox, 4, , Do you want to reboot your pc now?, 5
    IfMsgBox, No
        Return
    IfMsgBox, Timeout
        Return

    TrayTip Reiniciar, Your PC is restarting., 3000
	Shutdown, 2
Return



;------------------------
; HIBERNAR / HIBERNATE 
;------------------------

^#!numpad5::
    MsgBox, 4, , Do you want to hibernate your pc now?, 5
    IfMsgBox, No
        Return
    IfMsgBox, Timeout
        Return

    TrayTip Hibernar, Your PC is going into hibernation mode., 3000
    Sleep, 3000
    DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 0)
Return

^#!5::
    MsgBox, 4, , Do you want to hibernate your PC now?, 5
    IfMsgBox, No
        Return
    IfMsgBox, Timeout
        Return

    TrayTip Hibernar, Your PC is going into hibernation mode., 3000
    Sleep, 3000
    DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 0)
Return



; --------------------------------------------------------
; Ativar todas as janelas abertas / Activate all windows
; --------------------------------------------------------

^#+w::
    Gosub, activate_all_windows_sub
Return

activate_all_windows_sub:
    
    WinGet windows, List
    WinGetActiveTitle, atual
    Loop %windows%
    {
        id := windows%A_Index%
        WinGetTitle wt, ahk_id %id%
        WinActivate, %wt%
        Sleep, 50
    }

    WinActivate, %atual%
    ; Gosub, win_show_sub

Return

; --------------------------------------------- 
; Fechar todas as janelas / Close all windows
; --------------------------------------------- 

^#+c::
    MsgBox, 4, , Do you want to close all open windows?, 5
    IfMsgBox, No
        Return
    IfMsgBox, Timeout
        Return

    Gosub, close_all_windows_sub
Return

close_all_windows_sub:

    WinGet windows, List
    WinGetActiveTitle, atual
    Loop %windows%
    {
        id := windows%A_Index%
        WinGetTitle wt, ahk_id %id%
        if (wt <> atual)
        {
            WinClose, %wt%
        }
        Sleep, 50
    }

    WinClose, %atual%
    ; Gosub, win_show_sub

Return

win_show_sub:
    
    Gui,Add,ListBox,vWinList w900 r50 h400,Wait..
    Gui,Show
    GoTo WinList

    WinList:
        WinGet,WinList,List,,,Program Manager
        List=
        loop, %WinList%
        {
            Current:=WinList%A_Index%
            WinGetTitle,WinTitle,ahk_id %Current%
            If WinTitle AND !InStr(List,WinTitle)
                List.="`n" WinTitle
        }
        
        GuiControl,+HScroll,WinList
        Gui +Delimiter`n
        GuiControl,,WinList,%List%
    Return

    GuiClose:
        Return

Return


; Copia Nome atual da janela / Copy Window Caption
^+#n::

    WinGetActiveTitle, v_win_caption
    HideTrayTip()
    TrayTip, Cyclops - Copy Window Name, %v_win_caption%
    Clipboard := v_win_caption
    
Return