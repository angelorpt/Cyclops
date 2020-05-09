#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
; SetKeyDelay, 100
; SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_MyDocuments%  ;  %A_ScriptDir%  ; Ensures a consistent starting directory.


ProductName      := "Cyclops"
ProductVersion   := "0.1.4"
ProductPublisher := "Angelo R. Pinto"
ProductWebsite   := "https://github.com/angelorpt/cyclops"
autoComplete     := 0 ; DEFAULT


TrayTip, Cyclops, Your windows manager is activated!

#Include, %A_ScriptDir%\functions\functions.ahk
#Include, %A_ScriptDir%\functions\functions_system.ahk
#Include, %A_ScriptDir%\functions\memory.ahk
