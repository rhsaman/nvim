return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			top_down = false,
			stages = "slide",
			timeout = 1000,
			render = "compact",
			fps = 30,
			icons = {
				DEBUG = "",
				ERROR = "",
				INFO = "",
				TRACE = "✎",
				WARN = "",
			},
		})
	end,
}
