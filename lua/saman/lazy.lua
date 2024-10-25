local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
	{ { import = "saman.plugins" }, { import = "saman.plugins.lsp" }, { import = "saman.plugins.daps" } },
	{
		checker = {
			enabled = true,
			notify = false,
		},
		change_detection = {
			notify = false,
		},
	}
)

-- local nsn = vim.api.nvim_get_namespaces()
--
-- local counts = {}
--
-- for name, ns in pairs(nsn) do
-- 	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
-- 		local count = #vim.api.nvim_buf_get_extmarks(buf, ns, 0, -1, {})
-- 		if count > 0 then
-- 			counts[#counts + 1] = {
-- 				name = name,
-- 				buf = buf,
-- 				count = count,
-- 				ft = vim.bo[buf].ft,
-- 			}
-- 		end
-- 	end
-- end
-- table.sort(counts, function(a, b)
-- 	return a.count > b.count
-- end)
-- vim.print(counts)
