[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

setxkbmap -layout us,ru
setxkbmap -option 'grp:alt_shift_toggle'
