# Cyclops

<p align="center">
  <img src="./img/cyclops_128x128.png" alt="Cyclops Logo" width="128" height="128">
</p>

<p align="center">
  <strong>Fast, smart Windows keyboard assistant for developers and power users.</strong>
</p>

<p align="center">
  <a href="https://github.com/angelorpt/cyclops/releases"><img src="https://img.shields.io/github/v/release/angelorpt/cyclops?style=flat-square" alt="Release"></a>
  <a href="https://www.autohotkey.com/v2/"><img src="https://img.shields.io/badge/AutoHotkey-v2-334455?style=flat-square&logo=autohotkey" alt="AutoHotkey v2"></a>
  <img src="https://img.shields.io/badge/Platform-Windows-0078D6?style=flat-square&logo=windows" alt="Platform: Windows">
  <a href="./LICENSE"><img src="https://img.shields.io/badge/License-MIT-green?style=flat-square" alt="License: MIT"></a>
</p>

---

> [!NOTE]
> 🇧🇷 **Prefere ler em Português?** Veja a documentação completa em [README.pt-br.md](./README.pt-br.md).

---

## Overview

**Cyclops** is a lightweight Windows productivity assistant written in [AutoHotkey v2](https://www.autohotkey.com/v2/). It is designed to minimize mouse dependency and maximize speed for developers and keyboard-centric users.

### Key Capabilities

- **Lightning-fast Window Switching**: Direct-access window switcher that switches between target applications without cycling through `<Alt> + <Tab>`.
- **Quick Text Memory**: Instant text snippet storage associated with letters `[A-Z]` and numbers `[0-9]`.
- **Custom Key Value Store**: Save frequently used commands, credentials, queries, or paths using custom alphanumeric keys.
- **Fast App & URL Launcher**: Launch assigned programs or web URLs with a single key combination.

---

## Download & Installation

1. Download the latest compiled executable from [Releases](https://github.com/angelorpt/cyclops/releases).
2. Alternatively, run from source using [AutoHotkey v2](https://www.autohotkey.com/v2/):
   ```cmd
   AutoHotkey64.exe src/Cyclops.ahk
   ```

---

## Keyboard Shortcuts Reference

### 1. Quick Text Snippets (Letters & Numbers)

Assign and paste frequently used single-line texts (emails, tokens, queries, git commands):

| Action | Shortcut | Description |
|---|---|---|
| **Save Text** | <kbd>Alt</kbd> + <kbd>Win</kbd> + <kbd>&lt;Key&gt;</kbd> | Opens prompt to assign text to key `[A-Z]` or `[0-9]` |
| **Type Text** | <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>&lt;Key&gt;</kbd> | Types out the text associated with `<Key>` |

*Example:* Press <kbd>Alt</kbd> + <kbd>Win</kbd> + <kbd>E</kbd>, enter your email. Later, press <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>E</kbd> anywhere to auto-type it.

---

### 2. Custom Named Keys

Store snippets or paths under custom names:

| Action | Shortcut | Description |
|---|---|---|
| **Save by Key** | <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>Win</kbd> + <kbd>M</kbd> | Prompt for key name and text |
| **Paste by Key** | <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>M</kbd> | Prompt for key name to retrieve and type |

---

### 3. File & URL Launchers

Associate and launch frequently accessed files, scripts, or URLs:

| Action | Shortcut | Description |
|---|---|---|
| **Save File/URL** | <kbd>Ctrl</kbd> + <kbd>Win</kbd> + <kbd>&lt;Key&gt;</kbd> | Assign file path or URL to `[A-Z]` or `[0-9]` |
| **Open File/URL** | <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>&lt;Key&gt;</kbd> | Launch the associated file or URL |

---

### 4. Window Switcher (Numpad)

Instantly switch focus directly to specific open application windows:

| Action | Shortcut | Description |
|---|---|---|
| **Associate Window** | <kbd>Alt</kbd> + <kbd>Win</kbd> + <kbd>Numpad &lt;0-9&gt;</kbd> | Prompt window title portion to register |
| **Activate Window** | <kbd>Ctrl</kbd> + <kbd>Win</kbd> + <kbd>Numpad &lt;0-9&gt;</kbd> | Direct focus to registered window |

---

### 5. System Utilities & Built-in Apps

| Shortcut | Action |
|---|---|
| <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>1</kbd> or <kbd>Numpad 1</kbd> | Launch Notepad |
| <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>2</kbd> or <kbd>Numpad 2</kbd> | Launch Calculator |
| <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>Win</kbd> + <kbd>R</kbd> | Restart Cyclops |

---

## Configuration & Persistence

All saved keys, texts, paths, and window associations are persisted in `Cyclops.ini` located in the application directory.

---

## Contributing

Please review [AGENTS.md](../AGENTS.md) in the umbrella repository for contribution conventions, branch lifecycle, Conventional Commits formatting, and AutoHotkey v2 engineering guidelines.

---

## License

Cyclops is open-source software licensed under the [MIT License](./LICENSE).
