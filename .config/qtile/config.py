from libqtile import  layout
from libqtile.config import Click, Drag, Key, Match 
from libqtile.lazy import lazy
import os
import subprocess
# from vt.groups import GroupBuilder, create_group_keybindings
# from vt.applaunching import create_app_binds, SpawnLaunching
from core.keys import keys, groups
from core.layouts import layouts
from core.screens import screens
from core.theme import theme

mod = "mod4"
alt = "mod1"
terminal = "wezterm"
browser = "firefox"


def start_deps():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.Popen([home])

start_deps()
#
# keys = [
#     Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
#     Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
#     Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
#     Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
#
#     Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
#     Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
#     Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
#     Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
#     # Grow windows. If current window is on the edge of screen and direction
#     # will be to screen edge - window would shrink.
#     Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
#     Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
#     Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
#     Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
#     Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
#    
#     Key([mod], "c", lazy.window.kill(), desc="Kill focused window"),
#     Key([mod], "f", lazy.next_layout(), desc="Toggle between layouts"),
#     Key(
#         [mod, "control"],
#         "f",
#         lazy.layout.toggle_split(),
#         desc="Toggle between split and unsplit sides of stack",
#     ),
#     Key([mod, "shift"], "f", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
#     Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
#     Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
#     Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
# ]
#
# app_binds = [
#     SpawnLaunching("b", browser),
#     SpawnLaunching("t", terminal),
#     SpawnLaunching("Return", "rofi -show drun -show-icons"),
# ]
#
# keys.extend(create_app_binds(mod, app_binds))
#
# groups = [
#     GroupBuilder(key = "z", name = "term", layout = "monadtall"),
#     GroupBuilder(key = "x", name = "tv", layout ="monadtall"),
#     GroupBuilder(key = "c", name ="www", layout = "monadtall"),
#     GroupBuilder(key = "v", name = "music",layout = "monadtall"),
# ]
#
#
# keys.extend(create_group_keybindings(alt, groups))
#
# theme = {
#   "border_focus": "#4B6A88",
#   "border_width": 4,
#   "border_normal": "#3E4451",
#   "margin": 8,
# }
#
widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()
#
# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
    **theme
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = False

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24

wmname = "Qtile"
