return {
	"rmagatti/auto-session",
	config = function()
		local auto_session = require("auto-session")

		auto_session.setup({

			auto_session_enable_last_session = false,
			auto_session_enabled = true,
			-- auto_restore_enabled = false,
			-- auto_save_enabled = false,
			auto_session_suppress_dirs = {
				"~/",
				"/",
				"~/Dev/",
				"~/Downloads",
				"~/Documents",
				"~/Desktop/",
			},
		})

		-- local keymap = vim.keymap
		-- keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
		-- keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
	end,
}
