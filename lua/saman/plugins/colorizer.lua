return {
	"norcalli/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		require("colorizer").setup({
			css = {

				mode = "background",
			},
			javascript = {

				mode = "background",
			},
			html = {
				mode = "background",
			},
		})
	end,
}
