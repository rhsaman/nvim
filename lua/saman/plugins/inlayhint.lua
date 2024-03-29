return {
	"lvimuser/lsp-inlayhints.nvim",
	-- event = "VeryLazy",
	ft = { "go", "rust" },

	keys = {
		{
			"<leader>ci",
			function()
				require("lsp-inlayhints").toggle()
			end,
			desc = "inlayhints toggle",
		},
	},

	config = function()
		require("lsp-inlayhints").setup()
		--lsp-inlayhints for show types
		vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
		vim.api.nvim_create_autocmd("LspAttach", {
			group = "LspAttach_inlayhints",
			callback = function(args)
				if not (args.data and args.data.client_id) then
					return
				end

				local bufnr = args.buf
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				require("lsp-inlayhints").on_attach(client, bufnr)
				vim.cmd("hi LspInlayHint ctermfg=71 guibg=#313325 ")
			end,
		})
	end,
}
