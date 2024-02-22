return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	priority = 0,
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local trouble = require("trouble.providers.telescope")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
					n = { ["<C-l>"] = trouble.open_with_trouble },
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
					":",
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
				buffers = {
					theme = "dropdown",
				},
				oldfiles = {
					theme = "dropdown",
				},
			},
		})

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>fl", builtin.lsp_document_symbols, { desc = "list symbols" })
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "file" })
		vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "string" })
		vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "recent" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "buffers" })
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "diagnostics" })
		vim.keymap.set("n", "<leader>fc", ":Telescope git_commits theme=dropdown<cr>", { desc = "git commints" })
		vim.keymap.set(
			"n",
			"<leader>fC",
			":Telescope git_bcommits theme=dropdown<cr>",
			{ desc = "git commints current file" }
		)
	end,
}
