return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  config = function()
    require("dressing").setup({
      select = {
        telescope = require("telescope.themes").get_dropdown(),
      },
      input = {
        insert_only = false,
        relative = "editor",
        default_prompt = " ", -- Doesn't seem to work
      },
    })
  end,
}
