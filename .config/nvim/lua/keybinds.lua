local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}

-- Disbale 'Space' key
map('n', '<Space>', '', opt)
-- Alias space to ':'
vim.cmd[[nnoremap <Space> :]]
vim.cmd[[vnoremap <Space> :]]

map('n', ':', '', opt)
-- Disable arrow keys
map('', '<Up>', '', opt)
map('i', '<Up>', '', opt)
map('', '<Down>', '', opt)
map('i', '<Down>', '', opt)
map('', '<Left>', '', opt)
map('i', '<Left>', '', opt)
map('', '<Right>', '', opt)
map('i', '<Right>', '', opt)

vim.cmd[[nnoremap <C-s> :w]]

vim.cmd[[nnoremap <C-f> :NvimTreeToggle<CR>]]
vim.cmd[[nnoremap <C-F> :NvimTreeFocus<CR>]]
vim.cmd[[nnoremap <C-p> :Telescope find_files<CR>]]
