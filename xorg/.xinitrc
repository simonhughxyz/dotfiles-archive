#!/bin/bash
xrdb -merge ~/.Xresources

# setxkb & # set preferred x keyboard layout

setxkbmap -layout gb -option "caps:ctrl_modifier" -option "altwin:prtsc_rwin"
xcape -e 'Caps_Lock=Escape'


#systemctl --user import-environment DISPLAY

# Set up dual monitor display
# xrandr --output DisplayPort-0 --mode 2560x1440 --above HDMI-A-0

#xset r rate 200 50
xset s 900 900 # lock screen and turn off after 5 min

# feh --bg-fill --randomize ~/Pictures/*/*-ls-* &

# startup apps
xbacklight -set 25 & # set screen brightness to 25%
start-pulseaudio-x11 & # make sure pulseaudio is running
syncthing -no-browser & # syncs files between devises
clipmenud & # deamon for clipmenu
redshift & # reduced blue levels on screen
unclutter -f & # removes mouse from screen after x seconds
# compton & # for transparency and some other effects
dunst & # for notifications
sxhkd > ~/.log/sxhkd.log & # keybindings
statusbar &
st -n htop -e htop &
st -n newsboat -e newsboat &
bluetoothctl power on # Switch on bluetooth
# ntpd -qg    # set time and date from ntp server

while true; do
    /usr/local/bin/dwm 2> ~/.log/dwm.log
done
