#Requires AutoHotkey v2.0+
; -----------------------------------------------------------------------------
; CYCLOPS SHORTCUTS HELP GUI (AutoHotkey v2)
; -----------------------------------------------------------------------------

^!#h::Show_Help_Gui()

Show_Help_Gui(*)
{
    static helpGui := ""
    if (helpGui != "")
    {
        helpGui.Show()
        return
    }

    helpGui := Gui("+AlwaysOnTop +Resize", "Cyclops - Guia de Atalhos")
    helpGui.SetFont("s10", "Segoe UI")

    helpGui.Add("Text", "w550 cNavy", "Visão Geral dos Atalhos de Produtividade do Cyclops")

    lv := helpGui.Add("ListView", "w560 h380 r16 Grid -Multi", ["Categoria", "Atalho", "Descrição"])
    lv.ModifyCol(1, 140)
    lv.ModifyCol(2, 170)
    lv.ModifyCol(3, 230)

    ; Text Snippets
    lv.Add("", "Texto Rápido", "Alt + Win + <Tecla>", "Salva texto na tecla [A-Z]")
    lv.Add("", "Texto Rápido", "Alt + Shift + <Tecla>", "Cola/digita o texto da tecla [A-Z]")

    ; Custom Keys
    lv.Add("", "Chave Custom", "Ctrl + Alt + Win + M", "Salva texto com nome de chave")
    lv.Add("", "Chave Custom", "Ctrl + Alt + Shift + M", "Digita texto pela chave")

    ; Files & URLs
    lv.Add("", "Executar / URL", "Ctrl + Win + <Tecla>", "Salva caminho ou URL na tecla [A-Z]")
    lv.Add("", "Executar / URL", "Ctrl + Alt + Win + <Tecla>", "Abre o arquivo, programa ou site [A-Z]")

    ; Window Switcher
    lv.Add("", "Alternar Janela", "Alt + Win + [0-9, Num 0-9]", "Associa título da janela (TKL e Numpad)")
    lv.Add("", "Alternar Janela", "Ctrl + Win + [0-9, Num 0-9]", "Ativa/foca janela associada")

    ; System & Helpers
    lv.Add("", "Sistema", "Ctrl + Alt + 1 (ou Num 1)", "Abre o Bloco de Notas")
    lv.Add("", "Sistema", "Ctrl + Alt + 2 (ou Num 2)", "Abre a Calculadora")
    lv.Add("", "Sistema", "Ctrl + Alt + Win + S", "Abre as Configurações")
    lv.Add("", "Sistema", "Ctrl + Alt + Win + H", "Abre este Guia de Atalhos")
    lv.Add("", "Sistema", "Ctrl + Alt + Win + R", "Reinicia o Cyclops")
    lv.Add("", "Sistema", "Ctrl + Alt + Win + P", "Pausar / Retomar Atalhos do Cyclops")

    btnClose := helpGui.Add("Button", "w100 x480 yp+395 Default", "Fechar")
    btnClose.OnEvent("Click", (*) => helpGui.Hide())
    helpGui.OnEvent("Close", (*) => helpGui.Hide())

    helpGui.Show("w590 h460")
}
