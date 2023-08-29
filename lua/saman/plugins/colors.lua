-- require("tokyonight").setup({
-- 	-- transparent = true,
-- 	dim_inactive = false,
-- })
--
-- vim.cmd("colorscheme tokyonight")

return {

	"morhetz/gruvbox",
	priority = 1000,
	function()
		vim.cmd("colorscheme gruvbox")
	end,
}
