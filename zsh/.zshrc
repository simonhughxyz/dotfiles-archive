# Shell options
setopt GLOB_COMPLETE     # case insensitive globbing
setopt AUTO_CD           # change directory without cd
setopt AUTO_PUSHD        # Add cd into directory history
setopt PUSHD_IGNORE_DUPS # Ignore duplicate directories
setopt CORRECT           # enable corrections
setopt CORRECT_ALL
setopt RM_STAR_WAIT # Ask for confirmation after 'rm *'
export REPORTTIME=30 # Report time for any command lasting more than 30 seconds

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt SHARE_HISTORY          # share history across multiple zsh sessions
setopt APPEND_HISTORY         # append to hist-file rather than override
setopt INC_APPEND_HISTORY     # update hist-file after every command
setopt HIST_EXPIRE_DUPS_FIRST # expire duplicate commands first
setopt HIST_IGNORE_DUPS       # do not store duplicate commands
setopt HIST_FIND_NO_DUPS      # ignore duplicates when searching
setopt HIST_REDUCE_BLANKS     # remove blank lines from history

# Set default permission
umask 077 # leads to 600 for files and 700 for directories

# Prompt
autoload -U colors && colors
# Git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{5}(%b)%f'
zstyle ':vcs_info:*' enable git
# set prompt
RPROMPT="\$vcs_info_msg_0_"
PROMPT="%F{yellow}%1~ %F{blue}%(!.#.>)%f%b "


# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shell/alias.sh" ] && source "$HOME/.config/shell/alias.sh"
[ -f "$HOME/.config/shell/alias.zsh" ] && source "$HOME/.config/shell/alias.zsh"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
