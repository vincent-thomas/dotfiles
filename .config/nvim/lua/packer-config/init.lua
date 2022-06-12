require('packer').startup(function(use)

  use {
    'wbthomason/packer.nvim',
    'folke/tokyonight.nvim',
    'nvim-treesitter/nvim-treesitter',
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
    "glepnir/dashboard-nvim",
    'mhartington/formatter.nvim',
    'sunjon/shade.nvim', -- Dim inactive window
    "windwp/nvim-autopairs",
    "liuchengxu/vim-clap",
    {
      "junegunn/fzf.vim",
      requires = {
        'junegunn/fzf',
      },
      run = ":call fzf#install()"
    },
    {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons',
      },
      tag = 'nightly'
    },
    {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    },
--    {
--      'romgrk/barbar.nvim',
--      requires = {'kyazdani42/nvim-web-devicons'}
--    },
    {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'},
    {
      'neoclide/coc.nvim',
       branch = 'release'
    },
    {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
  }
--  use {
--    "akinsho/toggleterm.nvim",
--    tag = 'v1.*',
--    config = function()
--      require("toggleterm").setup({
--        size = 13,
--        shell = vim.o.shell,
--        shade_filetypes = {},
--        shading_factor = '1',
--        start_in_insert = true,
--        persist_size = true,
--        open_mapping = [[<c-\>]],
--        direction = 'float'
--      })
--    end
--  }
end)

