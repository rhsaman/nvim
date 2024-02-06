return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	priority = 0,
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			extensions = {
				frecency = {
					show_scores = true,
					show_unindexed = true,
					ignore_patterns = { "*.git/*", "*/tmp/*" },
					disable_devicons = false,
					workspace_scan_cmd = { "rg -.g '!.git' --files" },
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
		if insert then
			if self.sorting_strategy == "descending" then
				vim.api.nvim_buf_set_lines(self.results_bufnr, 0, 1, false, {})
			else
				vim.api.nvim_buf_set_lines(self.results_bufnr, self.max_results - 1, self.max_results, false, {})
			end
		end

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>fl", builtin.lsp_document_symbols, { desc = "list symbols" })
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "file" })
		vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "string" })
		vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "recent" })
		vim.keymap.set("n", "<leader>fk", builtin.lsp_references, { desc = "refrences" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "buffers" })
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "diagnostics" })
	end,
}
