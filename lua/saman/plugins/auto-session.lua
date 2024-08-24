return {
	"rmagatti/auto-session",
	-- event = { "BufReadPre", "BufNewFile" },
	config = function()
		local auto_session = require("auto-session")

		auto_session.setup({
			silent_restore = true,
			-- auto_session_enable_last_session = true,
			auto_session_enabled = true,
			auto_save_enabled = true,
			auto_restore_enabled = true,
			log_level = "error",
			auto_session_suppress_dirs = {
				"~/",
				"/",
				"~/Dev/",
				"~/Documents",
				"~/code",
			},
		})
		-- vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
	end,
}
