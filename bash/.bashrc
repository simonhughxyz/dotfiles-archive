# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Set default file permissions
umask 077 # Owner has all permissions, group has none and everyone has none

# Activate vi mode
set -o vi

umask 077


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

# shortcuts 
alias sudo='sudo '
alias se='sudoedit'
alias path='echo $PATH'
alias c='clear'
alias p='pacman'
alias xi="sudo xbps-install"
alias xr="sudo xbps-remove"
alias xq="xbps-query"
alias mux='tmuxinator'
alias clip='xclip -selection clipboard'
alias paste='xclip -o'
alias mail='neomutt'

# ls
alias ls='ls --color=auto --group-directories-first'
alias l='ls'
alias l.='ls -d .*'
alias l,='ls -A'
# ls only directories
alias ld='ls -d */'
alias ld.='ls -d .*/'
alias ld,='ls -d */ .*/'
# ls in list format
alias ll='ls -lh'
alias ll.='ll -d .*'
alias ll,='ll -A'
# ls directories in list format
alias lld='ll -d */'
alias lld.='ll -d .*/'
alias lld,='ll -d */ .*/'

# cd
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias cddev="cd $DEV"
alias cddl="cd $DOWNLOADS"
alias cddoc="cd $DOCUMENTS"
alias cdpic="cd $PICTURES"
alias cdvid="cd $VIDEOS"
alias cddot="cd $DOTFILES"
alias cdbin="cd $LOCALBIN"
alias cdconf="cd $CONFIG"
alias cdb="cd $LBIN"
alias cdsc="cd $SCRIPTS"
alias cdpdfs="cd $PDFS"
alias cdwh="cd $WH"
alias cdbd="cd $BUILDS"
alias fcd=". fcd"
b(){ cd "$(bk -L | fzf)"; }

# mkdir
alias mkdir='mkdir -pv'     # Add parent dir on demand

# grep
alias grep='grep --color=auto'
alias g='grep -i'
alias gv='grep -iv'
alias gc='grep'
alias gcv='grep -v'

# diff
alias diff='diff --color=auto'

# vim
alias vi='vim'
alias v='vim'
alias vg='gvim'

# git
alias gs='git status'
alias gb='git branch'
alias ga='git add'
alias gc='git commit'
alias gch='git checkout'
alias gp='git push'
alias gl='git pull'
alias gf='git fetch'
alias gm='git merge'

# find
alias find='fd'

# stardict
alias def='sdcv --color'
alias defen='def -u "dictd_www.dict.ogrep_gcide"'
alias defel='def -u "dictd_www.dict.ogrep_elements"'
alias defcomp='def -u "Free On-Line Dictionary of Computing"'
alias defde='def -u "German - English" -u "English - German"'

# media
alias vid='mpv'
alias img='sxiv -a'
alias ytdl='youtube-dl'

# buku
alias bu='buku --suggest'

# wallpaper
alias randwall='feh --bg-fill --randomize ~/Pictures/*/*-ls-* &'

# system info
alias free='free -hlt'
alias free1000='free -hlt --si' # display using power of 1000 instead 1024
alias ps='ps auxf'
alias ps?='ps auxf | grep -v grep | grep -i -e "PID %CPU %MEM" -e' 
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

# networking
alias ipinfo='curl ifconfig.me/all && echo ""'
alias myip='curl ifconfig.me/ip; echo'

# transmission
alias tm='transmission-remote'
alias tma='tm -er -a'


# misc
alias hist?='history | g'
alias busy="cat /dev/urandom | hexdump -C | grep \"ca fe\""
alias s="du -sh ./* | sort -h"
alias sd="du -sh ./*/ | sort -h"

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
extract() { 
    if [ -f $1 ] ; then 
      case $1 in 
        *.tar.bz2)   tar xjf $1     ;; 
        *.tar.gz)    tar xzf $1     ;; 
        *.bz2)       bunzip2 $1     ;; 
        *.rar)       unrar e $1     ;; 
        *.gz)        gunzip $1      ;; 
        *.tar)       tar xf $1      ;; 
        *.tbz2)      tar xjf $1     ;; 
        *.tgz)       tar xzf $1     ;; 
        *.zip)       unzip $1       ;; 
        *.Z)         uncompress $1  ;; 
        *.7z)        7z x $1        ;; 
        *)     echo "'$1' cannot be extracted via extract()" ;; 
         esac 
     else 
         echo "'$1' is not a valid file" 
     fi 
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
