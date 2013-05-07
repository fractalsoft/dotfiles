#!/bin/bash

# Sometimes we need PHP
if [ ! -d ~/.phpenv ]; then
  git clone git://github.com/phpenv/phpenv.git .phpenv
fi
