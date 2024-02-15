return {
	"ThePrimeagen/harpoon",
	event = "VeryLazy",
	keys = {
		{ "<c-h>", ':lua require("harpoon.ui").toggle_quick_menu()<cr>', desc = "Menu harpoon" },
		{ "<c-m>", ':lua require("harpoon.mark").add_file()<cr>', desc = "mark harpoon" },
		{ "<c-n>", ':lua require("harpoon.ui").nav_next()<cr>', desc = "Next harpoon" },
		{ "<c-p>", ':lua require("harpoon.ui").nav_prev()<cr>', desc = "Prev harpoon" },
	},
}
