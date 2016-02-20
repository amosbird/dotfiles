#!/bin/bash
# wait for the dock state to change
sleep 2
export DISPLAY=:0
export XAUTHORITY=/home/amos/.Xauthority
DOCKED=$(cat /sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-DP-4/status)
case "$DOCKED" in
  "connected")
    /usr/bin/xrandr --output eDP1 --off --output DP2-2 --primary --mode 1920x1080 --pos 0x0
  ;;
  *)
    /usr/bin/xrandr --output eDP1 --primary --mode 1600x900 --pos 0x0 --output DP2-2 --off
  ;;
esac
exit 0
