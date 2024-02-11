return {
	"kevinhwang91/nvim-ufo",
	dependencies = "kevinhwang91/promise-async",
	-- event = "VeryLazy",

	config = function()
		vim.o.foldcolumn = "2"
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}

		for _, ls in ipairs(language_servers) do
			require("lspconfig")[ls].setup({
				capabilities = capabilities,
			})
		end

		require("ufo").setup()
	end,
}
