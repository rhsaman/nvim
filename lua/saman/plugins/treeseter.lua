return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"windwp/nvim-ts-autotag",
			"HiPhish/nvim-ts-rainbow2",
			"nvim-treesitter/playground",
		},

		config = function()
			local treesitter = require("nvim-treesitter.configs")
			-- local rainbow = require("ts-rainbow")

			-- configure treesitter
			treesitter.setup({ -- enable syntax highlighting
				rainbow = {
					enable = true,
					query = {
						"rainbow-parens",
						html = "rainbow-tags",
						latex = "rainbow-blocks",
					},
					-- strategy = rainbow.strategy.global,
				},
				playground = {
					enable = true,
					disable = {},
					updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
					persist_queries = false, -- Whether the query persists across vim sessions
					keybindings = {
						toggle_query_editor = "o",
						toggle_hl_groups = "<leader>ti",
						toggle_injected_languages = "t",
						toggle_anonymous_nodes = "a",
						toggle_language_display = "I",
						focus_language = "f",
						unfocus_language = "F",
						update = "R",
						goto_node = "<cr>",
						show_help = "?",
					},
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				-- enable indentation
				indent = { enable = true },
				-- enable autotagging (w/ nvim-ts-autotag plugin)
				autotag = {
					enable = true,
				},
				-- ensure these language parsers are installed
				ensure_installed = {
					"json",
					"javascript",
					"typescript",
					-- "tsx",
					"yaml",
					"html",
					"css",
					-- "prisma",
					"markdown",
					"markdown_inline",
					-- "svelte",
					-- "graphql",
					"bash",
					"lua",
					"dockerfile",
					"vim",
					"gitignore",
					"query",
					-- "rust",
					"go",
					"dart",
				},

				incremental_selection = {
					enable = true,
				},
				-- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
				ts_context_commentstring = {
					enable = true,
					enable_autocmd = false,
					config = {
						javascript = {
							__default = "// %s",
							jsx_element = "{/* %s */}",
							jsx_fragment = "{/* %s */}",
							jsx_attribute = "// %s",
							comment = "// %s",
						},
					},
				},
			})
		end,
	},
}
