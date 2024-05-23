local packages = {

  -- LSP
  "rust-analyzer",
  "lua-language-server",
  "typescript-language-server",
  "dockerfile-language-server",
  "prisma-language-server",
  "ruby-lsp",
  -- Formatters
  "stylua",
  "biome",
}

return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "frostplexx/mason-bridge.nvim",
    },
    config = function()
      local registry = require("mason-registry")
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      require("mason-bridge").setup()

      for i = 1, #packages do
        if registry.is_installed(packages[i]) == false then
          vim.notify(string.format("installing: %s", packages[i]))
          registry.get_package(packages[i]):install()
        end
      end
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
          lsp_fallback = true,
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
      local lspconfig = require("lspconfig")

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.prismals.setup({
        capabilities,
      })

      lspconfig.tsserver.setup({
        capabilities,
      })

      lspconfig.dockerls.setup({
        capabilities,
      })


      lspconfig.ruby_lsp.setup({
        capabilities,
      })

      lspconfig.lua_ls.setup({
        capabilities,
        settings = {
          Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
              globals = { "vim" },
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      })
      lspconfig.rust_analyzer.setup({
        settings = {
          ["rust-analyzer"] = {
            check = {
              command = "clippy",
            },
          },
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf, silent = true }

          local tb = require("telescope.builtin")

          -- Definition
          vim.keymap.set("n", "<leader>dr", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>dh", vim.lsp.buf.hover, opts)
          -- 'c' is not available, so the best is d for 'definition'
          vim.keymap.set("n", "<leader>da", vim.lsp.buf.code_action, opts)

          -- Find
          vim.keymap.set("n", "<leader>fi", tb.lsp_implementations, opts)
          vim.keymap.set("n", "<leader>fb", tb.buffers, opts)
          vim.keymap.set("n", "<leader>fd", vim.lsp.buf.declaration, opts)
        end,
      })
    end,
  },
}
