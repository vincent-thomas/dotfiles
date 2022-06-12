local set = vim.opt

-- Tabs Settings
set.expandtab = true
set.smarttab = true
set.shiftwidth = 2
set.tabstop = 2
set.softtabstop = 2


set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"

-- Themes
vim.g.tokyonight_transparent = false
vim.g.tokyonight_style = "night"

-- Casing settings
set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true


-- Text parsing
set.termguicolors = true
set.showmode = false
set.splitbelow = true
set.splitright = true
set.wrap = false
set.breakindent = true
set.scrolloff = 5
set.fileencoding = "utf-8"
set.conceallevel = 2



vim.cmd[[colorscheme tokyonight]]

set.relativenumber = true
set.cursorline = true
set.wildmenu = true
set.completeopt = "menuone,noselect"

set.hidden = true
set.mouse = "a"
