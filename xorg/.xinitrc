#!/bin/sh

LOG_PREFIX=~/.local/share

# create log directory and return full log path
_log(){
    path="${LOG_PREFIX}/${1}"
    mkdir -p "${path}"
    echo "${path}/${2:-${1}}.log"
}

xrdb -merge ~/.Xresources

if [ "$HOST" = "voidtower" ]; then
    setxkbmap -layout gb -option "caps:swapescape" -option "altwin:menu_win"
elif [ "$HOST" = "voidbook" ]; then
    setxkbmap -layout gb -option "caps:swapescape" -option "altwin:prtsc_rwin"
else
    setxkbmap -layout gb -option "altwin:menu_win"
fi

# xset r rate 200 50
xset s 900 900 # lock screen and turn off after 5 min.

# change default cursor to a pointer.
xsetroot -cursor_name left_ptr

# Set random wallpaper
randwall &

# set backlight depending if night or day.
hour=$(date '+%H')
if [ $hour -ge 20 ] || [ $hour -le 08 ]; then
    xbacklight -set 20 &
else
    xbacklight -set 30 &
fi

# startup apps
if command -v start-pulseaudio-x11; then
    start-pulseaudio-x11 & # make sure pulseaudio is running.
else
    pipewire > "$( _log "pipewire" )" 2>&1 &
    pipewire-pulse > "$( _log "pipewire" "pipewire-pulse" )" 2>&1 &
fi
syncthing -no-browser > "$( _log "syncthing" )" 2>&1 & # syncs files between devises.
clipmenud &                                   # deamon for clipmenu.
redshift &                                    # reduced blue levels on screen.
unclutter -noevents &                                # removes mouse from screen after x seconds.
compton &                                     # for transparency and some other effects.
export $(dbus-launch) &
dunst &                                       # for notification.
bluetoothctl power on                         # Switch on bluetooth.
/usr/lib64/libexec/kdeconnectd > "$( _log "kdeconnect" "kdeconnectd" )" 2>&1 &

# auto connect hdmi
# requres a udev rule to fill pipe when hdmi is connected/disconnected
pipe=/tmp/hdmi.pipe
if [ -p $pipe ]; then
    tail -f $pipe | while read -r line; do
        export DISPLAY=:0
        export XAUTHORITY=~/.Xauthority

        is_connected="$( xrandr | sed -n '/HDMI1 connected/p')"

        if [ -n "$is_connected" ]; then
            xrandr --output HDMI1 --mode 1360x768
        else
            xrandr --output HDMI1 --off
        fi
    done &
fi

# start up with screen locked
~/.local/bin/lock > "$( _log "lock" )" 2>&1

exec dwmstatus run > "$( _log "dwm" "status" )" 2>&1 &
exec dwm> "$( _log "dwm" )" 2>&1
