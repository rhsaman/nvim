return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	priority = 0,
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
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
				oldfiles = {
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

		telescope.load_extension("fzf")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>fl", builtin.lsp_document_symbols, { desc = "list symbols" })
		vim.keymap.set("n", "<leader>fd", builtin.find_files, { desc = "file" })
		vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "string" })
		vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "recent" })
		vim.keymap.set("n", "<leader>fk", builtin.lsp_references, { desc = "refrences" })
	end,
}
