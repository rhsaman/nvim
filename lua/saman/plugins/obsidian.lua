return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	event = {
		"BufReadPre ~/Documents/notes/saman/**.md",
		"BufNewFile ~/Documents/notes/saman/**.md",
	},
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {

		{ "<leader>os", ":ObsidianSearch<cr>", desc = "Search" },
		{ "<leader>ob", ":ObsidianLinkNew<cr>", desc = "New Link" },
		{ "<leader>on", ":ObsidianNew<cr>", desc = "New note" },
		{ "<leader>oo", ":ObsidianOpen<cr>", desc = "Open" },
		{ "<leader>oq", ":ObsidianQuickSwitch<cr>", desc = "Notes" },
		{ "<leader>or", ":ObsidianRename<cr>", desc = "Rename" },
		{ "<leader>ot", ":ObsidianTags<cr>", desc = "Tags" },
		{ "<leader>ol", ":ObsidianFollowLink<cr>", desc = "Go to Link" },
	},

	opts = {
		workspaces = {
			{
				name = "saman",
				path = "~/Documents/notes/saman",
			},
		},

		-- see below for full list of options 👇
		mappings = {
			-- Toggle check-boxes.
			["<leader>oc"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true },
				desc = "checkbox",
			},
		},

		note_id_func = function(title)
			local suffix = ""
			if title ~= nil then
				-- If title is given, transform it into valid file name.
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				-- If title is nil, just add 4 random uppercase letters to the suffix.
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return tostring(suffix)
		end,

		-- Optional, customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
		image_name_func = function()
			-- Prefix image names with timestamp.
			return string.format("%s-", os.time())
		end,

		-- Optional, boolean or a function that takes a filename and returns a boolean.
		-- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
		disable_fromatter = false,

		-- Optional, alternatively you can customize the frontmatter data.
		note_frontmatter_func = function(note)
			-- Add the title of the note as an alias.
			if note.title then
				note:add_alias(note.title)
			end

			local out = { id = note.id, aliases = note.aliases, tags = note.tags }

			-- `note.metadata` contains any manually added fields in the frontmatter.
			-- So here we just make sure those fields are kept in the frontmatter.
			if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
				for k, v in pairs(note.metadata) do
					out[k] = v
				end
			end

			return out
		end,

		-- Optional, customize the backlinks interface.
		backlinks = {
			-- The default height of the backlinks location list.
			height = 10,
			-- Whether or not to wrap lines.
			wrap = true,
		},

		-- Optional, customize the tags interface.
		tags = {
			-- The default height of the tags location list.
			height = 10,
			-- Whether or not to wrap lines.
			wrap = true,
		},

		-- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
		-- URL it will be ignored but you can customize this behavior here.
		follow_url_func = function(url)
			-- Open the URL in the default web browser.
			vim.fn.jobstart({ "open", url }) -- Mac OS
			-- vim.fn.jobstart({"xdg-open", url})  -- linux
		end,

		-- Optional, set to true if you use the Obsidian Advanced URI plugin.
		-- https://github.com/Vinzent03/obsidian-advanced-uri
		use_advanced_uri = false,

		-- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
		open_app_foreground = false,

		picker = {
			-- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', 'fzf.vim', or 'mini.pick'.
			name = "telescope.nvim",
			-- Optional, configure key mappings for the picker. These are the defaults.
			-- Not all pickers support these.
			mappings = {
				-- Create a new note from your query.
				new = "<C-x>",
				-- Insert a link to the selected note.
				insert_link = "<C-l>",
			},
		},
		open_notes_in = "current",

		-- Optional, configure additional syntax highlighting / extmarks.
		-- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
		ui = {
			enable = true, -- set to false to disable all additional syntax features
			update_debounce = 200, -- update delay after a text change (in milliseconds)
			-- Define how various check-boxes are displayed
			checkboxes = {
				-- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
				[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
				["x"] = { char = "", hl_group = "ObsidianDone" },
				[">"] = { char = "", hl_group = "ObsidianRightArrow" },
				["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
				-- Replace the above with this if you don't have a patched font:
				-- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
				-- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

				-- You can also add more custom ones...
			},
			-- Use bullet marks for non-checkbox lists.
			bullets = { char = "•", hl_group = "ObsidianBullet" },
			external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
			-- Replace the above with this if you don't have a patched font:
			-- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
			reference_text = { hl_group = "ObsidianRefText" },
			highlight_text = { hl_group = "ObsidianHighlightText" },
			tags = { hl_group = "ObsidianTag" },
			hl_groups = {
				-- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
				ObsidianTodo = { bold = true, fg = "#f78c6c" },
				ObsidianDone = { bold = true, fg = "#89ddff" },
				ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
				ObsidianTilde = { bold = true, fg = "#ff5370" },
				ObsidianBullet = { bold = true, fg = "#89ddff" },
				ObsidianRefText = { underline = true, fg = "#c792ea" },
				ObsidianExtLinkIcon = { fg = "#c792ea" },
				ObsidianTag = { italic = true, fg = "#89ddff" },
				ObsidianHighlightText = { bg = "#75662e" },
			},
		},

		-- attachments = {
		-- 	img_folder = "assets/imgs", -- This is the default
		-- 	img_text_func = function(client, path)
		-- 		local link_path
		-- 		local vault_relative_path = client:vault_relative_path(path)
		-- 		if vault_relative_path ~= nil then
		-- 			-- Use relative path if the image is saved in the vault dir.
		-- 			link_path = vault_relative_path
		-- 		else
		-- 			-- Otherwise use the absolute path.
		-- 			link_path = tostring(path)
		-- 		end
		-- 		local display_name = vim.fs.basename(link_path)
		-- 		return string.format("![%s](%s)", display_name, link_path)
		-- 	end,
		-- },

		yaml_parser = "native",
	},
}
