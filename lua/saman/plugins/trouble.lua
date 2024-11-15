return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	lazy = true,

	opts = {},

	cmd = "Trouble",
	keys = {
		{
			"<leader>td",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics",
		},
		{
			"<leader>ts",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Symbols",
		},
		{
			"<leader>tl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / references",
		},
		{
			"<leader>tq",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List",
		},
	},
}
