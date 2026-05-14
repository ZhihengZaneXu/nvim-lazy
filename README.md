# nvim-lazy

My Neovim configuration, organized around [lazy.nvim](https://github.com/folke/lazy.nvim). Built around an academic workflow: Python, LaTeX, and Jupyter, with Lua for editor work on the side.

## Requirements

- Neovim ≥ 0.11 (uses the new `vim.lsp.config` API)
- `git`, `make`, `cmake`, a C compiler (for treesitter and telescope-fzf-native)
- [`ripgrep`](https://github.com/BurntSushi/ripgrep) (telescope live-grep)
- A [Nerd Font](https://www.nerdfonts.com/) for icons
- [`tectonic`](https://tectonic-typesetting.github.io/) and [`zathura`](https://pwmt.org/projects/zathura/) for the LaTeX workflow
- A Python with `debugpy` available if you use `nvim-dap`

Verify ripgrep is on your PATH:

```vim
:lua print(vim.fn.executable("rg"))
```

## Install

```bash
git clone https://github.com/<you>/nvim-lazy ~/.config/nvim
nvim   # lazy.nvim bootstraps itself and installs plugins on first launch
```

Then run `:Mason` to install language servers, and `:checkhealth` to confirm everything is wired up.

## Layout

```
├── init.lua                  -- entry point
├── lua/
│   ├── config/
│   │   ├── lazy.lua          -- bootstrap + plugin imports
│   │   ├── options.lua       -- vim.opt settings
│   │   ├── keymaps.lua       -- global keymaps
│   │   └── colorscheme.lua   -- colorscheme selection
│   └── plugins/
│       ├── colorschemes/     -- rose-pine (default), tokyonight
│       └── lsp/              -- LSP, DAP, lint, format, mason
└── lazy-lock.json            -- pinned plugin versions
```

## Plugins

**UI**: rose-pine, tokyonight, lualine, noice, barbar, nvim-tree, aerial, nvim-web-devicons
**Editing**: nvim-autopairs, Comment.nvim, gitsigns, vim-tmux-navigator
**Search/nav**: telescope, plenary, trouble
**Completion**: nvim-cmp with `nvim_lsp`, `luasnip`, `buffer`, `path`, `cmdline` sources
**Treesitter**: lua, python, javascript, html, css (auto-install on)
**LSP**: nvim-lspconfig + mason; servers configured for `lua_ls`, `pylsp`, `texlab`, `harper_ls`; plus lspsaga and nvim-navic
**Lint/format**: conform.nvim (stylua, black, prettier, latexindent), nvim-lint (flake8, eslint_d)
**Debug**: nvim-dap (Python via debugpy)
**Filetype**: vimtex (Tectonic + Zathura), nvim-jupyter-client, csvview, love2d

## Keymaps

Leader is `<space>`, local leader is `\`.

### General

| Keys           | Action                  |
| -------------- | ----------------------- |
| `<leader>nh`   | Clear search highlight  |
| `<leader>x`    | Close current split     |
| `<leader>to/tx/tn/tp` | New / close / next / prev tab |
| `<C-h/j/k/l>`  | Tmux-aware window nav   |
| `<leader>t`    | Toggle nvim-tree        |

### Telescope

| Keys           | Action          |
| -------------- | --------------- |
| `<leader>ff`   | Find files      |
| `<leader>fg`   | Live grep       |
| `<leader>fb`   | List buffers    |
| `<leader>fh`   | Help tags       |

### Buffers (barbar)

| Keys           | Action               |
| -------------- | -------------------- |
| `<A-,>` / `<A-.>` | Previous / next   |
| `<A-1>`…`<A-9>`, `<A-0>` | Goto buffer N / last |
| `<A-c>`        | Close buffer         |
| `<C-p>`        | Pick mode            |

### Git (gitsigns)

| Keys           | Action                    |
| -------------- | ------------------------- |
| `]c` / `[c`    | Next / prev hunk          |
| `<leader>hs/hr` | Stage / reset hunk       |
| `<leader>hp`   | Preview hunk              |
| `<leader>hb`   | Blame line (full)         |
| `<leader>hd`   | Diff this buffer          |

### Diagnostics (trouble)

| Keys           | Action                      |
| -------------- | --------------------------- |
| `<leader>xx`   | Diagnostics (workspace)     |
| `<leader>xX`   | Diagnostics (buffer)        |
| `<leader>cs`   | Symbols panel               |
| `<leader>cl`   | LSP defs / refs             |

### Symbols (aerial)

| Keys           | Action                  |
| -------------- | ----------------------- |
| `<leader>ao`   | Toggle outline (right)  |
| `<leader>an/ap`| Next / prev symbol      |

### Jupyter

| Keys                | Action                        |
| ------------------- | ----------------------------- |
| `<leader>ja/jA`     | Add cell below / above        |
| `<leader>jd/jD`     | Remove / delete cell          |
| `<leader>jm/jM`     | Merge with cell above / below |
| `<leader>jt`        | Convert cell type             |

### Format

`<leader>f` runs conform on the current buffer (also on save).

## Colorschemes

Default is **rose-pine** (moon variant). Switch on the fly:

```vim
:RosePineMoon
:RosePineDawn
```

## License

MIT.
