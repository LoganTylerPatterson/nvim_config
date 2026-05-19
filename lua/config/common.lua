vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'

vim.opt.encoding = "utf-8"
vim.opt.swapfile = false
vim.opt.scrolloff = 7
vim.opt.fileformat = "unix"
vim.opt.termguicolors = true

-- 2-space indentation (JS/TS standard)
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Better search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Misc UX
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.updatetime = 250  -- faster CursorHold (used by gitsigns, etc.)

-- Key mappings
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })
