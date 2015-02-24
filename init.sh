#!/bin/bash

CURRENT=`pwd`
SOURCE=.dotfiles
FILES=".aliases .bash_functions .bash_login .bash_logout .bash_profile .bashrc .curlrc .gemrc .gitconfig .home_aliases .irbrc .irc .profile .pryrc .railsrc .rubocop.yml .screenrc .zlogin .zprofile .zshenv .zshrc"

if [ ! -f $SOURCE/.home_aliases ]; then
  cp ~/$SOURCE/.home_aliases.template ~/$SOURCE/.home_aliases
fi

if [ ! -f $SOURCE/.irc ]; then
  cp ~/$SOURCE/.irc.template ~/$SOURCE/.irc
fi

if [ ! -f $SOURCE/.gitconfig ]; then
  cp ~/$SOURCE/.gitconfig.template ~/$SOURCE/.gitconfig
fi

ln -fsv $SOURCE/rvmrc ~/.rvmrc

for f in $FILES
do
  if [ ! -f ~/$f ]; then
    ln -fsv $SOURCE/$f ~/
  fi
done

# Sublime Text 3 config file
DIRECTORY=.config/sublime-text-3/Packages/User
if [ -d $DIRECTORY ]; then
  if command -v subl >/dev/null; then
    ln -fsv "$HOME/$SOURCE/$DIRECTORY/Preferences.sublime-settings" "$HOME/$DIRECTORY/"
    ln -fsv "$HOME/$SOURCE/$DIRECTORY/Default (Linux).sublime-keymap" "$HOME/$DIRECTORY/"
  fi
fi
