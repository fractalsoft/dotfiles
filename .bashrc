# history params
HISTCONTROL=ignoredups
shopt -s histappend
PROMPT_COMMAND='history -a'

# enable changing directory typos
shopt -s cdspell

# include global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# include file with functions
if [ -f ~/.bash_functions ]; then
  . ~/.bash_functions
fi

# include file with aliases
if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

# nvm
if [ -d ~/.nvm ]; then
  . ~/.nvm/nvm.sh
  [[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
fi

# rbenv
if [ -d ~/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# rvm
if [ -d ~/.rvm ]; then
  export PATH="$HOME/.rvm/bin:$PATH"
fi

none='\033[0m'
red='\033[0;31m'
green='\033[0;32m'
blue='\033[0;34m'
purple='\033[0;35m'
cyan='\033[0;36m'
gray='\033[0;37m'
light_red='\033[1;31m'
light_green='\033[1;32m'
yellow='\033[1;33m'
light_blue='\033[1;34m'
light_purple='\033[1;35m'
white='\033[1;37m'

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$([[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*")]/"
}

# \u - user | \h - host | \w - path | \$ - prompt (# for root)
export PS1="${light_red}\u${cyan}@${light_green}\h ${light_blue}\w ${yellow}\$(parse_git_branch)${green}\$${none} "

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
