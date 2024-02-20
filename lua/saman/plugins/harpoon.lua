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
			-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
			save_on_toggle = false,

			-- saves the harpoon file upon every change. disabling is unrecommended.
			save_on_change = false,

			-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
			enter_on_sendcmd = false,

			-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
			tmux_autoclose_windows = false,

			-- filetypes that you want to prevent from adding to the harpoon list menu.
			excluded_filetypes = { "harpoon" },

			-- set marks specific to each git branch inside git repository
			mark_branch = true,

			-- enable tabline with harpoon marks
			tabline = true,
			tabline_prefix = "  ",
			tabline_suffix = "  ",
		})
		-- require("tabline").setup({ enable = true })
		vim.cmd("highlight! HarpoonInactive guibg=NONE guifg=#6A6C83")
		vim.cmd("highlight! HarpoonActive guibg=NONE guifg=#6FC3AD")
		vim.cmd("highlight! HarpoonNumberActive guibg=NONE guifg=#6FC3AD")
		vim.cmd("highlight! HarpoonNumberInactive guibg=NONE guifg=#6A6C83")
		vim.cmd("highlight! TabLineFill guibg=NONE guifg=white")
	end,
}
