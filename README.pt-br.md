# Cyclops

<p align="center">
  <img src="./img/cyclops_128x128.png" alt="Logo Cyclops" width="128" height="128">
</p>

<p align="center">
  <strong>Assistente inteligente de produtividade por teclado para Windows, feito para desenvolvedores e usuários avançados.</strong>
</p>

<p align="center">
  <a href="https://github.com/angelorpt/cyclops/releases"><img src="https://img.shields.io/github/v/release/angelorpt/cyclops?style=flat-square" alt="Release"></a>
  <a href="https://www.autohotkey.com/v2/"><img src="https://img.shields.io/badge/AutoHotkey-v2-334455?style=flat-square&logo=autohotkey" alt="AutoHotkey v2"></a>
  <img src="https://img.shields.io/badge/Plataforma-Windows-0078D6?style=flat-square&logo=windows" alt="Plataforma: Windows">
  <a href="./LICENSE"><img src="https://img.shields.io/badge/Licen%C3%A7a-MIT-green?style=flat-square" alt="Licença: MIT"></a>
</p>

---

> [!NOTE]
> 🇺🇸 **Looking for the English version?** Check out [README.md](./README.md).

---

## O que é o Cyclops?

**Cyclops** é um aplicativo de produtividade leve para Windows desenvolvido em [AutoHotkey v2](https://www.autohotkey.com/v2/). Seu objetivo é maximizar sua eficiência no sistema operacional, reduzindo o uso do mouse e permitindo controle total por atalhos diretos de teclado.

### Principais Funcionalidades

- **Alternador Direto de Janelas**: Troque instantaneamente para qualquer janela aberta associada, muito mais rápido do que navegar pelo <kbd>Alt</kbd> + <kbd>Tab</kbd>.
- **Memória Rápida de Texto**: Armazene frases, comandos ou dados frequentes vinculados a qualquer tecla de Letra `[A-Z]` ou Número `[0-9]`.
- **Chaves Personalizadas**: Guarde e recupere informações através de identificadores customizados (ex: chave `email_trabalho`, `token_auth`).
- **Disparador de Aplicativos e URLs**: Abra arquivos, programas e sites diretamente por atalhos.

---

## Download e Instalação

1. Baixe o executável pronto na seção de [Releases](https://github.com/angelorpt/cyclops/releases).
2. Se preferir rodar direto do código-fonte, instale o [AutoHotkey v2](https://www.autohotkey.com/v2/) e execute:
   ```cmd
   AutoHotkey64.exe src/Cyclops.ahk
   ```

---

## Experimente Rapidamente

1. Pressione <kbd>Alt</kbd> + <kbd>Win</kbd> + <kbd>C</kbd> e digite qualquer texto.
2. Abra o Bloco de Notas ou um editor qualquer.
3. Pressione <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>C</kbd> e veja o Cyclops digitar o texto automaticamente.

---

## Tabela de Atalhos

### 1. Texto Rápido (Letras A-Z)

Armazene textos em uma única linha (emails, usuários, scripts, comandos SQL ou Git):

| Ação | Atalho | Descrição |
|---|---|---|
| **Salvar Texto** | <kbd>Alt</kbd> + <kbd>Win</kbd> + <kbd>&lt;A-Z&gt;</kbd> | Abre o prompt para associar o texto à tecla `[A-Z]` |
| **Digitar Texto** | <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>&lt;A-Z&gt;</kbd> | Digita automaticamente o texto associado à tecla informada |

---

### 2. Texto com Chave Personalizada

| Ação | Atalho | Descrição |
|---|---|---|
| **Salvar com Chave** | <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>Win</kbd> + <kbd>M</kbd> | Solicita o nome da chave e o texto a armazenar |
| **Digitar com Chave** | <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>M</kbd> | Solicita o nome da chave para recuperar e digitar |

---

### 3. Executar Arquivos ou URLs (Matriz Simétrica Sem Conflitos)

| Ação | Atalho | Descrição |
|---|---|---|
| **Salvar Caminho/URL** | <kbd>Ctrl</kbd> + <kbd>Win</kbd> + <kbd>&lt;A-Z&gt;</kbd> | Associa um caminho local ou URL a `[A-Z]` |
| **Executar** | <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>Win</kbd> + <kbd>&lt;A-Z&gt;</kbd> | Abre o arquivo, programa ou URL associado sem conflitar com outros apps |

---

### 4. Alternador de Janelas (Teclados TKL e Numpad)

| Ação | Atalho | Descrição |
|---|---|---|
| **Associar Janela** | <kbd>Alt</kbd> + <kbd>Win</kbd> + <kbd>&lt;0-9 / Numpad 0-9&gt;</kbd> | Informa parte do título da janela a associar |
| **Ativar Janela** | <kbd>Ctrl</kbd> + <kbd>Win</kbd> + <kbd>&lt;0-9 / Numpad 0-9&gt;</kbd> | Traz imediatamente a janela correspondente para o foco |

---

### 5. Utilitários e Apps Padrão

| Atalho | Ação |
|---|---|
| <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>1</kbd> ou <kbd>Numpad 1</kbd> | Abre o Bloco de Notas (Notepad) |
| <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>2</kbd> ou <kbd>Numpad 2</kbd> | Abre a Calculadora |
| <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>Win</kbd> + <kbd>S</kbd> | Abre as Configurações |
| <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>Win</kbd> + <kbd>H</kbd> | Abre o Guia de Atalhos |
| <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>Win</kbd> + <kbd>R</kbd> | Reinicia o Cyclops |
| <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>Win</kbd> + <kbd>P</kbd> | Pausar / Retomar Atalhos do Cyclops |

---

## Configuração e Armazenamento

Todos os dados e associações são salvos no arquivo `Cyclops.ini` localizado na pasta do aplicativo, garantindo portabilidade.

---

## Contribuição

Consulte o arquivo [AGENTS.md](../AGENTS.md) no repositório pai para informações sobre fluxo de branches, Conventional Commits e boas práticas de desenvolvimento em AutoHotkey v2.

---

## Licença

Distribuído sob a [Licença MIT](./LICENSE).
