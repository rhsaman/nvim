return {
	"Vigemus/iron.nvim",
	config = function()
		local iron = require("iron.core")

		iron.setup({
			config = {
				-- Whether a repl should be discarded or not
				scratch_repl = true,
				-- Your repl definitions come here
				repl_definition = {
					sh = {
						command = { "zsh" },
					},
				},
				-- How the repl window will be displayed
				repl_open_cmd = require("iron.view").split.vertical("40%"),
			},
			-- Iron doesn't set keymaps by default anymore.
			-- You can set them here or manually add keymaps to the functions in iron.core
			keymaps = {
				send_motion = "<space>ic",
				visual_send = "<space>ic",
				send_file = "<space>if",
				send_line = "<space>il",
				send_until_cursor = "<space>iu",
				send_mark = "<space>im",
				mark_motion = "<space>imc",
				mark_visual = "<space>imc",
				remove_mark = "<space>imd",
				cr = "<space>is<cr>",
				interrupt = "<space>is<space>",
				exit = "<space>iq",
				clear = "<space>ix",
			},
			-- If the highlight is on, you can change how it looks
			-- For the available options, check nvim_set_hl
			highlight = {
				italic = true,
			},
			ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
		})

		-- iron also has a list of commands, see :h iron-commands for all available commands
		vim.keymap.set("n", "<space>iR", "<cmd>IronRepl<cr>")
		vim.keymap.set("n", "<space>iR", "<cmd>IronRestart<cr>")
		vim.keymap.set("n", "<space>iF", "<cmd>IronFocus<cr>")
		vim.keymap.set("n", "<space>ih", "<cmd>IronHide<cr>")
	end,
}
