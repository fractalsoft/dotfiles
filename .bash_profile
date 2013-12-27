if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -f ~/.profile ]; then
  source ~/.profile
fi

# User specific environment and startup programs
if [ -d "$HOME/bin" ]; then
  PATH="$PATH:$HOME/bin"
fi
# BASH_ENV=$HOME/.bashrc
# USERNAME=""
# export USERNAME BASH_ENV
export PATH
