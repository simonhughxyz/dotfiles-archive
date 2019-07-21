#!/bin/bash
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

setxkb & # set preferred x keyboard layout

#systemctl --user import-environment DISPLAY

# Set up dual monitor display
xrandr --output DisplayPort-0 --mode 2560x1440 --above HDMI-A-0

#xset r rate 200 50

feh --bg-fill --randomize ~/Pictures/*/*-ls-* &

# startup apps
clipmenud & # deamon for clipmenu
redshift & # reduced blue levels on screen
unclutter -f & # removes mouse from screen after x seconds
compton & # for transparency and some other effects
dunst & # for notifications
sxhkd > ~/.log/sxhkd.log & # keybindings

exec i3
