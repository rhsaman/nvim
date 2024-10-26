return {
	"Exafunction/codeium.vim",
	config = function()
		-- Change '<C-g>' here to any keycode you like.
		vim.keymap.set("i", "<c-CR>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, silent = true })

		vim.keymap.set("i", "<c-j>", function()
			return vim.fn["codeium#CycleCompletions"](1)
		end, { expr = true, silent = true })

		vim.keymap.set("i", "<c-k>", function()
			return vim.fn["codeium#CycleCompletions"](-1)
		end, { expr = true, silent = true })

		vim.keymap.set("i", "<c-x>", function()
			return vim.fn["codeium#Clear"]()
		end, { expr = true, silent = true })

		vim.keymap.set("n", "<leader>cc", ":CodeiumChat<CR>", { desc = "ai chat" })
	end,
}
