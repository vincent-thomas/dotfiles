return {
  "stevearc/oil.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      columns = {
        "icon",
        -- "permissions",
        -- "size",
        -- "mtime",
      },
      keymaps = {
        ["g?"] = "actions.show_help",
        ["l"] = "actions.select",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["h"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        -- ["\\"] = "actions.cd",
        -- ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
        ["gs"] = "actions.change_sort",
        ["t"] = "actions.open_external",
        ["."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
      },
      filters = {
        dotfiles = false,
      },
    })
    vim.keymap.set("n", "-", "<cmd>Oil<cr>")
  end,
}
