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

#Include "%A_ScriptDir%\functions\functions.ahk"
#Include "%A_ScriptDir%\functions\functions_system.ahk"
#Include "%A_ScriptDir%\functions\memory.ahk"
#Include "%A_ScriptDir%\functions\settings_gui.ahk"
