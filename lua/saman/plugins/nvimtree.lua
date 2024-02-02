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
				icons = {
					webdev_colors = true,
					show = { folder_arrow = false, file = true, folder = true, git = true },
					-- indent_markers = { enable = true },
					glyphs = {
						default = "",
						symlink = "",
						git = {
							unstaged = "U",
							staged = "S",
							unmerged = "UM",
							renamed = "R",
							deleted = "D",
							untracked = "",
							ignored = "I",
						},
						folder = {
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
						},
					},
				},
				indent_markers = { enable = true },
			},
			filters = {
				dotfiles = false,
				git_clean = false,
				no_buffer = false,
				custom = {
					"node_modules", -- filter out node_modules directory
					".git", -- filter out .git directory
					".DS_Store",
				},
				exclude = {},
			},
			git = {
				enable = true,
				ignore = true,
				timeout = 500,
			},
			disable_netrw = true,
			hijack_netrw = true,
			--open_on_setup = false,
			open_on_tab = false,
			hijack_cursor = false,
			update_cwd = true,
			hijack_directories = {
				enable = true,
				auto_open = true,
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
			}, -- on_attach = my_on_attach,
			vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "toggle tree" }),
			vim.keymap.set("n", "zz", "::NvimTreeCollapse<CR>", { desc = "collapse tree" }),
		})
	end,
}
