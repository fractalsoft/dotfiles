#!/bin/bash

sudo add-apt-repository ppa:bitcoin/bitcoin
sudo aptitude update
sudo aptitude install \
  bitcoin \
  bitcoin-qt
