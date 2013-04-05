#!/bin/bash

sudo add-apt-repository ppa:webupd8team/sublime-text-2
sudo aptitude update
sudo aptitude install build-essential openssl \
  openssh-server openssh-client \
  libreadline6 libreadline6-dev \
  curl wget libcurl4-openssl-dev \
  git git-core subversion gitk \
  zip zlib1g zlib1g-dev p7zip rar unrar \
  libssl-dev libyaml-dev libxslt1-dev \
  sqlite3 libsqlite3-dev sqlitebrowser \
  libxml2-dev libxslt-dev autoconf libc6-dev \
  libgdbm-dev libffi-dev \
  ncurses-dev libncurses5 libncurses5-dev \
  automake libtool bison \
  pkg-config \
  tcl-dev tk tk-dev \
  imagemagick libmagick++-dev libmagickcore-dev libmagickwand-dev \
  sublime-text gedit gedit-plugins vim \
  chromium-browser lynx elinks-lite \
  postgresql postgresql-client libpq-dev gsql \
  bash zsh zsh-lovers guake terminator screen byobu yakuake \
  nmap htop mc \
  openjdk-7-jre eclipse eclipse-egit \
  libmysql-ruby libmysqlclient-dev

# libmagick++4 libmagickcore4 libmagickcore4-extra
