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
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "open tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "close tab" })
keymap.set("n", "<leader>tk", ":tabn<CR>", { desc = "next tab" })
keymap.set("n", "<leader>tj", ":tabp<CR>", { desc = "previous tab" })

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

-- dap ui
keymap.set("n", "<leader>du", "<Cmd>lua require('dapui').toggle()<CR>", { desc = "dap ui" })

-- flutter
keymap.set("n", "<leader>Fo", ":FlutterOutlineToggle<CR>", { desc = "Flutter Outline" })
keymap.set("n", "<leader>Fe", ":FlutterEmulators<CR>", { desc = "Flutter Emulators" })
keymap.set("n", "<leader>Fc", ":FlutterDetach<CR>", { desc = "Flutter Detach" })
keymap.set("n", "<leader>Fd", ":FlutterDevices<CR>", { desc = "Flutter Devices" })
keymap.set("n", "<leader>Fq", ":FlutterQuit<CR>", { desc = "Flutter Quit" })
keymap.set("n", "<leader>Fr", ":FlutterRun<CR>", { desc = "Flutter Run" })

-- molten
keymap.set("n", "<leader>mi", ":MoltenInit<CR>", { desc = "Init" })
keymap.set("n", "<leader>mI", ":MoltenInfo<CR>", { desc = "Info" })
keymap.set("n", "<leader>ml", ":MoltenEvaluateLine<CR>", { desc = "Eval Line" })
keymap.set("v", "<leader>mv", "::<C-u>MoltenEvaluateVisual<CR>", { desc = "Eval Visual" })
keymap.set("n", "<leader>mO", ":MoltenEvaluateOperator<CR>", { desc = "Eval Operator" })
keymap.set("n", "<leader>mo", ":MoltenShowOutput<CR>", { desc = "Show Output" })
keymap.set("n", "<leader>mh", ":MoltenHideOutput<CR>", { desc = "Hide Output" })
keymap.set("n", "<leader>me", "noautocmd MoltenEnterOutput<CR>", { desc = "Enter Output" })
keymap.set("n", "<leader>md", ":MoltenDeinit<CR>", { desc = "Deinit" })
keymap.set("n", "<leader>mD", ":MoltenDelete<CR>", { desc = "Delete" })

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
