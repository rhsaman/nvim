return {
	"sainnhe/gruvbox-material",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("gruvbox-material")

		-- markdown ui
		vim.cmd("hi @markup.raw.delimiter guifg=gray")
		vim.cmd("hi @conceal guifg=gray")
		vim.cmd("hi @h1 guifg=#B4D797")
		vim.cmd("hi @head guifg=white")
		vim.cmd("hi @title guifg=white")

		-- fold color
		vim.cmd("hi Folded guibg=#9F834D guifg=black")
	end,
}
