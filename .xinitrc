#!/bin/bash
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

sxhkd & # Bind keys

clipmenud & # deamon for clipmenu

systemctl --user import-environment DISPLAY

xrandr --output DisplayPort-0 --mode 2560x1440 --above HDMI-A-0

rxkeyboard

xset r rate 200 50

feh --bg-fill --randomize ~/Pictures/*/*-ls-* &

exec i3
