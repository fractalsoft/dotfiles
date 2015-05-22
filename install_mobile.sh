#!/bin/bash

NPM_PACKAGES="$HOME/.npm-packages"
if [ ! -d $NPM_PACKAGES ]; then
  echo $NPM_PACKAGES
  mkdir -p "$NPM_PACKAGES"
  touch ~/.npmrc
  grep -q -F "prefix = $NPM_PACKAGES" ~/.npmrc || echo "prefix = $NPM_PACKAGES" >> ~/.npmrc
  npm_config_prefix=$NPM_PACKAGES curl -L https://npmjs.org/install.sh | sh
fi

PROGRAMS_PATH="$HOME/opt"
ANDROID_SDK_PATH="$PROGRAMS_PATH/android-sdk-linux"
if [ ! -d $ANDROID_SDK_PATH ]; then
  wget http://dl.google.com/android/android-sdk_r24.0.2-linux.tgz -O $PROGRAMS_PATH/android.tgz
  cd $PROGRAMS_PATH
  tar xf $PROGRAMS_PATH/android.tgz
  cd $HOME
fi

if command -v npm; then
  npm install -g nodejs
  npm install -g bower
  npm install -g grunt-cli
  npm install -g gulp
  npm install -g cordova
  npm install -g ember-cli
fi
