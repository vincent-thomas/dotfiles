vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.termguicolors = true
vim.g.mapleader = " "
vim.opt.colorcolumn = "80"

vim.opt.termguicolors = true

vim.cmd("set number")
vim.cmd("set noshowmode")
vim.cmd("set nocompatible")
