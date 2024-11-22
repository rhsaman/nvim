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

		-- Global Snippets
		-- luasnip.add_snippets("all", {
		-- 	luasnip.s(
		-- 		"func",
		-- 		luasnip.fmt("function {}({})\n  {}\nend", {
		-- 			luasnip.i(1, "function_name"), -- Placeholder for function name
		-- 			luasnip.i(2), -- Placeholder for parameters
		-- 			luasnip.i(3), -- Placeholder for body
		-- 		})
		-- 	),
		-- 	luasnip.s(
		-- 		"class",
		-- 		luasnip.fmt("class {}({})\n  {}\nend", {
		-- 			luasnip.i(1, "ClassName"), -- Placeholder for class name
		-- 			luasnip.i(2), -- Placeholder for parent class
		-- 			luasnip.i(3), -- Placeholder for class body
		-- 		})
		-- 	),
		-- 	luasnip.s(
		-- 		"forloop",
		-- 		luasnip.fmt("for {} = {}, {} do\n  {}\nend", {
		-- 			luasnip.i(1, "i"), -- Iterator
		-- 			luasnip.i(2, "1"), -- Start value
		-- 			luasnip.i(3, "10"), -- End value
		-- 			luasnip.i(4), -- Loop body
		-- 		})
		-- 	),
		-- 	luasnip.s(
		-- 		"ifelse",
		-- 		luasnip.fmt("if {} then\n  {}\nelse\n  {}\nend", {
		-- 			luasnip.i(1, "condition"), -- Placeholder for condition
		-- 			luasnip.i(2), -- Placeholder for "if" block
		-- 			luasnip.i(3), -- Placeholder for "else" block
		-- 		})
		-- 	),
		-- 	luasnip.s(
		-- 		"print",
		-- 		luasnip.fmt('print("{}")', { luasnip.i(1, "message") }) -- Placeholder for print message
		-- 	),
		-- })

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
				["<C-k>"] = cmp.mapping.select_prev_item(), -- Previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- Next suggestion
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-u>"] = cmp.mapping.scroll_docs(4),
				["<C-i>"] = cmp.mapping.complete(), -- Show suggestions
				["<C-e>"] = cmp.mapping.abort(), -- Close suggestions
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
			}), -- Sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- Snippets
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
