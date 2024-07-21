return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "typescript",
        "javascript",
        "rust",
        "lua",
        "json",
        "toml",
        "prisma",
        "markdown",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        enable_autocmd = false,
      },
      sync_install = true,
      indent = { enable = true },
    })
  end,
}
