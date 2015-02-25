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

# elixir
if [ -d ~/opt/elixir ]; then
  export PATH="$PATH:$HOME/opt/elixir/bin"
fi

# npm
if [ -d ~/.npm-packages ]; then
  export NPM_PACKAGES="$HOME/.npm-packages"
  export PATH="$NPM_PACKAGES/bin:$PATH"
  # export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
  export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
fi

if [ -f /usr/bin/java ]; then
  export JAVA_HOME="/usr"
fi

if [ -d ~/opt/android-sdk-linux ]; then
  export PATH="$HOME/opt/android-sdk-linux/tools:$PATH"
fi

none='\e[0m'
red='\e[0;31m'
green='\e[0;32m'
blue='\e[0;34m'
purple='\e[0;35m'
cyan='\e[0;36m'
gray='\e[0;37m'
light_red='\e[1;31m'
light_green='\e[1;32m'
yellow='\e[1;33m'
light_blue='\e[1;34m'
light_purple='\e[1;35m'
white='\e[1;37m'

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$([[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*")]/"
}

# \u - user | \h - host | \w - path | \$ - prompt (# for root)
export PS1="\[$light_red\]\u\[$cyan\]@\[$light_green\]\h \[$light_blue\]\w \[$yellow\]\$(parse_git_branch)\[$green\]\$$none "

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
