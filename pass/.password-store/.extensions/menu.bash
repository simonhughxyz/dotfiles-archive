#!/bin/sh

# MENU
# Simon Hugh Moore
#
# Show a menu

pass_dir="$HOME/.password-store"
lastpass="$XDG_RUNTIME_DIR/lastpass" # store last pass accessed (pun intended)

# type out using xdotool
write(){
    xdotool type --clearmodifiers "$1"
}

# gets pass from password-store
get_pass(){
    pass show "$password" | head -n1
}

# gets login from password-store, login must have a prefix of `login: `
get_login(){
    pass show "$password" | grep "login: " | cut -d' ' -f 2
}

# Exploits a common design pattern in login fields to
# auto login by following the pattern of:
# type login --> press tab key --> type pass --> press return
auto_login(){
    write $(get_login)
    sleep 0.1
    xdotool key Tab
    sleep 0.1
    write $(get_pass)
    sleep 0.1
    xdotool key Return
}

# Gets the nth chars from password.
# Some idiotic login field require the nth password.
_nth() {
    pass nth get "$1" "$( echo "" | dmenu -p "Input the char numbers you want: " )" "$password"
}

# got to password-store directory and get a list of files.
cd $pass_dir
password_files="$(find * -type f)"

# get pass file using dmenu
password=$(printf '%s\n' "$(cat $lastpass)" "${password_files}" | sed 's|.gpg||g' | dmenu -i) || exit

# get options from pass file
options="$( pass $password | awk -F ':' '/^[0-9a-zA-Z]*: .*$/{printf "%s\n", $1}' )"

if [ "$options" != "" ]; then
    # if login exists then provide auto_login option
    echo $options | grep 'login' > /dev/null && auto="*\n"

    # choose what to get from pass file using dmenu
    choice=$(printf "${auto}pass\n${options}" | dmenu -i) || exit
else
    choice="pass"
fi

# store the chosen pass file name in lastpass file
echo "$password" > "$lastpass"

case "$choice" in
    "*") auto_login;;                                   # Writes both login and pass
    pass) write "$(get_pass)";;                           # autotype pass
    login) write "$(get_login)";;                         # autotype login
    OTP) write "$(pass otp show "$password")";;           # autotype OTP
    URL) $BROWSER "$(pass url "$password")";; # Visit URL
    nth*) write "$(_nth $choice )";;
esac
