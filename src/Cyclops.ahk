#Requires AutoHotkey v2.0+
#SingleInstance Force

SendMode "Input"
SetWorkingDir A_MyDocuments

ProductName      := "Cyclops"
ProductVersion   := "0.2.1"
ProductPublisher := "Angelo Rafael"
ProductWebsite   := "https://github.com/angelorpt/cyclops"
autoComplete     := 0

TrayTip "Your windows manager is activated!", "Cyclops"

; Setup System Tray Menu
Init_Tray_Menu()

#Include "%A_ScriptDir%\functions\functions.ahk"
#Include "%A_ScriptDir%\functions\functions_system.ahk"
#Include "%A_ScriptDir%\functions\memory.ahk"
#Include "%A_ScriptDir%\functions\help_gui.ahk"
#Include "%A_ScriptDir%\functions\settings_gui.ahk"

; -----------------------------------------------------------------------------
; MASTER PAUSE & SUSPEND CONTROL
; Allows users to suspend all Cyclops hotkeys to avoid external application conflicts.
; -----------------------------------------------------------------------------

global isSuspended := false

Init_Tray_Menu()
{
    A_TrayMenu.Delete() ; Reset default menu
    A_TrayMenu.Add("📖 Guia de Atalhos...", (*) => Show_Help_Gui())
    A_TrayMenu.Add("⚙ Configurações...", (*) => Show_Settings_Gui())
    A_TrayMenu.Add() ; Separator
    A_TrayMenu.Add("⏸ Pausar Atalhos", Toggle_Pause)
    A_TrayMenu.Add("🔄 Reiniciar Cyclops", (*) => Reload())
    A_TrayMenu.Add() ; Separator
    A_TrayMenu.Add("❌ Sair", (*) => ExitApp())
}

; Master pause hotkey (exempt from suspension)
Hotkey("^!#p", Toggle_Pause, "S")

Toggle_Pause(*)
{
    global isSuspended
    isSuspended := !isSuspended
    Suspend(isSuspended ? 1 : 0)

    if (isSuspended)
    {
        A_TrayMenu.Rename("⏸ Pausar Atalhos", "▶ Retomar Atalhos (Pausado)")
        TrayTip "Atalhos suspensos! Pressione Ctrl+Alt+Win+P para reativar.", "Cyclops Pausado", 4096
    }
    else
    {
        A_TrayMenu.Rename("▶ Retomar Atalhos (Pausado)", "⏸ Pausar Atalhos")
        TrayTip "Atalhos reativados!", "Cyclops Ativo", 4096
    }
}
