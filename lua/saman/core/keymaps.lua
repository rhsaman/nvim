vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jj", "<Esc>")

-- nohls
keymap.set("n", "<leader>h", "<cmd>nohls<cr>", { desc = "nohls" })

keymap.set("n", "<leader>|", "<C-w>v", { desc = "split |" })

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
keymap.set("n", "<leader>To", ":tabnew<CR>", { desc = "open tab" })
keymap.set("n", "<leader>Tx", ":tabclose<CR>", { desc = "close tab" })
keymap.set("n", "<leader>Tk", ":tabn<CR>", { desc = "next tab" })
keymap.set("n", "<leader>Tj", ":tabp<CR>", { desc = "previous tab" })
