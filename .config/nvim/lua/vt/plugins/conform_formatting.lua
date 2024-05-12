return {
  "stevearc/conform.nvim",
  event = {"BufWritePre", "BufNewFile"},
  cmd = { "ConformInfo" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
        rust = { "rustfmt" },
        ["_"] = { "trim_whitespace" }
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500
      },
      log_level = vim.log.levels.ERROR,
      notify_on_error = true
    })
  end
}

