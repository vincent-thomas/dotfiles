return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

    -- Extensions
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({

      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
    })

    local extensions = { "ui-select", "fzf" }

    for _, ext in ipairs(extensions) do
      telescope.load_extension(ext)
    end

    local t = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", t.find_files, { desc = "Fuzzy find files in cwd" })
    vim.keymap.set("n", "<leader>fi", t.lsp_implementations, { desc = "Fuzzy find files in cwd" })
    vim.keymap.set("n", "<leader>fr", t.lsp_references, { desc = "Fuzzy find files in cwd" })
    vim.keymap.set("n", "<leader>fd", t.lsp_definitions, { desc = "Fuzzy find files in cwd" })
    vim.keymap.set("n", "<leader>ff", t.find_files, { desc = "Fuzzy find files in cwd" })
    vim.keymap.set("n", "<leader>fg", t.live_grep, { desc = "Search syntax in cwd" })
    vim.keymap.set("n", "<leader>fb", t.buffers)
    -- Picker Theme
    vim.keymap.set("n", "<leader>pt", t.colorscheme)
  end,
}
