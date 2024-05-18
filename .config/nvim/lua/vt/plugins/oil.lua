return {
  "stevearc/oil.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("oil").setup({ default_file_explorer = true, filters = { dotfiles = true } })
    vim.keymap.set("n", "-", "<cmd>Oil<cr>")
  end,
}
