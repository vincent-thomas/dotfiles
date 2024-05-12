
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()

    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup {
      compltion = {
        completeopt = "menu,menuone,preview,noselect"
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping.confirm { select = true }
      }),

      sources = cmp.config.sources(
        {
          { name = "nvim_lsp" },
          { name = "copilot"  },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }, 
        { name = "buffer" }
      )
    }
  end
}
