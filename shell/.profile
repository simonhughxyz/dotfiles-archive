# Profile file
# set environment variables here
# runs once on login.

# try and set HOST
command -v hostname > /dev/null && export HOST="$( hostname )"

# Set runtime dir
export XDG_RUNTIME_DIR="/tmp/${USER}.runtime"
mkdir -m 0700 -p $XDG_RUNTIME_DIR

# path
export GOPATH="$HOME/.local/go"
export GOBIN="$GOPATH/bin"
export GOPATH="$GOPATH:$HOME/projects/go"
export LBIN="$HOME/.local/bin"
export PATH="$LBIN:$GOBIN:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# default programs
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="st"
export TERMCMD="${TERMINAL} -e "
export BROWSER="www"
export READER="zathura"
export FILE="nnn"
export MANPAGER="nvim +Man!"

# default options
export LANG="en_GB.UTF-8"
export PASSWORD_STORE_ENABLE_EXTENSIONS="true"
export WINEARCH="win64"
export WINEPREFIX="/home/simon/.wine/lutris64 setup_dxvk64"
export FZF_DEFAULT_COMMAND="rg --files --hidden --smart-case --glob '!.git/*'"
export FZF_DEFAULT_OPTS="--cycle --reverse --info=hidden --border --padding=0 --margin=0 --color=border:129,fg+:129:bold --bind=ctrl-space:print-query,ctrl-b:backward-kill-word,ctrl-w:kill-word,alt-b:backward-word,alt-w:forward-word,ctrl-p:toggle-preview,ctrl-g:top,ctrl-a:end-of-line,ctrl-i:beginning-of-line,ctrl-d:clear-query,ctrl-h:deselect-all,ctrl-f:jump,ctrl-s:toggle,ctrl-z:toggle-all,tab:replace-query"
export LIBVA_DRIVER_NAME="i965"
export BC_ENV_ARGS="-q -l $XDG_CONFIG_HOME/bc/extensions.bc"
export SXHKD_SHELL="/bin/sh"

# LS & EXA
export LS_COLORS='rs=0:di=0;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
export EXA_GRID_ROWD=2

# Program settings
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch/notmuchrc"
export NMBGIT="$XDG_DATA_HOME/notmuch/nmbug"

# # LESS
export LESS=-R

## WEECHAT
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"

# paths
export DOTFILES="$HOME/.dotfiles"
export WH="/mnt/wh"


# Source NNN config
nnn_config=$HOME/.config/nnn/nnnrc
[ -f $nnn_config ] && . $nnn_config

# Host specific config
if [ "$HOST" = "voidtower" ]; then
    export LIBVA_DRIVER_NAME="radeonsi"
else
    export LIBGL_ALWAYS_SOFTWARE=1
fi

# Start gpg-agent if needed with ssh support
/bin/gpg-agent --enable-ssh-support --daemon
export SSH_AUTH_SOCK=$(/bin/gpgconf --list-dirs agent-ssh-socket)

# source alias, mostly needed for dash
export ENV=$HOME/.config/shell/alias.sh

# Start graphical server
if [ "$(tty)" = "/dev/tty1" ] || [ "$(tty)" = "/dev/tty2" ]; then
    exec startx
fi
