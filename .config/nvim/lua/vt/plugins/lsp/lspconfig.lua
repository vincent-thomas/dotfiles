return {
  "nevim/nvim-lspconfig",
  event = {"BufReadPre", "BufNewFile"},
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    {
      "antosha417/nvim-lsp-file-operations",
      config = true
    }
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local opts = {noremap, silent = true}

    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      -- Definition
      vim.keymap.set("n", "dg", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "<leader>dr", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>dh", vim.lsp.buf.hover, opts)

      -- Telescope
      vim.keymap.set("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>", opts)
      vim.keymap.set("n", "<leader>fi", "<cmd>Telescope lsp_imlementations<CR>", opts)



    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
    mason_lspconfig.setup_handlers({
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end,
      ["lua_ls"] = function()
        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          on_attach = on_attach,
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
      end,
    })



  end
}
