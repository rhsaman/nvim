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

			treesitter.setup({
				rainbow = {
					enable = true,
					query = {
						"rainbow-parens",
						html = "rainbow-tags",
						latex = "rainbow-blocks",
					},
					-- strategy = rainbow.strategy.global,
				},

				highlight = { enable = true },

				auto_install = true,

				indent = { enable = true },

				incremental_selection = {
					enable = true,
				},

				-- autotag
				require("nvim-treesitter.configs").setup({
					autotag = {
						enable = true,
						enable_rename = true,
						enable_close = true,
						enable_close_on_slash = true,
						filetypes = {
							"html",
							"javascript",
							"typescript",
							"javascriptreact",
							"typescriptreact",
							"svelte",
							"vue",
							"tsx",
							"jsx",
							"rescript",
							"xml",
							"php",
							"markdown",
							"astro",
							"glimmer",
							"handlebars",
							"hbs",
						},
						skip_tags = {
							"area",
							"base",
							"br",
							"col",
							"command",
							"embed",
							"hr",
							"img",
							"slot",
							"input",
							"keygen",
							"link",
							"meta",
							"param",
							"source",
							"track",
							"wbr",
							"menuitem",
						},
					},
				}),

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
				-- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
			})
		end,
	},
}
