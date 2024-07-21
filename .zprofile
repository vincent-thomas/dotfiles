 # if [[ "$(tty)" = "/dev/tty1" ]]; then
 #   pgrep qtile || startx "/home/vincent/.config/x11/xinitrc"
 # fi
 #
 sh ./scripts/bootstrap-xrandr.sh
pactl set-default-sink alsa_output.pci-0000_06_00.1.hdmi-stereo
