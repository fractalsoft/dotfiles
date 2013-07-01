#!/bin/bash

sudo add-apt-repository ppa:bitcoin/bitcoin
wget -q -O- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
sudo aptitude update
sudo aptitude install \
  bitcoin \
  bitcoin-qt \
  glabels
