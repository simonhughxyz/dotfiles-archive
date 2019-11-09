#!/bin/bash
xrdb -merge ~/.Xresources

setxkbmap -layout gb -option "caps:ctrl_modifier" -option "altwin:prtsc_rwin"
xcape -e 'Caps_Lock=Escape'


# Set up dual monitor display
# xrandr --output DisplayPort-0 --mode 2560x1440 --above HDMI-A-0

#xset r rate 200 50
xset s 900 900 # lock screen and turn off after 5 min

feh --bg-fill --randomize ~/.config/background &

# set backlight depending if night or day
hour=$(date '+%H')
if test $hour -ge 20 -o -le 08; then
    xbacklight -set 10 &
else
    xbacklight -set 20 &
fi

# startup apps
start-pulseaudio-x11 & # make sure pulseaudio is running
syncthing -no-browser & # syncs files between devises
clipmenud & # deamon for clipmenu
redshift & # reduced blue levels on screen
unclutter -f & # removes mouse from screen after x seconds
compton & # for transparency and some other effects
export $(dbus-launch) &
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
