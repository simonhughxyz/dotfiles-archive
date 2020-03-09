#!/bin/sh
xrdb -merge ~/.Xresources

setxkbmap -layout gb -option "caps:swapescape" -option "altwin:prtsc_rwin"

#xset r rate 200 50
xset s 900 900 # lock screen and turn off after 5 min

feh --bg-fill --randomize ~/.config/background &

# set backlight depending if night or day
hour=$(date '+%H')
if [ $hour -ge 20 ] || [ $hour -le 08 ]; then
    xbacklight -set 10 &
else
    xbacklight -set 20 &
fi

# startup apps
start-pulseaudio-x11 & # make sure pulseaudio is running
syncthing -no-browser > ~/.local/share/syncthing/syncthing.log 2>&1 & # syncs files between devises
clipmenud & # deamon for clipmenu
redshift & # reduced blue levels on screen
unclutter -f & # removes mouse from screen after x seconds
compton & # for transparency and some other effects
export $(dbus-launch) &
dunst & # for notification
sxhkd > ~/.local/share/sxhkd/sxhkd.log 2>&1 & # keybindings
bluetoothctl power on # Switch on bluetooth
# ntpd -qg    # set time and date from ntp server

exec bspwm > ~/.local/share/bspwm/bspwm.log 2>&1
