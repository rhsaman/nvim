local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "saman.plugins" }, { import = "saman.plugins.lsp" } }, {
	install = {
		colorscheme = { "nightfly" },
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
-- require("lazy").setup({
-- 	{
-- 		"nvim-telescope/telescope.nvim",
-- 		tag = "0.1.0",
-- 		dependencies = { { "nvim-lua/plenary.nvim" } },
-- 	},
-- 	{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
-- 	{
-- 		"nvim-treesitter/nvim-treesitter",
-- 		run = function()
-- 			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
-- 			ts_update()(":TSUpdate")
-- 		end,
-- 	},
-- 	"nvim-treesitter/playground",
-- 	"nvim-treesitter/nvim-treesitter-context",
-- 	"JoosepAlviste/nvim-ts-context-commentstring",
-- 	{
-- 		"nvim-neo-tree/neo-tree.nvim",
-- 		branch = "v3.x",
-- 		dependencies = {
-- 			"nvim-lua/plenary.nvim",
-- 			"nvim-tree/nvim-web-devicons",
-- 			"MunifTanjim/nui.nvim",
-- 		},
-- 	},
-- 	{
-- 		"hrsh7th/nvim-cmp",
-- 		event = "InsertEnter",
-- 		dependencies = {
-- 			"hrsh7th/cmp-buffer",
-- 			"hrsh7th/cmp-path",
-- 			"L3MON4D3/LuaSnip",
-- 			"saadparwaiz1/cmp_luasnip",
-- 			"rafamadriz/friendly-snippets",
-- 		},
-- 	},
-- 	"williamboman/mason.nvim",
-- 	"williamboman/mason-lspconfig.nvim",
-- 	"neovim/nvim-lspconfig",
-- 	"hrsh7th/cmp-nvim-lsp",
-- 	{
-- 		"glepnir/lspsaga.nvim",
-- 		branch = "main",
-- 		dependencies = {
-- 			{ "nvim-tree/nvim-web-devicons" },
-- 			{ "nvim-treesitter/nvim-treesitter" },
-- 		},
-- 	},
-- 	"jose-elias-alvarez/typescript.nvim",
-- 	"onsails/lspkind.nvim",
-- 	"jose-elias-alvarez/null-ls.nvim",
-- 	"jayp0521/mason-null-ls.nvim",
-- 	"windwp/nvim-autopairs",
-- 	{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }, -- autoclose tags
-- 	"lewis6991/gitsigns.nvim", -- show line modifications on left hand side
-- 	"nvim-lualine/lualine.nvim",
-- 	"nvim-tree/nvim-web-devicons",
-- 	"szw/vim-maximizer", -- maximizes and restores current window
-- 	"tpope/vim-surround", -- add, delete, change surroundings (it's awesome)
-- 	"inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion)
-- 	"christoomey/vim-tmux-navigator", -- tmux & split window navigation
-- 	"nvim-lua/plenary.nvim", -- lua functions that many plugins
-- 	"folke/tokyonight.nvim",
-- 	{
-- 		"morhetz/gruvbox",
-- 	},
--
-- 	{
-- 		"numToStr/Comment.nvim",
-- 		event = { "BufReadPre", "BufNewFile" },
-- 		config = true,
-- 	},
-- 	"easymotion/vim-easymotion",
-- 	{
-- 		"folke/which-key.nvim",
-- 	},
-- 	"tpope/vim-fugitive",
-- 	"rust-lang/rust.vim",
-- 	"lvimuser/lsp-inlayhints.nvim",
-- 	{
-- 		"rmagatti/auto-session",
-- 		config = function()
-- 			require("auto-session").setup({
-- 				log_level = "error",
-- 				auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
-- 			})
-- 		end,
-- 	},
-- 	"lukas-reineke/indent-blankline.nvim",
-- }, {
-- 	checker = {
-- 		enabled = true,
-- 		notify = false,
-- 	},
-- 	change_detection = {
-- 		notify = false,
-- 	},
-- })
