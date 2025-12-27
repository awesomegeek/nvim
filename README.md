# � My Neovim Setup 2026

Personal Neovim configuration for 2026, built on top of [LazyVim](https://github.com/LazyVim/LazyVim).

## 🛠️ Features

- **Package Manager:** [lazy.nvim](https://github.com/folke/lazy.nvim)
- **Framework:** [LazyVim](https://www.lazyvim.org/)
- **Theme:** Catppuccin (default)
- **LSP:** Configured via `mason.nvim`
- **Formatting:** `conform.nvim`
- **Linting:** `nvim-lint`

## 📦 Installation

1. Backup your current configuration:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. Clone this repository:
   ```bash
   git clone https://github.com/awesomegeek/nvim ~/.config/nvim
   ```

3. Start Neovim:
   ```bash
   nvim
   ```

## ⌨️ Keymaps

Refer to [lua/config/keymaps.lua](lua/config/keymaps.lua) for custom keybindings.
