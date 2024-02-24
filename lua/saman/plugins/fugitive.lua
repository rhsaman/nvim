return {
	"tpope/vim-fugitive",
	event = "VeryLazy",
	keys = {
		{ "<leader>ga", ":Git add .<cr>", desc = "Git add" },
		{ "<leader>gc", ':Git commit -m "' and ":Git push<cr>", desc = "Git commit" },
		{ "<leader>gp", ":Git push<cr>", desc = "Git push" },
		{ "<leader>gi", "<cmd>:Git<cr>", desc = "fugitive" },
	},
}
