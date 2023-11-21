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
			-- import nvim-treesitter plugin
			local treesitter = require("nvim-treesitter.configs")
			local rainbow = require("ts-rainbow")

			-- configure treesitter
			treesitter.setup({ -- enable syntax highlighting
				highlight = {
					enable = true,
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
					"vim",
					-- "dockerfile",
					"gitignore",
					"query",
					-- "rust",
					"go",
					"dart",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
				-- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
				context_commentstring = {
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
				rainbow = {
					query = {
						"rainbow-parens",
						html = "rainbow-tags",
						latex = "rainbow-blocks",
					},
					strategy = rainbow.strategy.global,
					hlgroups = {
						"TSRainbowCyan",
						"TSRainbowYellow",
						"TSRainbowRed",
						"TSRainbowBlue",
						"TSRainbowViolet",
						"TSRainbowOrange",
						"TSRainbowGreen",
					},
				},
			})
			vim.cmd("autocmd VimEnter * TSBufEnable rainbow")
		end,
	},
}
