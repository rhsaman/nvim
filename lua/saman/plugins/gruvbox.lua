return {
	-- "catppuccin/nvim",
	-- name = "catppuccin",
	-- priority = 1000,
	-- config = function()
	-- 	require("catppuccin").setup({
	-- 		flavour = "macchiato", -- latte, frappe, macchiato, mocha
	-- 		background = { -- :h background
	-- 			light = "latte",
	-- 			dark = "mocha",
	-- 		},
	-- 		transparent_background = true, -- disables setting the background color.
	-- 		show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
	-- 		term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
	-- 		dim_inactive = {
	-- 			enabled = false, -- dims the background color of inactive window
	-- 			shade = "dark",
	-- 			percentage = 0.15, -- percentage of the shade to apply to the inactive window
	-- 		},
	-- 		no_italic = false, -- Force no italic
	-- 		no_bold = false, -- Force no bold
	-- 		no_underline = false, -- Force no underline
	-- 		styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
	-- 			comments = { "italic" }, -- Change the style of comments
	-- 			conditionals = { "italic" },
	-- 			loops = {},
	-- 			functions = {},
	-- 			keywords = {},
	-- 			strings = {},
	-- 			variables = {},
	-- 			numbers = {},
	-- 			booleans = {},
	-- 			properties = {},
	-- 			types = {},
	-- 			operators = {},
	-- 		},
	-- 		color_overrides = {},
	-- 		custom_highlights = {},
	-- 		integrations = {
	-- 			ufo = true,
	-- 			flash = true,
	-- 			cmp = true,
	-- 			gitsigns = true,
	-- 			nvimtree = true,
	-- 			treesitter = true,
	-- 			notify = true,
	-- 			mason = true,
	-- 			dap = true,
	-- 			ts_rainbow = true,
	-- 			which_key = true,
	-- 			dap_ui = true,
	-- 			markdown = true,
	-- 			indent_blankline = {
	-- 				enabled = true,
	-- 				scope_color = "",
	-- 				colored_indent_levels = false,
	-- 			},
	-- 			telescope = {
	-- 				enabled = true,
	-- 				-- style = "nvchad"
	-- 			},
	-- 			mini = {
	-- 				enabled = false,
	-- 				indentscope_color = "",
	-- 			},
	-- 		},
	-- 	})
	-- 	vim.cmd.colorscheme("catppuccin")
	-- end,

	"sainnhe/gruvbox-material",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("gruvbox-material")

		-- markdown ui
		vim.cmd("hi @markup.raw.delimiter guifg=gray")
		vim.cmd("hi @conceal guifg=gray")
		vim.cmd("hi @h1 guifg=#B4D797")
		vim.cmd("hi @head guifg=white")
		vim.cmd("hi @title guifg=white")
	end,
}
