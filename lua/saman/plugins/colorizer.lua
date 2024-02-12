return {
	"norcalli/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
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
