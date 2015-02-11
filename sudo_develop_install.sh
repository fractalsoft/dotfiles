#!/bin/bash

sudo add-apt-repository ppa:ubuntu-mozilla-daily/firefox-aurora
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome-beta.list'
sudo aptitude update
sudo aptitude install \
  firefox \
  google-chrome-beta \
  opera \
  npm
  tig
sudo aptitude upgrade
