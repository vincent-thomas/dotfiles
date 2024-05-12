return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "neovim/nvim-lspconfig"
  },
  config = function()
    local mason = require("mason")

    local mason_lspconfig = require("mason-lspconfig")

    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    local default_setup = function(server)
      require('lspconfig')[server].setup({
        capabilities = lsp_capabilities,
      })
    end

    mason_lspconfig.setup({
      ensure_installed = {
        "tsserver",
        "lua_ls",
        "rust_analyzer",
      },
      handlers = {
        default_setup,
      }
    })
  end
}
