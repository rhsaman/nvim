return {
	"lukas-reineke/indent-blankline.nvim",
	event = "VeryLazy",
	main = "ibl",
	opts = {},

	config = function()
		local highlight = { "gray" }
		local hooks = require("ibl.hooks")

		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "gray", { fg = "#313030" })
		end)

		require("ibl").setup({
			scope = { enabled = false },
			indent = { highlight = highlight },
		})
	end,
}
