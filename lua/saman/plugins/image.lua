return {
	"3rd/image.nvim",
	config = function()
		package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
		package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

		local imb = function(e) -- init molten buffer
			vim.schedule(function()
				local kernels = vim.fn.MoltenAvailableKernels()
				local try_kernel_name = function()
					local metadata = vim.json.decode(io.open(e.file, "r"):read("a"))["metadata"]
					return metadata.kernelspec.name
				end
				local ok, kernel_name = pcall(try_kernel_name)
				if not ok or not vim.tbl_contains(kernels, kernel_name) then
					kernel_name = nil
					local venv = os.getenv("VIRTUAL_ENV")
					if venv ~= nil then
						kernel_name = string.match(venv, "/.+/(.+)")
					end
				end
				if kernel_name ~= nil and vim.tbl_contains(kernels, kernel_name) then
					vim.cmd(("MoltenInit %s"):format(kernel_name))
				end
				vim.cmd("MoltenImportOutput")
			end)
		end

		-- automatically import output chunks from a jupyter notebook
		vim.api.nvim_create_autocmd("BufAdd", {
			pattern = { "*.ipynb" },
			callback = imb,
		})

		-- we have to do this as well so that we catch files opened like nvim ./hi.ipynb
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = { "*.ipynb" },
			callback = function(e)
				if vim.api.nvim_get_vvar("vim_did_enter") ~= 1 then
					imb(e)
				end
			end,
		})

		require("image").setup({
			backend = "kitty",
			integrations = {
				markdown = {
					enabled = true,
					clear_in_insert_mode = false,
					download_remote_images = true,
					only_render_image_at_cursor = false,
					filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
				},
				neorg = {
					enabled = true,
					clear_in_insert_mode = false,
					download_remote_images = true,
					only_render_image_at_cursor = false,
					filetypes = { "norg" },
				},
			},
			max_width = 100,
			max_height = nil,
			max_width_window_percentage = nil,
			max_height_window_percentage = 50,
			window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
			editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
			tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
			hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" }, -- render image files as images when opened
		})

		-- automatically export output chunks to a jupyter notebook on write
		vim.api.nvim_create_autocmd("BufWritePost", {
			pattern = { "*.ipynb" },
			callback = function()
				if require("molten.status").initialized() == "Molten" then
					vim.cmd("MoltenExportOutput!")
				end
			end,
		})

		-- vim.api.nvim_create_autocmd("BufEnter", {
		-- 	pattern = "*.py",
		-- 	callback = function(e)
		-- 		if string.match(e.file, ".otter.") then
		-- 			return
		-- 		end
		-- 		if require("molten.status").initialized() == "Molten" then -- this is kinda a hack...
		-- 			vim.fn.MoltenUpdateOption("virt_lines_off_by_1", false)
		-- 			vim.fn.MoltenUpdateOption("virt_text_output", false)
		-- 		else
		-- 			vim.g.molten_virt_lines_off_by_1 = false
		-- 			vim.g.molten_virt_text_output = false
		-- 		end
		-- 	end,
		-- })

		-- Undo those config changes when we go back to a markdown or quarto file
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = { "*.qmd", "*.md", "*.ipynb" },
			callback = function(e)
				if string.match(e.file, ".otter.") then
					return
				end
				if require("molten.status").initialized() == "Molten" then
					vim.fn.MoltenUpdateOption("virt_lines_off_by_1", true)
					vim.fn.MoltenUpdateOption("virt_text_output", true)
				else
					vim.g.molten_virt_lines_off_by_1 = true
					vim.g.molten_virt_text_output = true
				end
			end,
		})
	end,
}
