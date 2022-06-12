
require('formatter').setup {
  filetype = {
    javascript = {
      require('formatter.filetypes.javascript')
    }
  }
}

require 'keybinds'
require 'options'
require 'bufferline-config'
require 'autopairs-config'
require 'packer-config'
require 'shade-config'
require 'nvim-tree'.setup {}
require 'lualine'.setup {}

require("nvim-lsp-installer").on_server_ready(function(server)
  local opt = {}
  server:setup(opt)
end)

