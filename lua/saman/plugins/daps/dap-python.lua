return {
	"mfussenegger/nvim-dap-python",
	ft = "python",

	config = function()
		require("dap-python").setup("python3")
	end,
}
