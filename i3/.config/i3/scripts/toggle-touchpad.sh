#!/bin/sh
# Toggle-tochpad script


if [ $(xinput list-props "Elan Touchpad" | grep 'Device Enabled' | gawk -F ':' '{ print $2 }') -eq 0 ]; then
    xinput enable "Elan Touchpad"
    notify-send "Touchpad is enabled"
else
    xinput disable "Elan Touchpad"
    notify-send "Touchpad is disabled"
fi
