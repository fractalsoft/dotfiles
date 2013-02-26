if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# User specific environment and startup programs
if [ -d "$HOME/bin" ]; then
  PATH="$PATH:$HOME/bin"
fi
# BASH_ENV=$HOME/.bashrc
# USERNAME=""
# export USERNAME BASH_ENV
export PATH
