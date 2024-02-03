return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")
		dap.configurations.python = {
			{
				-- The first three options are required by nvim-dap
				type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
				request = "launch",
				name = "Launch file",

				-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

				program = "${file}", -- This configuration will launch the current file if used.
				pythonPath = function()
					-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
					-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
					-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
					local cwd = vim.fn.getcwd()
					if vim.fn.executable(cwd .. "/venv/bin/python3") == 1 then
						return cwd .. "/env/bin/python"
					elseif vim.fn.executable(cwd .. "/.env/bin/python3") == 1 then
						return cwd .. "/.env/bin/python3"
					else
						return "/usr/bin/python3"
					end
				end,
			},
		}

		vim.keymap.set("n", "<Leader>dc", function()
			require("dap").continue()
		end, { desc = "continue" })

		vim.keymap.set("n", "<Leader>do", function()
			require("dap").step_over()
		end, { desc = "step_over" })

		vim.keymap.set("n", "<Leader>di", function()
			require("dap").step_into()
		end, { desc = "step_into" })

		vim.keymap.set("n", "<Leader>dso", function()
			require("dap").step_out()
		end, { desc = "step_out" })

		vim.keymap.set("n", "<Leader>db", function()
			require("dap").toggle_breakpoint()
		end, { desc = "toggle_breakpoint" })

		vim.keymap.set("n", "<Leader>dB", function()
			require("dap").set_breakpoint()
		end, { desc = "set_breakpoint" })

		vim.keymap.set("n", "<Leader>dlp", function()
			require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end, { desc = "Log point message: " })

		vim.keymap.set("n", "<Leader>dr", function()
			require("dap").repl.open()
		end, { desc = "repl.open" })

		vim.keymap.set("n", "<Leader>dl", function()
			require("dap").run_last()
		end, { desc = "run_last" })
	end,
}
