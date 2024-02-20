return {
	"ThePrimeagen/harpoon",
	dependencies = { "kdheepak/tabline.nvim", "hoob3rt/lualine.nvim" },
	event = "VeryLazy",
	keys = {
		{ "<leader>fh", ':lua require("harpoon.ui").toggle_quick_menu()<cr>', desc = "Menu harpoon" },
		{ "<leader>fm", ':lua require("harpoon.mark").add_file()<cr>', desc = "mark harpoon" },
		{ "<c-n>", ':lua require("harpoon.ui").nav_next()<cr>', desc = "Next harpoon" },
		{ "<c-p>", ':lua require("harpoon.ui").nav_prev()<cr>', desc = "Prev harpoon" },
	},

	config = function()
		require("harpoon").setup({
			-- enable tabline with harpoon marks
			tabline = true,
			tabline_prefix = "  ",
			tabline_suffix = "  ",
		})
		-- require("tabline").setup({ enable = true })
		vim.cmd("highlight! HarpoonInactive guibg=NONE guifg=#6A6C83")
		vim.cmd("highlight! HarpoonActive guibg=NONE guifg=#CAA55C")
		vim.cmd("highlight! HarpoonNumberActive guibg=NONE guifg=#CAA55C")
		vim.cmd("highlight! HarpoonNumberInactive guibg=NONE guifg=#6A6C83")
		vim.cmd("highlight! TabLineFill guibg=NONE guifg=white")
	end,
}
