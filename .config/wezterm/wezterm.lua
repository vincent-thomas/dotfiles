local wezterm = require("wezterm")

local config = {}

config.enable_tab_bar = false

config.window_close_confirmation = "NeverPrompt"

config.color_scheme = "OneDark (base16)"

config.font = wezterm.font("Jetbrains Mono Nerd Font")

return config
