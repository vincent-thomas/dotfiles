return {
  "itchyny/lightline.vim",
  config = function()
    vim.g.lightline = {
      colorscheme = "one",
      active = {
        left = {
          { "mode", "paste" },
          { "readonly", "filename", "modified" },
        },
        right = {
          { "lineinfo" },
          { "percent" },
          { "filetype" },
        },
      },
      component = {
        lineinfo = "%3l:%-2c",
      },
    }
  end,
}
