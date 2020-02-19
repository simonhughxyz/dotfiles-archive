#!/bin/sh

# LEMONBAR_CONFIG
# Simon Hugh Moore
#
# Set config options for lemonbar

# font="-xos4-terminesspowerline-medium-r-normal--12-120-72-72-c-60-iso10646-1"
font="-xos4-terminus-bold-r-normal--28-280-72-72-c-140-iso10646-1"
icon_font="-xos4-terminusicons2mono-medium-r-normal--12-120-72-72-m-60-iso8859-1"
geometry="x30"
f_color="#DDDDDD"
b_color="#202020"

# sh ./statusline.sh | lemonbar -p -f "${font}" -f "${icon_font}" -g "${geometry}" -B "${b_color}" -F "${f_color}"
sh ./statusline.sh | lemonbar -p -f "${font}" -f "${icon_font}" -g "${geometry}" -F "${f_color}"
