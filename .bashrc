# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


# PS1 Prompt
PS1_HOST="\[\e[33m\]\u\[\e[m\]@\[\e[33m\]\h\[\e[m\]>\[\e[36m\]\w\[\e[m\]\\$ "

PS1_NO_HOST="\[\e[33m\]\u\[\e[m\]>\[\e[36m\]\w\[\e[m\]\\$ "

PS1_CURRENT_DIR="\[\e[33m\]\u\[\e[m\]>\[\e[36m\]\W\[\e[m\]\\$ "

export PS1=$PS1_CURRENT_DIR

##---ALIASES---##
alias sbash='source ~/.bashrc'  # reload .bashrc
alias spbash='source ~/.profile'
# shortcuts 
alias path='echo $PATH'
alias c='clear'
alias mux='tmuxinator'
alias clip='xclip -selection clipboard'
alias paste='xclip -o'
# ls
alias ls='ls --color=auto --group-directories-first'
alias la='ls -a --color=auto'
alias l.='ls -d .* --color=auto'
alias ll='ls -al --color=auto'
# cd
alias cd..='cd ..'
alias cd...='cd ../../'
alias cd....='cd ../../../'
alias cddev="cd $DEV"
alias cddl="cd $DOWNLOADS"
alias cddot="cd $DOTFILES"
alias cdbin="cd $LOCALBIN"
alias cdconf="cd $CONFIG"
# mkdir
alias mkdir='mkdir -pv'     # Add parent dir on demand
# grep
alias grep='grep --color=auto'
# diff
alias diff='diff --color=auto'
# vim
alias vi='vim'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#PyEnv
export PATH="/home/simon/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
