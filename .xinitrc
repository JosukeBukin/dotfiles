#xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --auto

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

setxkbmap -layout us,ru
setxkbmap -option 'grp:alt_shift_toggle'
#dbus-launch $HOME/.xmonad/xmonad-x86_64-linux 
