return {
	"vimwiki/vimwiki",
	init = function()
		vim.g.vimwiki_list = {
			{
				path = "~/Documents/notes",
				syntax = "default",
				ext = ".wiki",
			},
		}
	end,
}
