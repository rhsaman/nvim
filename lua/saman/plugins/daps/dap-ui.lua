return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap" },
	config = function()
		require("dapui").setup()

		vim.fn.sign_define("DapBreakpoint", { text = "⭕", texthl = "", linehl = "", numhl = "" })
		-- vim.fn.sign_define("DapStopped", { text = "➔", texthl = "", linehl = "", numhl = "" })

		vim.keymap.set("n", "<leader>ds", ':lua require("dapui").float_element()<cr>', { desc = "watch float" })
		vim.keymap.set("n", "<leader>de", ':lua require("dapui").eval()<CR>', { desc = "eval" })
		vim.keymap.set("n", "<leader>du", ":lua require('dapui').toggle()<CR>", { desc = "dap ui" })
	end,
}
