return {
	"ahmedkhalf/jupyter-nvim",
	build = ":UpdateRemotePlugins",
	config = function()
		require("jupyter-nvim").setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		})
	end,
}
