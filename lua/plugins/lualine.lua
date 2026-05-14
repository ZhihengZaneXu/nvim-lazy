return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"folke/noice.nvim",
		},
		config = function()
			local colors = {
				bg = "#1a1b26",
				bg_dark = "#16161e",
				white = "#c0caf5",
				gray2 = "#2f334d",
				blue = "#7aa2f7",
				cyan = "#7dcfff",
				green = "#9ece6a",
				yellow = "#e0af68",
				orange = "#ff9e64",
				red = "#f7768e",
				bright_red = "#ff757f",
				purple = "#bb9af7",
			}

			local modecolor = {
				n = colors.red,
				i = colors.cyan,
				v = colors.purple,
				["␖"] = colors.purple,
				V = colors.red,
				c = colors.yellow,
				no = colors.red,
				s = colors.yellow,
				S = colors.yellow,
				["␓"] = colors.yellow,
				ic = colors.yellow,
				R = colors.green,
				Rv = colors.purple,
				cv = colors.red,
				ce = colors.red,
				r = colors.cyan,
				rm = colors.cyan,
				["r?"] = colors.cyan,
				["!"] = colors.red,
				t = colors.bright_red,
			}

			local theme = {
				normal = {
					a = { fg = colors.bg_dark, bg = colors.blue },
					b = { fg = colors.blue, bg = colors.white },
					c = { fg = colors.white, bg = colors.bg_dark },
					z = { fg = colors.white, bg = colors.bg_dark },
				},
				insert = { a = { fg = colors.bg_dark, bg = colors.orange } },
				visual = { a = { fg = colors.bg_dark, bg = colors.green } },
				replace = { a = { fg = colors.bg_dark, bg = colors.green } },
			}

			local space = {
				function()
					return " "
				end,
			}

			local filename = {
				"filename",
				color = { bg = colors.blue, fg = colors.bg, gui = "bold" },
				separator = { left = "", right = "" },
			}

			local filetype = {
				"filetype",
				icons_enabled = false,
				color = { bg = colors.gray2, fg = colors.blue, gui = "italic,bold" },
				separator = { left = "", right = "" },
			}

			local branch = {
				"branch",
				icon = "",
				color = { bg = colors.green, fg = colors.bg, gui = "bold" },
				separator = { left = "", right = "" },
			}

			local location = {
				"location",
				color = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
				separator = { left = "", right = "" },
			}

			local diff = {
				"diff",
				color = { bg = colors.gray2, fg = colors.bg, gui = "bold" },
				separator = { left = "", right = "" },
				symbols = { added = " ", modified = " ", removed = " " },
				diff_color = {
					added = { fg = colors.green },
					modified = { fg = colors.yellow },
					removed = { fg = colors.red },
				},
			}

			local modes = {
				"mode",
				color = function()
					return {
						bg = modecolor[vim.fn.mode()] or colors.blue,
						fg = colors.bg_dark,
						gui = "bold",
					}
				end,
				separator = { left = "", right = "" },
			}

			local function getLspName()
				local bufnr = vim.api.nvim_get_current_buf()
				local buf_ft = vim.bo.filetype
				local client_names = {}

				for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
					table.insert(client_names, client.name)
				end

				local lint_ok, lint = pcall(require, "lint")
				if lint_ok and lint.linters_by_ft then
					local linters = lint.linters_by_ft[buf_ft]
					if type(linters) == "table" then
						for _, l in ipairs(linters) do
							table.insert(client_names, l)
						end
					elseif type(linters) == "string" then
						table.insert(client_names, linters)
					end
				end

				local conform_ok, conform = pcall(require, "conform")
				if conform_ok and conform.list_formatters_for_buffer then
					for _, formatter in ipairs(conform.list_formatters_for_buffer()) do
						if type(formatter) == "string" then
							table.insert(client_names, formatter)
						elseif type(formatter) == "table" and formatter.name then
							table.insert(client_names, formatter.name)
						end
					end
				end

				if #client_names == 0 then
					return "  No tools"
				end

				local uniq, seen = {}, {}
				for _, name in ipairs(client_names) do
					if not seen[name] then
						table.insert(uniq, name)
						seen[name] = true
					end
				end

				return "  " .. table.concat(uniq, ", ")
			end

			local macro = {
				require("noice").api.status.mode.get,
				cond = require("noice").api.status.mode.has,
				color = { fg = colors.red, bg = colors.bg_dark, gui = "italic,bold" },
			}

			local dia = {
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
				diagnostics_color = {
					error = { fg = colors.red },
					warn = { fg = colors.yellow },
					info = { fg = colors.purple },
					hint = { fg = colors.cyan },
				},
				color = { bg = colors.gray2, fg = colors.blue, gui = "bold" },
				separator = { left = "" },
			}

			local lsp = {
				function()
					return getLspName()
				end,
				separator = { left = "", right = "" },
				color = { bg = colors.purple, fg = colors.bg, gui = "italic,bold" },
			}

			require("lualine").setup({
				options = {
					theme = "rose-pine",
					icons_enabled = true,
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" },
						winbar = {},
					},
					always_divide_middle = true,
					globalstatus = true,
				},
				sections = {
					lualine_a = { modes },
					lualine_b = { space },
					lualine_c = {
						filename,
						filetype,
						space,
						branch,
						diff,
						space,
						location,
					},
					lualine_x = { space },
					lualine_y = { macro, space },
					lualine_z = { dia, lsp },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				extensions = { "fugitive", "quickfix", "nvim-tree" },
			})
		end,
	},
}
