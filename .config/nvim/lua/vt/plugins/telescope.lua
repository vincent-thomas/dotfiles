return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { 
    "nvim-lua/plenary.nvim",
   -- {
    --  "nvim-telescope/telescope-fzf-native.nvim",
     -- build = "make"
   -- }
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup()
    -- telescope.load_extension("fzf")

    vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Search syntax in cwd" })
    vim.keymap.set("n", "<leader>fg", "<cmd>Telescope grep_string<cr>", { desc = "Search string cursor in cwd" })
  end
}
