local opt = vim.opt -- for conciseness
-- line numbers
opt.relativenumber = false -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = false -- highlight the current cursor line

opt.termguicolors = true

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- rust auto save
-- vim.g.rustfmt_autosave = 1

vim.g.python3_host_prog = "/Users/saman/.pyenv/shims/python3"

-- workdir
vim.cmd([[
augroup cdpwd
    autocmd!
    autocmd VimEnter * cd $PWD
augroup END
]])

-- gruvbox
-- vim.cmd("let g:gruvbox_material_background = 'hard'")
-- vim.cmd("let g:gruvbox_material_better_performance = 1")
-- vim.cmd("let g:gruvbox_material_enable_bold = 1")
-- vim.cmd("let g:gruvbox_material_diagnostic_line_highlight = 1")

vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = false
vim.g.nord_italic = false
vim.g.nord_uniform_diff_background = true
vim.g.nord_bold = true
