# Profile file
# set environment variables here
# runs once on login.

# path
export LBIN="$HOME/bin"
export PATH="$LBIN:$PATH"

# default programs
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="xst"
export BROWSER="firefox"
export READER="zathura"
export FILE="nnn"

# default options
export LANG="en_GB.UTF-8"
export PASSWORD_STORE_ENABLE_EXTENSIONS="true"
export WINEARCH="win64"
export WINEPREFIX="/home/simon/.wine/lutris64 setup_dxvk64"
export FZF_DEFAULT_COMMAND="rg --files --hidden --smart-case --glob '!.git/*'"
export LIBVA_DRIVER_NAME="radeonsi"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# Program settings
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"

# # LESS
export LESS=-R

# paths
export DOTFILES="$HOME/.dotfiles"
export WH="/mnt/wh"


# Get NNN config
nnn_config=$HOME/.config/nnn/nnnrc
[ -f $nnn_config ] && source $nnn_config

# Start graphical server if i3 not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx
