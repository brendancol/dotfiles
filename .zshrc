set -o vi

# Path to your oh-my-zsh installation.
export ZSH=/Users/$(whoami)/.oh-my-zsh

# Git Aliases
alias gts="git status"
alias gtd="git diff"
alias gta="git add"
alias gtc="git commit"

# Python
alias pypy_pip='./pypy-2.1/bin/pip'

# Java Homes
alias j8='export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)'

# ZSH specific
ZSH_THEME="bureau"
plugins=(git,vim,tmux,python,pip,pylint)

#GDAL
export PATH="/Library/Frameworks/GDAL.framework/Programs:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/go/bin"

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
