return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

      -- Extensions
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      local actions = require("vt.config.telescope")

      -- vim.keymap.set("n", "<leader>t", actions.file_search, { desc = "Fuzzy find files in cwd" })
      vim.keymap.set("n", "<leader>g", actions.content_search, { desc = "Fuzzy find files in cwd" })
      --[[     local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close,
          },
        },
      },
      pickers = {
        find_files = {
          theme = dropdown_theme,
        },
      },
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

    vim.keymap.set("n", "<leader>fi", t.lsp_implementations, { desc = "Fuzzy find files in cwd" })
    vim.keymap.set("n", "<leader>fe", t.diagnostics, { desc = "Fuzzy find files in cwd" })
    vim.keymap.set("n", "<leader>fr", t.lsp_references, { desc = "Fuzzy find files in cwd" })
    vim.keymap.set("n", "<leader>fd", t.lsp_definitions, { desc = "Fuzzy find files in cwd" })
    vim.keymap.set("n", "<leader>ff", t.find_files, { desc = "Fuzzy find files in cwd" })
    vim.keymap.set("n", "<leader>fg", t.live_grep, { desc = "Search syntax in cwd" })
    vim.keymap.set("n", "<leader>fb", t.buffers)
    -- Picker Theme
    vim.keymap.set("n", "<leader>pt", t.colorscheme) ]]
    end,
  },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      local fzf = require("fzf-lua")

      fzf.setup()

      local function find_files()
        fzf.files({
          previewer = false,
          winopts = { row = 1, width = 0.5, height = 0.5 },
        })
      end

      vim.keymap.set("n", "<leader>f", find_files)
    end,
  },
}
