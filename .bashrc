#
# ~/.bashrc
#

EDITOR="vim"
TERMINAL="st"
TERM="st-256color"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# append to the history file, don't overwrite it
shopt -s histappend

# Unlimited history
HISTSIZE=-1
HISTFILESIZE=-1

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# git prompt
source /usr/share/git/completion/git-prompt.sh
PS1='\[\033[1;34m\]\W\[\033[m\] $(__git_ps1 "(\[\033[32m\]%s\[\033[m\]) ")\[\033[1;33m\]→\[\033[m\] '

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias dfiles='git --git-dir=$HOME/repos/dotfiles/ --work-tree=$HOME'

alias wttr='curl wttr.in'

neofetch

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Extract
extract() {
    if [[ -f $1 ]] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1 ;;
            *.tar.gz)    tar xzf $1 ;;
            *.bz2)       bunzip2 $1 ;;
            *.rar)       rar x $1 ;;
            *.gz)        gunzip $1 ;;
            *.tar)       tar xf $1 ;;
            *.tbz2)      tar xjf $1 ;;
            *.tgz)       tar xzf $1 ;;
            *.zip)       unzip $1 ;;
            *.Z)         uncompress $1 ;;
            *.7z)        7z x $1 ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

