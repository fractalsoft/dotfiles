#!/bin/bash

CURRENT=`pwd`
SOURCE=.dotfiles
FILES=".aliases .bash_functions .bash_login .bash_logout .bash_profile .bashrc .curlrc .gemrc .gitconfig .home_aliases .irbrc .profile .pryrc .railsrc .rvmrc .screenrc .zlogin .zprofile .zshenv .zshrc"

if [ ! -f $SOURCE/.home_aliases ]; then
  cp ~/$SOURCE/.home_aliases.template ~/$SOURCE/.home_aliases
fi

if [ ! -f $SOURCE/.gitconfig ]; then
  cp ~/$SOURCE/.gitconfig.template ~/$SOURCE/.gitconfig
fi

for f in $FILES
do
  if [ ! -f ~/$f ]; then
    ln -fsv $SOURCE/$f ~/
  fi
done

# Sublime Text 2 config file
DIRECTORY=.config/sublime-text-2/Packages/User
if [ -d $DIRECTORY ]; then
  if command -v sublime-text-2 >/dev/null; then
    ln -sF "$HOME/$SOURCE/$DIRECTORY/Preferences.sublime-settings" "$HOME/$DIRECTORY/"
    ln -sF "$HOME/$SOURCE/$DIRECTORY/Default (Linux).sublime-keymap" "$HOME/$DIRECTORY/"
  fi
fi
