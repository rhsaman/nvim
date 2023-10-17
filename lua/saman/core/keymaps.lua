vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>w", ":Neotree toggle<cr>", { desc = "explorer close" })
keymap.set("n", "<leader>e", ":Neotree filesystem reveal<cr>", { desc = "explorer open" })
keymap.set("i", "jj", "<Esc>")

-----------------test---------------------
keymap.set("n", "<leader>c", "<cmd>!sh %<cr>", { desc = "curl" })

-- window management
keymap.set("n", "<leader>|", "<C-w>v", { desc = "split |" })
keymap.set("n", "<leader>-", "<C-w>s", { desc = "split -" })
keymap.set("n", "<leader>x", ":close<CR>", { desc = "close pane" })

------------------------resize window-----------------------
keymap.set("n", "<leader>sh", "<C-w>10<", { desc = "resize left" })
keymap.set("n", "<leader>sl", "<C-w>10>", { desc = "resize rught" })
keymap.set("n", "<leader>sk", "<C-w>10-", { desc = "resize up" })
keymap.set("n", "<leader>sj", "<C-w>10+", { desc = "resize down" })
keymap.set("n", "<leader>s=", "<C-w>=", { desc = "resize equal" })
-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", { desc = "maximization" })

-----------------------tabs-----------------------
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "open tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "close tab" })
keymap.set("n", "<leader>tk", ":tabn<CR>", { desc = "next tab" })
keymap.set("n", "<leader>tj", ":tabp<CR>", { desc = "previous tab" })

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files theme=dropdown<cr>", { desc = "file" })
keymap.set("n", "<leader>fh", "<cmd>Telescope find_files theme=dropdown hidden=true<cr>", { desc = "hidden file" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep theme=dropdown <cr>", { desc = "string" })
keymap.set("n", "<leader>fS", "<cmd>Telescope grep_string theme=dropdown <cr>", { desc = "grep" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers theme=dropdown <cr>", { desc = "buffers" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles theme=dropdown<cr>", { desc = "recent" })
keymap.set("n", "<leader>fc", "<cmd>Telescope colorscheme<cr>", { desc = "colorscheme" })
keymap.set("n", "<leader>fk", "<cmd> Telescope lsp_references theme=dropdown<cr>", { desc = "refrences" })
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
-------------------------------git fugitive----------------------------
keymap.set("n", "<leader>gi", "<cmd>:Git<cr>", { desc = "fugitive" })


---------function helper------------------------
keymap.set("i", "<C-h>", function()
	vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = "toggle signature" })
keymap.set({ "n" }, "<Leader>k", function()
	vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = "toggle signature" })

-- comment  jsx
