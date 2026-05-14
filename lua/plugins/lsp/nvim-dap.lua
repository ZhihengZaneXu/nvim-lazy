return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			dap.adapters.python = {
				type = "executable",
				command = "python",
				args = { "-m", "debugpy.adapter" },
			}
			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					pythonPath = function()
						-- 1. Active virtualenv (venv/poetry/uv all set VIRTUAL_ENV)
						local venv = os.getenv("VIRTUAL_ENV")
						if venv then
							return venv .. "/bin/python"
						end
						-- 2. Active conda env (set when you `conda activate <name>`)
						local conda = os.getenv("CONDA_PREFIX")
						if conda then
							return conda .. "/bin/python"
						end
						-- 3. Fall back to whatever `python3` resolves to on PATH
						return vim.fn.exepath("python3")
					end,
				},
			}
		end,
	},
}
