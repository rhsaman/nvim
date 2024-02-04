return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap" },
	config = function()
		require("dapui").setup()

		vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })
	end,
}
