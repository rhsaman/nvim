return {
	"folke/tokyonight.nvim",
	config = function()
		require("tokyonight").setup({
			-- transparent = true,
			dim_inactive = false,
		})
		vim.cmd("colorscheme tokyonight")
	end,
}

-- vim.cmd("colorscheme gruvbox")
