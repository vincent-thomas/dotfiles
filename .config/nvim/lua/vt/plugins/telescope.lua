return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",

    -- Extensions
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup {
      extensions = {
        ["ui-select"] = {
           require("telescope.themes").get_dropdown {} 
        }
      }
    }

    telescope.load_extension("ui-select")

    local t = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", t.find_files, { desc = "Fuzzy find files in cwd" })
    vim.keymap.set("n", "<leader>fg", t.live_grep, { desc = "Search syntax in cwd" })
  end,
}
