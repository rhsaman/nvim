local opt = vim.opt -- for conciseness
-- line numbers
opt.relativenumber = true -- show relative line numbers
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
vim.g.rustfmt_autosave = 1

opt.conceallevel = 2
vim.g.vim_markdown_frontmatter = 0

-- vim.g.python3_host_prog = vim.fn.expand("~/Documents/code/kittron/back/py/venv/bin/python3")

-- vim-rooter
vim.cmd("let g:rooter_patterns = ['.git', 'Makefile','main.go','pubspec.yaml','README.md']")

-- gruvbox
vim.cmd("let g:gruvbox_material_background = 'hard'")
vim.cmd("let g:gruvbox_material_better_performance = 1")
vim.cmd("let g:gruvbox_material_enable_bold = 1")
-- mix original material
vim.cmd("let g:gruvbox_material_foreground = 'original'")
--  highlighted , colored , grey
vim.cmd("let g:gruvbox_material_diagnostic_virtual_text = 'colored'")
vim.cmd("let g:gruvbox_material_diagnostic_line_highlight = 1")

-- fold
-- vim.cmd([[
-- augroup remember_folds
--   autocmd!
--   autocmd BufWinLeave *.* mkview
--   autocmd BufWinEnter *.* silent! loadview
-- augroup END
-- ]])

-- vim.cmd("set guifont=hack_nerd_font:h21")
