return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		vim.opt.termguicolors = true

		require("nvim-tree").setup({
			disable_netrw = true,
			hijack_netrw = true,
			open_on_tab = false,
			hijack_cursor = false,
			update_cwd = true,
			hijack_directories = {
				enable = true,
				auto_open = true,
			},
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,

				highlight_modified = "all",
				highlight_git = true,
				indent_markers = { enable = true },

				icons = {
					web_devicons = {
						file = {
							enable = true,
							color = true,
						},
						folder = {
							enable = true,
							color = false,
						},
					},
					show = { folder_arrow = false, file = true, folder = true, git = true },
					glyphs = {
						default = "",
						symlink = "",
						modified = "●",
						-- git = {
						-- 	unstaged = "M",
						-- 	staged = "S",
						-- 	unmerged = "UM",
						-- 	renamed = "R",
						-- 	deleted = "D",
						-- 	untracked = "",
						-- 	ignored = "◌",
						-- },
						folder = {
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
						},
					},
				},
			},
			filters = {
				dotfiles = true,
				git_clean = false,
				no_buffer = false,
				custom = {
					"node_modules", -- filter out node_modules directory
					".DS_Store",
					".python-version",
					".vscode",
				},
				exclude = {},
			},
			git = {
				enable = true,
				ignore = true,
				timeout = 500,
			},
			update_focused_file = {
				enable = true,
				update_cwd = true,
				ignore_list = {},
			},
			diagnostics = {
				enable = true,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},

			vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "toggle tree" }),
			vim.keymap.set("n", "<leader>z", "::NvimTreeCollapse<CR>", { desc = "collapse tree" }),
		})
	end,
}
