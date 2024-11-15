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
		"hrsh7th/cmp-vsnip",
		"hrsh7th/vim-vsnip",
		"hrsh7th/vim-vsnip-integ",
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		local feedkey = function(key, mode)
			unpack = unpack or table.unpack
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
		end
		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					-- luasnip.lsp_expand(args.body)
					vim.fn["vsnip#anonymous"](args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-u>"] = cmp.mapping.scroll_docs(4),
				["<C-i>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = true }), --enter autocompletion
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif vim.fn["vsnip#jumpable"](1) == 1 then
						feedkey("<Plug>(vsnip-jump-next)", "")
					elseif has_words_before() then
						cmp.complete()
					else
						fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_prev_item()
					elseif vim.fn["vsnip#jumpable"](-1) == 1 then
						feedkey("<Plug>(vsnip-jump-prev)", "")
					end
				end, { "i", "s" }),
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "vsnip" }, -- text within current buffer
				{ name = "luasnip" }, -- snippets
			}, {
				{ name = "buffer" },
			}),
			-- configure lspkind for vs-code like pictograms in completion menu
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
