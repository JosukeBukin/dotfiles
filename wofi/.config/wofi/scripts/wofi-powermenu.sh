#!/bin/bash

entries="⇠ Logout\n⏾ Suspend\n󰑙 Reboot\n⏻ Shutdown"

selected=$(echo -e $entries|wofi --width 250 --height 210 --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
  logout)
    hyprctl dispatch exit;;
  suspend)
    exec suspend;;
  reboot)
    exec reboot;;
  shutdown)
    exec poweroff -i;;
esac
