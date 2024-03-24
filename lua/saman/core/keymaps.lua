vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jj", "<Esc>")

-- nohls
keymap.set("n", "<leader>h", "<cmd>nohls<cr>", { desc = "nohls" })

-- neotree
vim.keymap.set("n", "<leader>e", ":Neotree float reveal_force_cwd<cr>", { desc = "Neotree" })

-- autoSession
keymap.set("n", "<leader>wr", ":SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
keymap.set("n", "<leader>ws", ":SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory

-- lsp
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "See available code actions" }) -- see available code actions, in visual mode will apply to selection
keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Show LSP type definitions" }) -- show lsp type definitions
keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP references" }) -- show definition, references
keymap.set("n", "R", vim.lsp.buf.hover, { desc = "Show documentation for what is under cursor" }) -- show documentation for what is under cursor
keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" }) -- go to declaration

------------------------resize window-----------------------
-- keymap.set("n", "<leader>sh", "<C-w>10<", { desc = "resize left" })
-- keymap.set("n", "<leader>sl", "<C-w>10>", { desc = "resize rught" })
-- keymap.set("n", "<leader>sk", "<C-w>10-", { desc = "resize up" })
-- keymap.set("n", "<leader>sj", "<C-w>10+", { desc = "resize down" })
-- keymap.set("n", "<leader>s=", "<C-w>=", { desc = "resize equal" })
-- window management
-- keymap.set("n", "<leader>|", "<C-w>v", { desc = "split |" })
-- keymap.set("n", "<leader>-", "<C-w>s", { desc = "split -" })
-- keymap.set("n", "<leader>x", ":close<CR>", { desc = "close pane" })
-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", { desc = "maximization" })

-----------------------tabs-----------------------
-- keymap.set("n", "<leader>To", ":tabnew<CR>", { desc = "open tab" })
-- keymap.set("n", "<leader>Tx", ":tabclose<CR>", { desc = "close tab" })
-- keymap.set("n", "<leader>Tk", ":tabn<CR>", { desc = "next tab" })
-- keymap.set("n", "<leader>Tj", ":tabp<CR>", { desc = "previous tab" })

-- telescope git commands (not on youtube nvim video)
keymap.set(
	"n",
	"<leader>gsc",
	"<cmd>Telescope git_commits<cr>",
	{ desc = "list all git commits (use <cr> to checkout)" }
)
keymap.set(
	"n",
	"<leader>gsC",
	"<cmd>Telescope git_bcommits<cr>",
	{ desc = "list git commits for current file/buffer (use <cr> to checkout)" }
)
keymap.set("n", "<leader>gsb", "<cmd>Telescope git_branches<cr>", { desc = "list git branches (use <cr> to checkout)" })
keymap.set(
	"n",
	"<leader>gss",
	"<cmd>Telescope git_status<cr>",
	{ desc = "list current changes per file with diff preview" }
)
