#!/bin/bash
picom &
nitrogen --random --set-zoom-fill ~/Wallpapers/ &
sh ~/.config/polybar/launch.sh &

# Polkit agent
/usr/libexec/polkit-gnome-authentication-agent-1 &
