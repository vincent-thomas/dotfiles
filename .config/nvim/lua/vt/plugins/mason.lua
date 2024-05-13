return {
  {
    "williamboman/mason.nvim",
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

      local packages = {

        -- LSP
        "rust-analyzer",
        "lua-language-server",
        "typescript-language-server",
        "dockerfile-language-server",
        "prisma-language-server",

        -- Formatters
        "stylua",
        "biome",
      }

      for i = 1, #packages do
        if registry.is_installed(packages[i]) == false then
          vim.notify(string.format("installing: %s", packages[i]))
          registry.get_package(packages[i]):install()
        end
      end
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

          -- Definition
          vim.keymap.set("n", "<leader>dg", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "<leader>dr", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>dh", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>da", vim.lsp.buf.code_action, opts)

          -- Telescope
          vim.keymap.set("n", "<leader>fr", require("telescope.builtin").lsp_references, opts)
          vim.keymap.set("n", "<leader>fi", vim.lsp.buf.implementation, opts)
        end,
      })
    end,
  },
}
