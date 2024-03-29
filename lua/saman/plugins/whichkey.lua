return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		icons = {
			breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
			separator = "➜", -- symbol used between a key and it's label
			group = "+", -- symbol prepended to a group
		},
	},
	config = function()
		local wk = require("which-key")
		wk.register({
			d = { name = "debug" },
			f = { name = "files" },
			F = { name = "flutter" },
			T = { name = "tab" },
			w = { name = "vimWiki" },
			s = { name = "pane" },
			c = { name = "code" },
			i = { name = "iron" },
			j = { name = "jupynium" },
			t = { name = "Trouble" },
			n = { name = "note" },
		}, { prefix = "<leader>" })
	end,
}
