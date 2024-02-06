return {
	"kevinhwang91/nvim-ufo",
	dependencies = "kevinhwang91/promise-async",

	config = function()
		vim.o.foldcolumn = "1"

		local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}

		for _, ls in ipairs(language_servers) do
			require("lspconfig")[ls].setup({
				capabilities = capabilities,
				-- you can add other fields for setting up lsp server in this table
			})
		end

		require("ufo").setup()
	end,
}
