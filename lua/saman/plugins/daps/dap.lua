return {
	"mfussenegger/nvim-dap",
	config = function()
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