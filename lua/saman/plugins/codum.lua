return {
	"Exafunction/codeium.vim",
	config = function()
		-- Change '<C-g>' here to any keycode you like.
		vim.keymap.set("i", "<c-t>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, silent = true })

		vim.keymap.set("i", "<c-n>", function()
			return vim.fn["codeium#CycleCompletions"](1)
		end, { expr = true, silent = true })

		vim.keymap.set("i", "<c-p>", function()
			return vim.fn["codeium#CycleCompletions"](-1)
		end, { expr = true, silent = true })

		vim.keymap.set("n", "<c-c>", function()
			return vim.fn["codeium#Clear"]()
		end, { expr = true, silent = true })

		vim.keymap.set("n", "<leader>cc", ":CodeiumChat<CR>", { desc = "ai chat" })
	end,
}
