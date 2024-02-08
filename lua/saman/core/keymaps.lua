vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jj", "<Esc>")

-- nohls
keymap.set("n", "<leader>n", "<cmd>nohls<cr>", { desc = "nohls" })

-- inlayhints
keymap.set("n", "<leader>ci", function()
	require("lsp-inlayhints").toggle()
end, { desc = "inlayhints toggle" })

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

-- flutter
keymap.set("n", "<leader>Fo", ":FlutterOutlineToggle<CR>", { desc = "Flutter Outline" })
keymap.set("n", "<leader>Fe", ":FlutterEmulators<CR>", { desc = "Flutter Emulators" })
keymap.set("n", "<leader>Fc", ":FlutterDetach<CR>", { desc = "Flutter Detach" })
keymap.set("n", "<leader>Fd", ":FlutterDevices<CR>", { desc = "Flutter Devices" })
keymap.set("n", "<leader>Fq", ":FlutterQuit<CR>", { desc = "Flutter Quit" })
keymap.set("n", "<leader>Fr", ":FlutterRun<CR>", { desc = "Flutter Run" })

-- jupynium
keymap.set("n", "<leader>jS", ":JupyniumStartSync<CR>", { desc = "Start Sync" })
keymap.set("n", "<leader>jq", ":JupyniumStopSync<CR>", { desc = "Stop Sync" })
keymap.set("n", "<leader>ja", ":JupyniumStartAndAttachToServer<CR>", { desc = "Start and Attach to Server" })
keymap.set("n", "<leader>jx", ":JupyniumExecuteSelectedCells<CR>", { desc = "Execute Cell" })
keymap.set("n", "<leader>jf", ":JupyniumShortsightedToggle<CR>", { desc = "Shortsighted Toggle" })
keymap.set("n", "<leader>ju", ":JupyniumScrollUp<CR>", { desc = "Scroll Up" })
keymap.set("n", "<leader>jd", ":JupyniumScrollDown<CR>", { desc = "Scroll Down" })
keymap.set("n", "<leader>jr", ":JupyniumRestartKernel<CR>", { desc = "Restart Kernel" })
keymap.set("n", "<leader>jn", "I# %%<Esc>", { desc = "New Cell" })

-- bufferLine
keymap.set("n", "th", ":BufferLineCloseLeft<cr>", { desc = "Close Left" })
keymap.set("n", "tr", ":BufferLineCloseRight<cr>", { desc = "Close Right" })
keymap.set("n", "to", ":BufferLineCloseOthers<cr>", { desc = "Close Others" })
keymap.set("n", "L", ":BufferLineCycleNext<cr>", { desc = "Next" })
keymap.set("n", "H", ":BufferLineCyclePrev<cr>", { desc = "Preview" })
keymap.set("n", "tp", ":BufferLinePick<cr>", { desc = "Pick" })
