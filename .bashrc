# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Set default file permissions
umask 077 # Owner has all permissions, group has none and everyone has none

# Activate vi mode
set -o vi

# COLORS & TEST DECORATION
COL_NORMAL="\[\e[m\]"
COL_BLACK="\[\e[30m\]"
COL_RED="\[\e[31m\]"
COL_GREEN="\[\e[32m\]"
COL_YELLOW="\[\e[33m\]"
COL_BLUE="\[\e[34m\]"
COL_PURPLE="\[\e[35m\]"
COL_CYAN="\[\e[36m\]"
COL_WHITE="\[\e[37m\]"

COL_BG_BLACK="\[\e[40m\]"
COL_BG_RED="\[\e[41m\]"
COL_BG_GREEN="\[\e[42m\]"
COL_BG_YELLOW="\[\e[43m\]"
COL_BG_BLUE="\[\e[44m\]"
COL_BG_PURPLE="\[\e[45m\]"
COL_BG_CYAN="\[\e[46m\]"
COL_BG_WHITE="\[\e[47m\]"

TEXT_NORMAL="\[\e[0m\]"
TEXT_BOLD="\[\e[1m\]"
TEXT_UNDERLINE="\[\e[4m\]"


# PS1 PROMPT
git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

get_user(){
    [ "$USER" != "simon" ] && echo "$USER"
}

PS1="$COL_YELLOW\$(get_user)$COL_YELLOW\W$COL_PURPLE\$(git_branch) $COL_CYAN>$COL_NORMAL "

export PS1=$PS1

# Color Man page
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

##---ALIASES---##
alias sbash='source ~/.bashrc'  # reload .bashrc
alias spbash='source ~/.profile'

source ~/.config/shell/alias.sh

## Functions ##
# make a directory and cd into it
mcd() { mkdir "$1"; cd "$1";} 
# make a backup of a file ending in .bak
bak() { cp "$1"{,.bak};}
# check md5 of file
md5check() {
    [ "$2" ] && local i=$2 || local i=$(cat -)
    md5sum $1 | g $i
}
sha1check() { 
    [ "$2" ] && local i=$2 || local i=$(cat -)
    sha1sum $1 | g $i
}
sha256check() {
    [ "$2" ] && local i=$2 || local i=$(cat -)
    sha256sum $1 | g $i
}
hashcheck() {
    [ "$2" ] && local i=$2 || local i=$(cat -)
    md5sum $1 | grep $i || echo "bad"
    sha1sum $1 | grep $i
    sha256sum $1 | grep $i
}

# Get one column of output
function fawk {
    first="awk '{print "
    last="}'"
    cmd="${first}\$${1}${last}"
    eval $cmd
}

function escape {
    [ "$2" ] && local i=$2 || local i=$(cat -)
    a=$(echo "$i" | sed -e 's/\([[\/.*]\|\]\)/\\&/g')
    echo "$a"
}

function sedeasy {
  sed -i "s/$(echo $1 | sed -e 's/\([[\/.*]\|\]\)/\\&/g')/$(echo $2 | sed -e 's/[\/&]/\\&/g')/g" $3
}

# Insert to beginning of file
function beg {
    [ "$2" ] && local i=$2 || local i=$(cat -)
    echo "$i"
    awk '{print "cool" $0}' $1
}


# #PyEnv
# export PATH="/home/simon/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# Source fzf keybindingd
[ -e /usr/share/doc/fzf/key-bindings.bash ] && source /usr/share/doc/fzf/key-bindings.bash

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
