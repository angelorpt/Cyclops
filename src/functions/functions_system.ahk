
;------------------------
; FUNÇÕES DO SISTEMA
;------------------------

; Informacoes do sistema
^#!i::
    if (A_Is64bitOS = 1)
        Sistema := "64 bits"
    else
        Sistema := "32 bits"    
    
    Msgbox, 
(
PC Name: %A_ComputerName%

System: %A_OSVersion%
Type: %Sistema%

User: %A_UserName%

IP: %A_IPAddress1%
)
Return

; Bloco de Notas / Notepad
^!numpad1::
    TrayTip Bloco de Notas, Abrindo bloco de notas
    run, notepad.exe
Return

; Bloco de Notas / Notepad
^!1::
    TrayTip Bloco de Notas, Abrindo bloco de notas
    run, notepad.exe
Return

; Calculadora / Calc
^!numpad2::
    TrayTip Calculadora, Abrindo calculadora
    run, calc.exe
Return

; Calculadora / Calc
^!2::
    TrayTip Calculadora, Abrindo calculadora
    run, calc.exe
Return

;------------------------
; Desligar / Reiniciar
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
    MsgBox, 4, , Deseja desligar o computador agora?, 5
    IfMsgBox, No
        Return
    IfMsgBox, Timeout
        Return

    Gosub, close_all_windows_sub

    TrayTip Desligar, O Sistema Operacional será desligado., 3000
	Shutdown, 1
Return

^#!0::
    MsgBox, 4, , Deseja desligar o computador agora?, 5
    IfMsgBox, No
        Return
    IfMsgBox, Timeout
        Return

    Gosub, close_all_windows_sub

    TrayTip Desligar, O Sistema Operacional será desligado., 3000
	Shutdown, 1
Return



;------------
; RESTART 
;------------
^#!numpad8::
    MsgBox, 4, , Deseja reiniciar o computador agora?, 5
    IfMsgBox, No
        Return
    IfMsgBox, Timeout
        Return

    TrayTip Reiniciar, O Sistema Operacional será reiniciado., 3000
	Shutdown, 2
Return

^#!8::
    MsgBox, 4, , Deseja reiniciar o computador agora?, 5
    IfMsgBox, No
        Return
    IfMsgBox, Timeout
        Return

    TrayTip Reiniciar, O Sistema Operacional será reiniciado., 3000
	Shutdown, 2
Return



;------------
; HIBERNATE 
;------------
^#!numpad5::
    MsgBox, 4, , Deseja hibernar o computador agora?, 5
    IfMsgBox, No
        Return
    IfMsgBox, Timeout
        Return

    TrayTip Hibernar, O Sistema Operacional entrará em modo de hibernação., 3000
    Sleep, 3000
    DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 0)
Return

^#!5::
    MsgBox, 4, , Deseja hibernar o computador agora?, 5
    IfMsgBox, No
        Return
    IfMsgBox, Timeout
        Return

    TrayTip Hibernar, O Sistema Operacional entrará em modo de hibernação., 3000
    Sleep, 3000
    DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 0)
Return



; --------------------------------------------- 
; Ativar todas as janelas abertas 
; --------------------------------------------- 

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
; Fechar todas as janelas 
; --------------------------------------------- 

^#+c::
    MsgBox, 4, , Deseja fechar todas a janelas do windows abertas?, 5
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