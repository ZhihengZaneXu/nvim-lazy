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

## Plugin

### UI

| Plugin | Purpose |
| --- | --- |
| [rose-pine](https://github.com/rose-pine/neovim) | Default colorscheme (moon variant) |
| [tokyonight](https://github.com/folke/tokyonight.nvim) | Backup colorscheme |
| [lualine](https://github.com/nvim-lualine/lualine.nvim) | Status line |
| [noice](https://github.com/folke/noice.nvim) | Cleaner cmdline / messages / popups |
| [barbar](https://github.com/romgrk/barbar.nvim) | Buffer line / tabs |
| [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) | File explorer sidebar |
| [aerial](https://github.com/stevearc/aerial.nvim) | Symbol outline |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | File-type icons |

### Editing

| Plugin | Purpose |
| --- | --- |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-close brackets/quotes |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | `gcc` / `gc` comment toggling |
| [gitsigns](https://github.com/lewis6991/gitsigns.nvim) | Inline git diff markers, blame, hunk staging |
| [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) | `<C-h/j/k/l>` across nvim + tmux panes |

### Search & navigation

| Plugin | Purpose |
| --- | --- |
| [telescope](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder (files, grep, buffers, help) |
| [plenary](https://github.com/nvim-lua/plenary.nvim) | Lua utility library (telescope dependency) |
| [trouble](https://github.com/folke/trouble.nvim) | Pretty diagnostics / LSP refs panel |

### Completion

| Plugin | Purpose |
| --- | --- |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Completion engine |
| Sources | `nvim_lsp`, `luasnip`, `buffer`, `path`, `cmdline` |

### Language support

| Plugin | Purpose |
| --- | --- |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax/indent for lua, python, javascript, html, css (auto-install on) |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) + [mason](https://github.com/williamboman/mason.nvim) | LSP setup; servers: `lua_ls`, `pylsp`, `texlab`, `harper_ls` |
| [lspsaga](https://github.com/nvimdev/lspsaga.nvim) | LSP UI (code actions, hover, rename) |
| [nvim-navic](https://github.com/SmiteshP/nvim-navic) | Breadcrumb context from LSP |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Formatters: stylua, black, prettier, latexindent |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint) | Linters: flake8, eslint_d |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debug adapter (Python via debugpy) |

### Filetype-specific

| Plugin | Purpose |
| --- | --- |
| [vimtex](https://github.com/lervag/vimtex) | LaTeX editing, Tectonic compile, Zathura preview |
| [nvim-jupyter-client](https://github.com/geg2102/nvim-jupyter-client) | Jupyter cell operations on `.ipynb` |
| [csvview](https://github.com/hat0uma/csvview.nvim) | Column-aligned CSV viewing |
| [love2d.nvim](https://github.com/S1M0N38/love2d.nvim) | LÖVE game framework helpers |

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
