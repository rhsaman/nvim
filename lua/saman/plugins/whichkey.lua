return {

	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>f", group = "file" }, -- group
			{ "<leader>d", group = "debug" },
			{ "<leader>g", group = "git" },
			{ "<leader>F", group = "flutter" },
			{ "<leader>T", group = "tab" },
			{ "<leader>w", group = "session" },
			{ "<leader>s", group = "pane" },
			{ "<leader>c", group = "code" },
			{ "<leader>j", group = "jupynium" },
			{ "<leader>t", group = "Trouble" },
		})
	end,
}
