return {
	"windwp/nvim-ts-autotag",
	after = "nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			autotag = {
				enable = true,
			},
		})
	end,
}
