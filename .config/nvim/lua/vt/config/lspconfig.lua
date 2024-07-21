local lspconfig = require("lspconfig")
local nvim_cmp_nvim_lsp = require("cmp_nvim_lsp")

local M = {}

function M.setup()
  local capabilities = nvim_cmp_nvim_lsp.default_capabilities()

  lspconfig.prismals.setup({
    capabilities,
  })

  lspconfig.tsserver.setup({
    capabilities,
  })

  lspconfig.dockerls.setup({
    capabilities,
  })

  lspconfig.pyright.setup({
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

  lspconfig.marksman.setup({ capabilities })
end

function M.on_mount(func)
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = func,
  })
end

return M
