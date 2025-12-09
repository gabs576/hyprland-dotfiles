#!/bin/zsh

# Power menu script using tofi

CHOSEN=$(printf "Lock\nSuspend\nReboot\nShutdown\nLog Out" | rofi -dmenu -p "$HOME"/.config/rofi/powermenu.sh)

case "$CHOSEN" in
	"Lock") hyprlock ;;
	"Suspend") systemctl suspend-then-hibernate ;;
	"Reboot") reboot ;;
	"Shutdown") poweroff ;;
	"Log Out") hyprctl dispatch exit ;;
	*) exit 1 ;;
esac
