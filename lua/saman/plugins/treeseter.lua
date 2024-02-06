return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"windwp/nvim-ts-autotag",
			"HiPhish/nvim-ts-rainbow2",
		},

		config = function()
			local treesitter = require("nvim-treesitter.configs")
			local rainbow = require("ts-rainbow")

			-- configure treesitter
			treesitter.setup({ -- enable syntax highlighting
				rainbow = {
					enable = true,
					query = {
						"rainbow-parens",
						html = "rainbow-tags",
						latex = "rainbow-blocks",
					},
					strategy = rainbow.strategy.global,
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
					-- "markdown_inline",
					-- "svelte",
					-- "graphql",
					"bash",
					"lua",
					"vim",
					"dockerfile",
					"gitignore",
					"query",
					-- "rust",
					"go",
					"dart",
				},

				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<leader>vi",
					},
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
