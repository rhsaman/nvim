return {
	"rmagatti/auto-session",
	-- event = { "BufReadPre", "BufNewFile" },
	config = function()
		local auto_session = require("auto-session")

		auto_session.setup({

			auto_session_enable_last_session = false,
			auto_session_enabled = true,
			-- auto_restore_enabled = true,
			-- auto_save_enabled = true,
			auto_session_suppress_dirs = {
				"~/",
				"/",
				"~/Dev/",
				"~/Downloads",
				"~/Documents",
				"~/Desktop/",
			},
		})
	end,
}
