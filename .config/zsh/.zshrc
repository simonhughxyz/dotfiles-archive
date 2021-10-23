# Shell options
setopt GLOB_COMPLETE     # case insensitive globbing
setopt AUTO_CD           # change directory without cd
setopt AUTO_PUSHD        # Add cd into directory history
setopt PUSHD_IGNORE_DUPS # Ignore duplicate directories
# setopt CORRECT           # enable corrections
# setopt CORRECT_ALL
# setopt RM_STAR_WAIT # Ask for confirmation after 'rm *'
export REPORTTIME=5 # Report time for any command lasting more than 30 seconds

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
# Git status
prompt_git_status() {
    f_color="5"
    f_color_staged="yellow"
    f_color_unstaged="red"

    local message=""
    local message_color="%F{$f_color}"

    # https://git-scm.com/docs/git-status#_short_format
    local staged=$(git status --porcelain 2>/dev/null | grep -e "^[MADRCU]")
    local unstaged=$(git status --porcelain 2>/dev/null | grep -e "^[MADRCU? ][MADRCU?]")

    if [[ -n ${staged} ]]; then
        message_color="%F{$f_color_staged}"
    elif [[ -n ${unstaged} ]]; then
        message_color="%F{$f_color_unstaged}"
    fi

    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [[ -n ${branch} ]]; then
        message+="${message_color}${branch}%f"
    fi

    echo -n "${message}"
}

prompt_current_dir() {
    f_color="yellow"
    last_path="1" # last nr of elements of path to show.
    echo "%F{$f_color}%$last_path~%f" 
}

prompt_symbol() {
    f_color="blue"
    f_sudo_color="red"
    echo "%(!.%F{$f_sudo_color}#.%F{$f_color}>)%f"
}

prompt_exit_code() {
    f_color="red"
    echo "%F{$f_color}%(?..%? )%f"
}

autoload -U colors && colors
setopt prompt_subst
RPROMPT='$(prompt_git_status)'
PROMPT='$(prompt_current_dir) $(prompt_exit_code)$(prompt_symbol)%f%b '


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

n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}


# First check if file exists before sourcing it.
_source() {
    [ -f $1 ] && source $1
}

# Load aliases and shortcuts if existent.
_source "$HOME/.config/shell/alias.sh"
_source "$HOME/.config/shell/alias.zsh"

# Load autojump
_source /usr/share/autojump/autojump.zsh

# Load fzf
_source ~/.fzf.zsh

# Load autosuggestions
_source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load zsh-syntax-highlighting; should be last.
_source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

#gpg
export GPG_TTY=$(tty)

# Run tmux if:
# - tmux is installed.
# - not already running.
# - shell is interactive.
if command -v tmux &> /dev/null && [ -z "$TMUX" ] && [[ $- = *i* ]]; then
    # Always run tmux in base session.
    tmux attach -t base || tmux new -s base
fi
