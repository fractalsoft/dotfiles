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

export RAILS_ENV=development

# rbenv
if [ -d ~/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# rvm
if [ -d ~/.rvm ]; then
  export PATH="$HOME/.rvm/bin:$PATH"
fi

# phpenv after rbenv
if [ -d ~/.phpenv ]; then
  export PATH="$PATH:$HOME/.phpenv/bin"
  eval "$(phpenv init -)"
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
