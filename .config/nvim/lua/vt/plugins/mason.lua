return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "frostplexx/mason-bridge.nvim",
    },
    config = function()
      require("vt.config.mason").setup()
      require("mason-bridge").setup()
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre", "BufNewFile" },
    cmd = { "ConformInfo" },
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = require("mason-bridge").get_formatters(),
        format_on_save = {
          lsp_fallback = false,
          async = false,
          timeout_ms = 500,
        },
        log_level = vim.log.levels.ERROR,
        notify_on_error = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local vt_lsp = require("vt.config.lspconfig")
      vt_lsp.setup()

      vt_lsp.on_mount(function(ev)
        local opts = { buffer = ev.buf, silent = true }

        local tb = require("telescope.builtin")

        -- Definition
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts)

        -- Find
        vim.keymap.set("n", "<leader>i", tb.lsp_implementations, opts)
        vim.keymap.set("n", "<leader>R", tb.lsp_references, opts)
        vim.keymap.set("n", "<leader>b", tb.buffers, opts)
        vim.keymap.set("n", "<leader>d", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "<leader>e", tb.diagnostics, opts)
      end)
    end,
  },
}
