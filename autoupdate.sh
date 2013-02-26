#!/bin/bash

CURRENT=`pwd`
cd ~/.dotfiles
git stash
git pull
git stash pop
cd $CURRENT
