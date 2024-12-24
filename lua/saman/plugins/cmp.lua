return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"L3MON4D3/LuaSnip", -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- Load snippets
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,noselect",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- Previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- Next suggestion
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-u>"] = cmp.mapping.scroll_docs(4),
				["<C-o>"] = cmp.mapping.complete(), -- Show suggestions
				["<C-e>"] = cmp.mapping.abort(), -- Close suggestions
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
				-- Keep <Tab> as a fallback for default behavior
				["<Tab>"] = cmp.mapping(function(fallback)
					if luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback() -- Perform normal tabbing
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback() -- Perform normal shift-tabbing
					end
				end, { "i", "s" }),
			}), -- Sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				-- { name = "luasnip" }, -- Snippets
			}, {
				{ name = "buffer" },
			}),
			-- Formatting for pictograms
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol",
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		})
	end,
}
