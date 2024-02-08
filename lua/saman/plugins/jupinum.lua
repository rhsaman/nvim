return {
	"kiyoon/jupynium.nvim",
	build = "pip3 install --user .",
	default_notebook_URL = "localhost:8888/tree",

	ft = { "python", "ipynb" },

	-- jupynium
	vim.keymap.set("n", "<leader>jS", ":JupyniumStartSync<CR>", { desc = "Start Sync" }),
	vim.keymap.set("n", "<leader>jq", ":JupyniumStopSync<CR>", { desc = "Stop Sync" }),
	vim.keymap.set("n", "<leader>ja", ":JupyniumStartAndAttachToServer<CR>", { desc = "Start and Attach to Server" }),
	vim.keymap.set("n", "<leader>jx", ":JupyniumExecuteSelectedCells<CR>", { desc = "Execute Cell" }),
	vim.keymap.set("n", "<leader>jf", ":JupyniumShortsightedToggle<CR>", { desc = "Shortsighted Toggle" }),
	vim.keymap.set("n", "<leader>ju", ":JupyniumScrollUp<CR>", { desc = "Scroll Up" }),
	vim.keymap.set("n", "<leader>jd", ":JupyniumScrollDown<CR>", { desc = "Scroll Down" }),
	vim.keymap.set("n", "<leader>jr", ":JupyniumRestartKernel<CR>", { desc = "Restart Kernel" }),
	vim.keymap.set("n", "<leader>jn", "I# %%<Esc>", { desc = "New Cell" }),
}
