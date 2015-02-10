#!/bin/bash

###############
# Install jsc
###############
JARS=.jars
if [ ! -d ~/$JARS ]; then
  mkdir ~/$JARS
fi

NAME=rhino1_7R4
URL=https://github.com/downloads/mozilla/rhino/$NAME.zip
TMP=/tmp

# Downloading
wget $URL > /dev/null 2>&1

if [ -f $NAME.zip ]; then
  unzip $NAME.zip -d $TMP > /dev/null 2>&1
  cp $TMP/$NAME/js.jar $JARS
  rm -r $TMP/$NAME
  rm -r $NAME.zip
fi

####################
# Install PhantomJS
####################
# phantomjs-1.9.0-linux-i686
# phantomjs-1.9.0-linux-x86_64
NAME=phantomjs-1.9.0-linux-i686
URL=https://phantomjs.googlecode.com/files/$NAME.tar.bz2

wget $URL > /dev/null 2>&1

if [ -f $NAME.tar.bz2 ]; then
  tar jxf $NAME.tar.bz2 > /dev/null 2>&1
  cp $NAME/bin/phantomjs $JARS
  rm -r $NAME
  rm -r $NAME.tar.bz2
fi

################
# Install rbenv
################
if [ ! -d ~/.rbenv ]; then
  git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  git clone git://github.com/jamis/rbenv-gemset.git ~/.rbenv/plugins/rbenv-gemset
fi

################
# Install rvm
################
if [ ! -d ~/.rvm ]; then
  curl -sSL https://rvm.io/mpapis.asc | gpg --import -
  curl -L https://get.rvm.io | bash -s stable --ruby
fi
