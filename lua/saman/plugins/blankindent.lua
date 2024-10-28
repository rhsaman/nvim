return {
	"lukas-reineke/indent-blankline.nvim",
	lazy = true,
	event = "VeryLazy",
	main = "ibl",
	opts = {},

	config = function()
		local highlight = { "gray" }
		local hooks = require("ibl.hooks")

		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			--  cappuchino
			-- vim.api.nvim_set_hl(0, "gray", { fg = "#262538" })

			-- gruvebox
			-- vim.api.nvim_set_hl(0, "gray", { fg = "#2D2D2D" })

			-- rosepine
			vim.api.nvim_set_hl(0, "gray", { fg = "#22212F" })
		end)

		require("ibl").setup({
			scope = { enabled = false },
			indent = { highlight = highlight },
		})
	end,
}
