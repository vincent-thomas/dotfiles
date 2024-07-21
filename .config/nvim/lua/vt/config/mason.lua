local registry = require("mason-registry")
local mason = require("mason")

local M = {}

function M.setup()
  mason.setup({
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
    "pyright",
    "marksman",

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
end

return M
