#!/bin/bash
picom &
nitrogen --restore &
sh ~/.config/polybar/launch.sh &

# Polkit agent
/usr/libexec/polkit-gnome-authentication-agent-1 &
