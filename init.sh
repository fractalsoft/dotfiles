#!/bin/bash

CURRENT=`pwd`
SOURCE=.dotfiles
FILES=".aliases .bash_functions .bash_login .bash_logout .bash_profile .bashrc .curlrc .gemrc .gitconfig .irbrc .profile .pryrc .railsrc .rvmrc .screenrc .zlogin .zprofile .zshenv .zshrc"
if [ ! -f $SOURCE/.gitconfig ]; then
  cp ~/$SOURCE/.gitconfig.template ~/$SOURCE/.gitconfig
fi
for f in $FILES
do
  ln -sF $SOURCE/$f ~/
done

# Sublime Text 2 config file
DIRECTORY=.config/sublime-text-2/Packages/User
if [ -d $DIRECTORY ]; then
  if command -v sublime-text-2 >/dev/null; then
    ln -sF "$HOME/$SOURCE/$DIRECTORY/Preferences.sublime-settings" "$HOME/$DIRECTORY/"
    ln -sF "$HOME/$SOURCE/$DIRECTORY/Default (Linux).sublime-keymap" "$HOME/$DIRECTORY/"
  fi
fi
