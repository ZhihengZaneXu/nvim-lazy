return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Use the new vim.lsp.config approach instead of require('lspconfig')

			-- Harper_Ls for spelling
			vim.lsp.config.harper_ls = {
				filetypes = { "tex", "markdown", "text" },
				settings = {
					["harper-ls"] = {
						linters = {
							SpellCheck = true,
							SpelledNumbers = false,
							AnA = true,
							SentenceCapitalization = true,
							UnclosedQuotes = true,
							WrongQuotes = false,
							LongSentences = true,
							RepeatedWords = true,
							Spaces = true,
							Matcher = true,
							CorrectNumberSuffix = true,
						},
						codeActions = {
							ForceStable = false,
						},
						markdown = {
							IgnoreLinkTitle = false,
						},
						diagnosticSeverity = "hint",
						isolateEnglish = false,
						dialect = "American",
						maxFileLength = 120000,
						ignoredLintsPath = "",
						excludePatterns = {},
					},
				},
			}
			-- Lua Language Server setup
			vim.lsp.config.lua_ls = {
				cmd = { "lua-language-server" },
				filetypes = { "lua" },
				root_markers = {
					".luarc.json",
					".luarc.jsonc",
					".luacheckrc",
					".stylua.toml",
					"stylua.toml",
					"selene.toml",
					"selene.yml",
					".git",
				},
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT", -- Lua runtime version used by Neovim
							path = vim.split(package.path, ";"), -- Path to Lua libraries
						},
						diagnostics = {
							globals = {
								"vim", -- Neovim globals
								"love", -- Love2D globals
							},
							disable = {
								"undefined-field",
							},
						},
						workspace = {
							library = {
								"${3rd}/love2d/library",
								vim.api.nvim_get_runtime_file("", true),
							}, -- Neovim runtime files
							checkThirdParty = true, -- Disable third-party library check
						},
						telemetry = {
							enable = false, -- Disable telemetry for performance
						},
					},
				},
			}

			-- Python Language Server setup
			vim.lsp.config.pylsp = {
				cmd = { "pylsp" },
				filetypes = { "python" },
				root_markers = {
					"pyproject.toml",
					"setup.py",
					"setup.cfg",
					"requirements.txt",
					"Pipfile",
					"pyrightconfig.json",
					".git",
				},
				settings = {
					pylsp = {
						plugins = {
							-- Enable Black for formatting
							black = { enabled = true },
							-- Enable linting (e.g., flake8)
							flake8 = { enabled = true },
							-- Disable jedi, since you don't use it
							jedi_completion = { enabled = false },
							jedi_hover = { enabled = false },
							jedi_references = { enabled = false },
							jedi_signature_help = { enabled = false },
							jedi_symbols = { enabled = false },
							-- Enable rope for refactoring support
							rope_completion = { enabled = true },
						},
					},
				},
			}

			-- LaTeX Language Server setup (TexLab)
			vim.lsp.config.texlab = {
				cmd = { "texlab" },
				filetypes = { "tex", "plaintex", "bib" },
				root_markers = { ".latexmkrc", ".texlabroot", "texlabroot", "Tectonic.toml", ".git" },
				settings = {
					texlab = {
						build = {
							executable = "latexmk",
							args = {
								"-pdf",
								"-interaction=nonstopmode",
								"-synctex=1",
								"%f",
							},
							onSave = true, -- Auto-build on save
						},
						forwardSearch = {
							executable = "zathura", -- Change this if using a different PDF viewer
							args = { "--synctex-forward", "%l:1:%f", "%p" },
						},
						lint = {
							onChange = true, -- Enable linting while editing
						},
					},
				},
			}
			-- R Language Server setup
			vim.lsp.config.r_language_server = {
				cmd = { "R", "--slave", "-e", "languageserver::run()" },
				filetypes = { "r", "rmd", "quarto" },
				root_markers = { ".Rproj", "DESCRIPTION", "NAMESPACE", ".git" },
				settings = {
					r = {
						lsp = {
							diagnostics = true,
							rich_documentation = true,
						},
					},
				},
			}

			-- Enable the LSP servers
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("pylsp")
			vim.lsp.enable("texlab")
			vim.lsp.enable("harper_ls")
			vim.lsp.enable("r_language_server") -- add this
		end,
	},
}
