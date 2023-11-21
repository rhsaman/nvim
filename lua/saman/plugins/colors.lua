return {
	"folke/tokyonight.nvim",
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("tokyonight").setup({
			style = "night",
			transparent = true,
		})
		-- load the colorscheme here
		vim.cmd([[colorscheme tokyonight]])

		-- "morhetz/gruvbox",
		-- priority = 1000,
		-- config = function()
		-- 	vim.cmd.colorscheme("gruvbox")

		-- transparent background
		-- vim.cmd("let g:gruvbox_transparent_bg = 1")
		-- vim.cmd("autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE")
	end,
}
