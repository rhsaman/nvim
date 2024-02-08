return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap" },
	config = function()
		require("dapui").setup()

		vim.api.nvim_set_hl(0, "red", { ctermbg = 0, fg = "#DE4930" })
		vim.api.nvim_set_hl(0, "green", { ctermbg = 0, fg = "#9ece6a" })

		vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "red", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "", texthl = "green", linehl = "", numhl = "" })

		vim.keymap.set("n", "<leader>ds", ':lua require("dapui").float_element()<cr>', { desc = "watch float" })
		vim.keymap.set("n", "<leader>de", ':lua require("dapui").eval()<CR>', { desc = "eval" })
		vim.keymap.set("n", "<leader>du", ":lua require('dapui').toggle()<CR>", { desc = "dap ui" })
	end,
}
