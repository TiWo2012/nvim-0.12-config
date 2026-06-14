# Nvim-0.12-config

Minimal Neovim config using the built-in LSP client (vim.lsp.config) with a light plugin layer.

## Installation

```bash
git clone https://github.com/TiWo2012/nvim-0.12-config.git ~/.config/nvim
```

Launch nvim. Once lazy.nvim finishes installing plugins, run `:Lazy sync` to update.

## Features

- **LSP** — mason + mason-lspconfig for server installs, `vim.lsp.config` for configuration
  - `clangd` (C/C++)
  - `lua_ls` (Lua, via `lazydev.nvim`)
  - `pyright` (Python)
  - `ts_ls` (TypeScript/JavaScript)
- **Completions** — `nvim-cmp` with `cmp-nvim-lsp`, `cmp-path`, and `cmp-luasnip` sources
- **Snippets** — `LuaSnip` with custom C/C++ snippets (header guard, main, for, struct, enum, etc.)
- **Telescope** — fuzzy finder with `fzf-native`
- **Bufferline** — `bufferline.nvim` with thick separators, numbered buffers, `[b`/`]b` navigation
- **Which-key** — keybinding popup
- **Statusline** — `feline.nvim` with mode, file info, git branch, LSP clients
- **File explorer** — `neo-tree.nvim` (right sidebar)
- **Oil.nvim** — file manager with floating window
- **Treesitter** — syntax highlighting, indentation for c, cpp, lua, python, ts, js, rust, go, zig
- **Gitsigns** — git change indicators
- **Toggleterm** — floating and split terminals
- **Indent guides** — rainbow indentation lines
- **Autoclose** — auto-close brackets
- **Catppuccin** — colorscheme (macchiato) with transparent background
- **Fugitive** — Git integration
- **inc-rename** — inline LSP renames
- **DAP** — debugging adapter protocol
- **tmux-navigator** — seamless tmux pane navigation

## Keybindings

| Key | Action |
|-----|--------|
| `<leader>w` | Save |
| `gd` | Go to definition |
| `K` | Hover |
| `gr` | References / inc-rename |
| `<leader>rn` | Rename |
| `<leader>ca` | Code action |
| `<leader>ff` | Find files |
| `<leader>fw` | Grep string |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>e` | Neo-tree toggle |
| `<leader>tf` | Float terminal |
| `<leader>to` | Vertical terminal |
| `[b` / `]b` | Previous/next buffer |
| `<leader>1`–`<leader>9` | Go to buffer N |
| `<leader>bd` | Close buffer |
| `<leader>?` | Which-key popup |
