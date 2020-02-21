#!/bin/sh

# LIMEBAR
# Simon Hugh Moore
#
# Set config options for lemonbar

# Kill any running lemonbar
# pgrep -x lemonbar > /dev/null && pkill -x lemonbar &

# font="-xos4-terminesspowerline-medium-r-normal--12-120-72-72-c-60-iso10646-1"
font="-xos4-terminus-bold-r-normal--28-280-72-72-c-140-iso10646-1"
# icon_font="-xos4-terminusicons2mono-medium-r-normal--12-120-72-72-m-60-iso8859-1"
icon_font="Font Awesome"
geometry="x30"
f_color="#DDDDDD"
b_color="#202020"

sh "$HOME/.config/lemonbar/statusline.sh" | lemonbar -p -f "${font}" -f "${icon_font}" -f "Font Awesome" -g "${geometry}" -B "${b_color}" -F "${f_color}"
