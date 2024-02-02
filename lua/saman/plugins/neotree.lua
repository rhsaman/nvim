return {
	"nvim-tree/nvim-tree.lua",
	-- "nvim-tree/nvim-web-devicons",
	config = function()
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},

			-- on_attach = my_on_attach,
			vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "toggle tree" }),
			vim.keymap.set("n", "zz", "::NvimTreeCollapse<CR>", { desc = "collapse tree" }),
		})
	end,
}
