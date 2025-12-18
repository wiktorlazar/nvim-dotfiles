

<p align="center">
  <img src="https://i.imgur.com/Yf4XNLF.jpeg" alt="nvim-dotfiles logo" width="140" />
</p>

<!-- LOGO -->
<!-- ![Logo](https://i.imgur.com/Yf4XNLF.jpeg) -->

<h1 align="center">nvim-dotfiles</h1>

<p align="center">
  Clean, modular Neovim configuration built on <code>lazy.nvim</code> with an NvChad-style UI layer.
</p>

---

## Overview

This repo contains my personal Neovim setup focused on a fast, modern workflow:

- Plugin manager: **lazy.nvim** (auto-bootstrapped on first run)
- UI layer: **NvChad UI/base46** style modules
- IDE features: **LSP**, autocompletion, formatting-on-save, linting
- Navigation: Telescope + file explorer + Harpoon
- Extras: LazyGit integration, Trouble diagnostics, CodeSnap, LeetCode integration

---

## Requirements

### Core

- **Neovim** (recommended: recent stable)
- **git** (required for plugin installation)
- A **Nerd Font** (recommended) for icons

### Recommended CLIs

- **ripgrep (`rg`)** – used by Telescope live_grep
- **make** – needed for native builds (e.g. Telescope fzf-native, CodeSnap, CopilotChat build steps)
- **lazygit** – for `:LazyGit` (optional)

### Tooling installed via Mason

This config uses **mason.nvim + mason-tool-installer** to install LSP/formatters/linters, including:

- LSP: `lua-language-server`, `typescript-language-server`, `tailwindcss-language-server`, `css-lsp`, `gopls`, `rust-analyzer`
- Formatters: `prettierd`, `stylua`, `gofumpt`, `goimports-reviser`, `golines`
- Linters: `eslint_d`, `golangci-lint`

Notes:
- For JS/TS tooling, having **Node.js** installed is recommended.
- For Go/Rust workflows, having **Go/Rust toolchains** installed is recommended.

---

## Installation

> This will replace your current Neovim configuration. Make a backup first.

```bash
# backup
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null
mv ~/.local/share/nvim ~/.local/share/nvim.bak 2>/dev/null
mv ~/.local/state/nvim ~/.local/state/nvim.bak 2>/dev/null
mv ~/.cache/nvim ~/.cache/nvim.bak 2>/dev/null

# install
git clone https://github.com/wiktorlazar/nvim-dotfiles ~/.config/nvim
nvim
```

First launch will:
- clone `lazy.nvim` automatically
- install plugins
- run `:MasonToolsInstall` automatically (installs configured LSPs/formatters/linters)

## Updating
Inside Neovim:
- Update plugins: `:Lazy sync` (or `:Lazy update`)
- Manage external tooling: `:Mason` (and `:MasonToolsUpdate` if you use it)

This repo includes `lazy-lock.json` to pin plugin versions.

## Key bindings (high-signal)
Leader key is **Space**.

### Files / Search
- `Ctrl+n` → toggle file explorer (NvimTree)
- `ff` → Telescope find files
- `fw` → Telescope live grep
- `fb` → Telescope buffers
- `fm` → Telescope resume

### Git
- `Space gg` → LazyGit
- `Space gp` → preview git hunk
- `Space gb` → blame line

### LSP (when attached)
- `gd` → definition
- `gD` → declaration
- `K` → hover
- `gr` → references
- `ca` → code action
- `Space rn` → rename
- `[d` / `]d` → prev/next diagnostic
- `fd` → floating diagnostics

### Editing / Quality of life
- `Space /` → toggle comment (Normal/Visual)
- `Space u` → UndoTree
- `Space fm` → format file/range (Conform)
- `Space m` → maximize/minimize split
- `Ctrl+h/j/k/l` → tmux-aware window navigation

### Diagnostics UI
- `Space tw` → Trouble workspace diagnostics
- `Space td` → Trouble document diagnostics
- `Space tt` → Trouble todos

### Harpoon
- `Space a` → add file
- `Ctrl+e` → quick menu

## Structure
- `init.lua` – bootstraps lazy.nvim and installs Mason tools on first run
- `lua/core/` – base options + mappings
- `lua/plugins/` – plugin specs/config (Lazy)
- `lazy-lock.json` – pinned plugin versions

## Troubleshooting
- Telescope grep not working: install `rg` (ripgrep)
- Native fzf extension fails: ensure `make` is installed
- Missing icons: install a Nerd Font and configure your terminal to use it
- Mason installs tools but they don’t run: ensure required runtimes are installed (e.g. Node for JS/TS)

## License
MIT — see [LICENSE](LICENSE).
