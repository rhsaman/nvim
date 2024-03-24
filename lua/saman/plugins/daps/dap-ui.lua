return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	event = "VeryLazy",
	config = function()
		require("dapui").setup()

		vim.api.nvim_set_hl(0, "red", { ctermbg = 0, fg = "#DE4930" })
		vim.api.nvim_set_hl(0, "green", { ctermbg = 0, fg = "#9ece6a" })
		vim.api.nvim_set_hl(0, "hilight", { ctermbg = 0, bg = "#2A4C3B" })
		vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef" })

		vim.fn.sign_define("DapBreakpointCondition", { text = " ﳁ", texthl = "DapBreakpoint" })
		vim.fn.sign_define("DapBreakpointRejected", { text = " ", texthl = "DapBreakpoint" })
		vim.fn.sign_define("DapLogPoint", { text = " ", texthl = "DapLogPoint" })
		vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "red", linehl = "", numhl = "" })
		vim.fn.sign_define("DapBreakpointCondition", { text = "l", texthl = "red", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "", texthl = "green", linehl = "hilight", numhl = "hilight" })

		vim.keymap.set("n", "<leader>ds", ':lua require("dapui").float_element()<cr>', { desc = "watch float" })
		vim.keymap.set("n", "<leader>de", ':lua require("dapui").eval()<CR>', { desc = "eval" })
		vim.keymap.set("n", "<leader>du", ":lua require('dapui').toggle()<CR>", { desc = "dap ui" })
	end,
}
