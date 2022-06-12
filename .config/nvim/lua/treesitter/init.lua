require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  sync_installs = true,

  highlight = { -- enable highlighting
    enable = true,
    additional_vim_regex_highlighting = false
  },
  indent = {
    enable = false, -- default is disabled anyways
  }
}


