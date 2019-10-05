##---PATHS---##
##---PATHS---##
export HOME="/home/simon"
export LBIN="$HOME/.bin"
export SCRIPTS="$LBIN/scripts"
export DMENU="$LBIN/dmenu"
export WRAPPER="$LBIN/wrapper"
export LOG="$HOME/.log"
export DIV="$HOME/.div"
export CONFIG="$HOME/.config"
export LOCALBIN="$HOME/.bin"
export DOTFILES="$HOME/.dotfiles"
export DOWNLOADS="$HOME/Downloads"
export DOCUMENTS="$HOME/Documents"
export PICTURES="$HOME/Pictures"
export VIDEOS="$HOME/Videos"
export DEV="$HOME/dev"
export PDFS="$HOME/pdfs"
export WH="/mnt/wh"
export BUILDS="$HOME/.builds"

export PATH="$PATH:$SCRIPTS:$DMENU:$WRAPPER"
export EDITOR="vim"
export VISUAL="vim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
export FILE="ranger"
export LANG="en_GB.UTF-8"
#export TERM=rxvt-unicode-256color
export TERM=st-256color
export STARDICT_DATA_DIR="$HOME/.dic"
export XDG_CONFIG_HOME="$CONFIG"
export WINEARCH="win64"
#export WINEPREFIX="/home/simon/.steam/steam/steamapps/compatdata/377160/pfx setup_dxvk64"
export WINEPREFIX="/home/simon/.wine/lutris64 setup_dxvk64"
export LIBVA_DRIVER_NAME="radeonsi"
export PASSWORD_STORE_ENABLE_EXTENSIONS="true"
export FZF_DEFAULT_COMMAND="rg --files --hidden --smart-case --glob '!.git/*'"

# Start graphical server if i3 not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx
