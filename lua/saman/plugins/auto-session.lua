return {
	"rmagatti/auto-session",
	-- event = { "BufReadPre", "BufNewFile" },
	config = function()
		local auto_session = require("auto-session")

		auto_session.setup({
			silent_restore = true,
			bypass_session_save_file_types = nil, -- table: Bypass auto save when only buffer open is one of these file types, useful to ignore dashboards
			close_unsupported_windows = true, -- boolean: Close windows that aren't backed by normal file
			cwd_change_handling = { -- table: Config for handling the DirChangePre and DirChanged autocmds, can be set to nil to disable altogether
				restore_upcoming_session = false, -- boolean: restore session for upcoming cwd on cwd change
				pre_cwd_changed_hook = nil, -- function: This is called after auto_session code runs for the `DirChangedPre` autocmd
				post_cwd_changed_hook = nil, -- function: This is called after auto_session code runs for the `DirChanged` autocmd
			},

			auto_session_enable_last_session = true,
			auto_session_enabled = true,
			auto_save_enabled = true,
			auto_restore_enabled = true,
			auto_session_allowed_dirs = nil,
			auto_session_create_enabled = true,
			auto_session_use_git_branch = false,
			auto_restore_lazy_delay_enabled = true,
			log_level = "error",
			auto_session_suppress_dirs = {
				"~/",
				"/",
				"~/Dev/",
				"~/Documents",
				"~/code",
			},
		})
		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
	end,
}
