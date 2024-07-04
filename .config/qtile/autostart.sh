#!/bin/bash
picom --backend glx &
nitrogen --restore &
sh ~/.config/polybar/launch.sh &
