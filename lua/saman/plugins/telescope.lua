return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-frecency.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	priority = 0,
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			extensions = {
				frecency = {
					db_root = "/Users/saman",
					show_scores = true,
					show_unindexed = true,
					ignore_patterns = { "*.git/*", "*/tmp/*" },
					disable_devicons = false,
					workspaces = {
						["conf"] = "/Users/saman/.config",
						["data"] = "/Users/saman/.local/share",
						["project"] = "/Users/saman/Documents/code",
						["wiki"] = "/Users/saman/wiki",
					},
				},
			},
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
				file_ignore_patterns = {
					".git",
					"node_modules",
					"mp4",
					"env",
					"jpg",
					"png",
					"cache",
					"hdf5",
					"woff",
					"woff2",
					"jpeg",
					"gif",
				},
			},
			pickers = {
				find_files = {
					theme = "dropdown",
				},

				lsp_references = {
					theme = "dropdown",
				},
				live_grep = {
					theme = "dropdown",
				},
				lsp_document_symbols = {
					theme = "dropdown",
				},
			},
		})
		telescope.load_extension("frecency")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>fl", builtin.lsp_document_symbols, { desc = "list symbols" })
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "file" })
		vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "string" })
		vim.keymap.set("n", "<leader>fr", "<Cmd>Telescope frecency theme=dropdown<CR>", { desc = "recent" })
		vim.keymap.set("n", "<leader>fk", builtin.lsp_references, { desc = "refrences" })
	end,
}
