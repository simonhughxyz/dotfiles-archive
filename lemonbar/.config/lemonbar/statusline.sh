#!/bin/sh

pipe=/tmp/limebar_statusline
delim="%{F#d5d5d5}|"

# create pipe if it doesn't exist.
if [ ! -p $pipe ]; then
    mkfifo $pipe
fi

keystate() {
    lockline=$(xset -q | grep "Num Lock")

    caplock=$(echo "$lockline" | awk '{print $4}')
    numlock=$(echo "$lockline" | awk '{print $8}')
    scrolllock=$(echo "$lockline" | awk '{print $12}')

    message=""

    [ "$caplock" = "on" ] && message="%{F#e82e1e%{FAPLOCK $delim"
    [ "$numlock" = "on" ] && message="$message %{F#e82e1e}NUMLOCK $delim"
    [ "$scrolllock" = "on" ] && message="$message %{F#e82e1e}SCROLLLOCK $delim"

    echo "$message"
}

weather() {
    w="$(curl -s wttr.in?format=%t,%C)"
    desc="${w#*,}"
    temp="${w%,*}"
    
    symbol=""
    case "$desc" in
        "Clear") symbol="🌞";;
        "Sunny") symbol="☀";;
        "Partly cloudy") symbol="⛅";;
        "Cloudy") symbol="☁";;
        "Shower In Vicinity") symbol="💧";;
        *) symbol="$desc";;
    esac
    echo "$symbol $temp"
}

volume() {
	[ "$(pulsemixer --get-mute)" = "1" ] && printf "🔇\\n" && return 0

	vol=$(pulsemixer --get-volume | awk '{print $1}')

	if [ "$vol" -gt "100" ]; then
		icon="🔊"
	elif [ "$vol" -lt "50" ]; then
		icon="🔈"
	else
		icon="🔉"
	fi

	printf "%s %s%%\n" "$icon" "$vol"
}

update() {
    updatenr=$(pacman -Qu | grep -v "\[ignored\]" | wc -l)
    [ "$updatenr" != "0" ] && printf "$delim %{F#b29f27} 📦 $updatenr"
}

record() {
	recpid_file="$XDG_RUNTIME_DIR/recordingpid"
	[ -e "$recpid_file" ] && echo "%{F#e82e1e}⏺ rec $delim"
}

battery() {
    # Don't run if acpi not available
    command -v acpi > /dev/null 2>&1 || exit 1
    bat_empty=" "
    bat_quarter=" "
    bat_half=" "
    bat_almost=" "
    bat_full=" "

    BAT0=$(acpi -b | awk '/Battery 0/{print $4}' | tr -d ',')
    BAT1=$(acpi -b | awk '/Battery 1/{print $4}' | tr -d ',')

    echo "$delim $BAT0 $BAT1"
}

desktops() {
    f_color="%{F#c25704}"
    f_selcolor="%{F#ffffff}"
    b_selcolor="%{B#c25704}"

    current=$(bspc query -D -d --names)
    color_current="$f_selcolor$b_selcolor $current $f_color%{B-}"
    desktops=$(bspc query -D --names | sed "s/^$current$/$color_current/g")

    echo "$f_color$desktops"
}

status() {
    echo "%{l}"
    desktops

    echo "%{r}"
    # keystate

	# record

    echo "%{F#c98a1e}⬆"
    uptime | awk '{print $3}' | cut -d',' -f 1
    echo "$delim"

    echo "%{F#C0C000}📊"
    free -h | awk '/}Mem:/ {print $3 "/" $2}'
    echo "$delim"
    
	echo "%{F#98C379}"
	volume
	echo "$delim"

    echo "%{F#F79494}📅"
    date '+%a %d %B %Y'
    echo "$delim"

    echo "%{F#61AEEE}🕒"
    date '+%H:%M'

    # echo "$delim"
    battery

    # update
}

update_pipe() {
    echo "$(status | tr '\n' ' ')" >$pipe &
}

loop() {
    trap 'exit 1' INT HUP QUIT TERM ALRM USR1
    lock_file=/tmp/statusline.lock
    if { set -C; 2>/dev/null >$lock_file; }; then
        trap "rm -f $lock_file" EXIT
    else
        echo "lock file exists, exiting..."
        exit
    fi

    while :; do
        update_pipe
        sleep 30
    done
}

case $1 in
    loop) loop;;
    *) update_pipe;;
esac
