local wezterm = require("wezterm")

local config = {}

config.enable_tab_bar = false

config.window_close_confirmation = "NeverPrompt"

config.color_scheme = "nord"

config.font = wezterm.font("Jetbrains Mono Nerd Font")

return config
