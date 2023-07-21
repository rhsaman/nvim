vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>e", ":Neotree toggle<cr>", { desc = "explorer" })
-- use jk to exit insert mode
keymap.set("i", "<leader>j", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- window management
keymap.set("n", "<leader>|", "<C-w>v", { desc = "split |" })
keymap.set("n", "<leader>-", "<C-w>s", { desc = "split -" })
keymap.set("n", "<leader>x", ":close<CR>", { desc = "close pane" })

------------------------resize window-----------------------
keymap.set("n", "<leader>sh", "<C-w>5<", { desc = "resize left" })
keymap.set("n", "<leader>sl", "<C-w>5>", { desc = "resize rught" })
keymap.set("n", "<leader>sk", "<C-w>5-", { desc = "resize up" })
keymap.set("n", "<leader>sj", "<C-w>5+", { desc = "resize down" })
keymap.set("n", "<leader>s=", "<C-w>=", { desc = "resize equal" })
-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", { desc = "maximization" })

-----------------------tabs-----------------------
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "open tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "close tab" })
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "next tab" })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "previous tab" })

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "file" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "string" })
keymap.set("n", "<leader>fS", "<cmd>Telescope grep_string<cr>", { desc = "grep" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "buffers" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "recent" })
keymap.set("n", "<leader>fc", "<cmd>Telescope colorscheme<cr>", { desc = "colorscheme" })

-- telescope git commands (not on youtube nvim video)
keymap.set(
	"n",
	"<leader>gc",
	"<cmd>Telescope git_commits<cr>",
	{ desc = "list all git commits (use <cr> to checkout)" }
)
keymap.set(
	"n",
	"<leader>gC",
	"<cmd>Telescope git_bcommits<cr>",
	{ desc = "list git commits for current file/buffer (use <cr> to checkout)" }
)
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "list git branches (use <cr> to checkout)" })
keymap.set(
	"n",
	"<leader>gs",
	"<cmd>Telescope git_status<cr>",
	{ desc = "list current changes per file with diff preview" }
)
