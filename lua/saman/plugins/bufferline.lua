return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",

	hint_selected = {
		fg = "#000",
		bg = "#000",
		sp = "#000",
		bold = true,
		italic = true,
	},

	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup({})
	end,
}
