#! /bin/sh

chosen=$(printf "Log Out\nSuspend\nRestart\nPower OFF" | rofi -dmenu -i)

case "$chosen" in
	"Log Out") qtile cmd-obj -o cmd -f shutdown ;;
	"Suspend") systemctl suspend ;;
	"Restart") systemctl reboot ;;
	"Power OFF") systemctl poweroff ;;
	*) exit 1 ;;
esac
