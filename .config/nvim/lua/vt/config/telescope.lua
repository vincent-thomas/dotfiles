local default_theme = {
  winblend = 0,
  sorting_strategy = "ascending",
  color_devicons = true,
  border = true,
  results_title = "",
  preview_title = "",

  scroll_strategy = "limit",
  file_ignore_patterns = { ".git" },
}
local function tableMerge(t1, t2)
  for k, v in pairs(t2) do
    if type(v) == "table" then
      if type(t1[k] or false) == "table" then
        tableMerge(t1[k] or {}, t2[k] or {})
      else
        t1[k] = v
      end
    else
      t1[k] = v
    end
  end
  return t1
end

require("telescope").setup({
  defaults = default_theme,
  pickers = {
    find_files = { hidden = true },
  },
})

local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

local M = {}

function M.file_search()
  local theme = themes.get_dropdown({
    layout_strategy = "vertical",
    prompt_title = "Files",
    previewer = false,
    layout_config = {
      vertical = {
        prompt_position = "top",
        anchor = "N",

        width = function(_, max_columns, _)
          return math.min(max_columns, 70)
        end,

        height = function(_, _, max_lines)
          return math.min(max_lines, 25)
        end,
      },
    },
  })

  local opts = tableMerge(theme, default_theme --[[ theme = "dropdown", ]])

  builtin.find_files(opts)
end

function M.content_search()
  local theme = tableMerge(
    themes.get_dropdown({
      layout_strategy = "horizontal",
      prompt_title = "Content Search",
      previewer = true,
      layout_config = {
        horizontal = {
          prompt_position = "top",
          width = 0.5,
          height = 0.8,
        },
      },
    }),
    default_theme
  )

  local opts = tableMerge(theme, {
    shorten_path = true,
  })

  builtin.live_grep(opts)
end

return M
