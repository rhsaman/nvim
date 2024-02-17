return {
	"ThePrimeagen/harpoon",
	event = "VeryLazy",
	keys = {
		{ "<leader>fh", ':lua require("harpoon.ui").toggle_quick_menu()<cr>', desc = "Menu harpoon" },
		{ "<leader>fm", ':lua require("harpoon.mark").add_file()<cr>', desc = "mark harpoon" },
		{ "<c-n>", ':lua require("harpoon.ui").nav_next()<cr>', desc = "Next harpoon" },
		{ "<c-p>", ':lua require("harpoon.ui").nav_prev()<cr>', desc = "Prev harpoon" },
	},
}
