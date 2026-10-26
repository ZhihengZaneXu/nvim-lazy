return {
      {
              "nvim-treesitter/nvim-treesitter",
              branch = "main",
              lazy = false, -- main branch does not support lazy-loading
              build = ":TSUpdate",
              config = function()
                      local ts = require("nvim-treesitter")

                      -- replaces ensure_installed
                      ts.install({
                              "lua",
                              "python",
                              "javascript",
                              "html",
                              "css",
                              "markdown",
                              "markdown_inline", -- noice / docs / hover popups
                              "bash", -- shell scripts, .zshrc, etc.
                              "json", -- lazy-lock.json, configs
                      })

                      local disable = { latex = true }

                      vim.api.nvim_create_autocmd("FileType", {
                              callback = function(args)
                                      local lang = vim.treesitter.language.get_lang(args.match)
                                      if not lang or disable[lang] then
                                              return
                                      end
                                      -- replaces auto_install
                                      local ok, loaded = pcall(vim.treesitter.language.add, lang)
                                      if not (ok and loaded) then
                                              if vim.tbl_contains(ts.get_available(), lang) then
                                                      ts.install(lang)
                                              end
                                              return
                                      end
                                      if pcall(vim.treesitter.start, args.buf, lang) then -- replaces highlight.enable
                                              vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- replaces indent.enable
                                      end
                              end,
                      })
              end,
      },
}

