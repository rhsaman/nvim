return {
	"ray-x/lsp_signature.nvim",
	event = "BufRead",
	config = function()
		local cfg = {
			transparency = 20, -- disabled by default, allow floating win transparent value 1~100
			shadow_blend = 36, -- if you using shadow as border use this set the opacity
			shadow_guibg = "Green", -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
			timer_interval = 201, -- default timer check interval set to lower value if you want to reduce latency
			toggle_key = "<c-o>", -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
			toggle_key_flip_floatwin_setting = true, -- true: toggle float setting after toggle key pressed
			select_signature_key = nil, -- cycle to next signature, e.g. '<M-n>' function overloading
			move_cursor_key = "<c-e>", -- imap, use nvim_set_current_win to move cursor between current win and floating
			auto_close_after = 4000,

			floating_window_off_x = 5, -- adjust float windows x position.
			floating_window_off_y = function() -- adjust float windows y position. e.g. set to -2 can make floating window move up 2 lines
				-- local linenr = vim.api.nvim_win_get_cursor(0)[1] -- buf line number
				local pumheight = vim.o.pumheight
				local winline = vim.fn.winline() -- line number in the window
				local winheight = vim.fn.winheight(0)

				-- window top
				if winline - 1 < pumheight then
					return pumheight
				end

				-- window bottom
				if winheight - winline < pumheight then
					return -pumheight
				end
				return 0
			end,
		}
		require("lsp_signature").setup(cfg) -- no need to specify bufnr if you don't use toggle_key

		vim.keymap.set({ "n" }, "<Leader>o", function()
			vim.lsp.buf.signature_help()
		end, { silent = true, noremap = true, desc = "toggle signature" })
	end,
}
