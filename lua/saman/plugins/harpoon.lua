return {
	"ThePrimeagen/harpoon",
	event = "VeryLazy",
	keys = {
		{ "hm", ':lua require("harpoon.mark").add_file()<cr>', desc = "mark harpoon" },
		{ "hs", ':lua require("harpoon.ui").toggle_quick_menu()<cr>', desc = "Menu harpoon" },
		{ "hn", ':lua require("harpoon.ui").nav_next()<cr>', desc = "Next harpoon" },
		{ "hp", ':lua require("harpoon.ui").nav_prev()<cr>', desc = "Prev harpoon" },
	},
}
