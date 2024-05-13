return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end
  },
  {
    -- "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "tsserver",
          "rust_analyzer",
          "lua_ls",
          "dockerls"
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp"
    },
    config = function()
      local lspconfig = require("lspconfig")

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      lspconfig.tsserver.setup({})
      lspconfig.dockerls.setup({})
      lspconfig.lua_ls.setup({
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
              command = "clippy"
            }
          }
        }
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
    end
  }
  --[[


    local handlers = {
      default_setup = function(server)
        require('lspconfig')[server].setup({
          capabilities,
        })
      end,
			["rust_analyzer"] = function()
				ltsservspconfig["rust_analyzer"].setup({
					capabilities,
					settings = {
						["rust-analyzer"] = {
							check = {
								command = "clippy",
							},
						},
					},
				})
			end,

			["lua_ls"] = function()
				-- configure lua server (with special settings)
				lspconfig["lua_ls"].setup({
					capabilities,
				})
			end,
    };

    require("mason-lspconfig").setup({
      ensure_installed = {
        -- LSP 
        "tsserver",
        "lua_ls",
        "rust_analyzer",
    
        -- Formatters

      },
      handlers
    }) ]]
}
