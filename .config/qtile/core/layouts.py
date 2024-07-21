from libqtile import layout 
from core.theme import theme

layouts = [
    layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], **theme),
    layout.Max(**theme),
]
