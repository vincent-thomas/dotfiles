local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "git@github.com:folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
  {
    { import = "vt.plugins" },
    { import = "vt.plugins.cmp"},
    { import = "vt.plugins.lsp"}
  },
  {
    checker = {
      enabled = false,
      notify = false,
    },
    change_detection = {
      notify = true
    }
  }
)
