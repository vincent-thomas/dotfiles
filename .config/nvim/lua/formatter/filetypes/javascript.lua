local M = {}

local util = require("formatter.util")

-- other formatters...

function M.prettier()
  return {
    exe = "prettier",
    args = {
      "--stdin-filepath",
      util.escape_path(util.get_current_buffer_file_path()),
    },
    stdin = true,
  }
end

-- other formatters...

return M
