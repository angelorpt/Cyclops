#Requires AutoHotkey v2.0+
; -----------------------------------------------------------------------------
; CYCLOPS SETTINGS GUI & TRAY MENU (AutoHotkey v2)
; -----------------------------------------------------------------------------

^!#s::Show_Settings_Gui()

Show_Settings_Gui(*)
{
    static settingsGui := ""
    if (settingsGui != "")
    {
        settingsGui.Show()
        return
    }

    v_ini := A_ScriptDir . "\Cyclops.ini"
    currentMode := IniRead(v_ini, "Settings", "TextMode", "clipboard")
    currentDelay := IniRead(v_ini, "Settings", "KeyDelay", "10")

    settingsGui := Gui("+AlwaysOnTop", "Cyclops - Configurações")
    settingsGui.SetFont("s10", "Segoe UI")

    settingsGui.Add("GroupBox", "w360 h110", "Modo de Inserção de Texto")
    rClip := settingsGui.Add("Radio", "xp+15 yp+25 " . (currentMode = "clipboard" ? "Checked" : ""), "Área de Transferência (Clipboard)")
    settingsGui.Add("Text", "cGray xp+20 yp+20", "Rápido, ideal para IDEs, navegadores e e-mails.")

    rKey := settingsGui.Add("Radio", "xp-20 yp+25 " . (currentMode = "keystroke" ? "Checked" : ""), "Digitação Simulada (Keystrokes)")
    settingsGui.Add("Text", "cGray xp+20 yp+20", "Útil para campos que bloqueiam 'Ctrl + V'.")

    settingsGui.Add("GroupBox", "x15 yp+35 w360 h75", "Atraso de Digitação (Modo Keystrokes)")
    settingsGui.Add("Text", "xp+15 yp+30", "Delay por tecla (ms):")
    eDelay := settingsGui.Add("Edit", "x+10 yp-3 w60 Number", currentDelay)

    btnSave := settingsGui.Add("Button", "x170 yp+55 w100 Default", "Salvar")
    btnCancel := settingsGui.Add("Button", "x+10 yp w95", "Cancelar")

    btnSave.OnEvent("Click", (*) => SaveSettings(settingsGui, rClip, eDelay))
    btnCancel.OnEvent("Click", (*) => settingsGui.Hide())
    settingsGui.OnEvent("Close", (*) => settingsGui.Hide())

    settingsGui.Show("w390 h260")
}

SaveSettings(guiObj, rClip, eDelay)
{
    v_ini := A_ScriptDir . "\Cyclops.ini"
    newMode := rClip.Value ? "clipboard" : "keystroke"
    newDelay := Trim(eDelay.Value) = "" ? "10" : eDelay.Value

    IniWrite(newMode, v_ini, "Settings", "TextMode")
    IniWrite(newDelay, v_ini, "Settings", "KeyDelay")

    TrayTip "Configurações salvas com sucesso!", "Cyclops"
    guiObj.Hide()
}

; Setup tray menu integration
Setup_Tray_Menu()
{
    A_TrayMenu.Delete()
    A_TrayMenu.Add("📖 Guia de Atalhos...", (*) => Show_Help_Gui())
    A_TrayMenu.Add("⚙️ Configurações...", (*) => Show_Settings_Gui())
    A_TrayMenu.Add()
    A_TrayMenu.Add("🔄 Reiniciar Cyclops", (*) => Reload())
    A_TrayMenu.Add("❌ Sair", (*) => ExitApp())
}

Setup_Tray_Menu()
