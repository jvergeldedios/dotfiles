#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
OS_NAME=`uname`
RUBY_VERSION=2.2.1

# update submodules
(cd $DIR && git submodule update --init --recursive)

# install brew
if [ $OS_NAME == "Darwin" ]
then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
elif [ $OS_NAME == "Linux" ]
then
  PACKAGES=(build-essential curl git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev)
  for package in $PACKAGES do
    dpkg -s $package
    if [ $? == 1 ]
    then
      sudo apt-get install $package
    fi
  done
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)";
else
  echo "This system not compatible with homebrew... exiting."
  exit 1
fi

brew update
brew upgrade
brew doctor

if [ $? != 0 ]
then
  echo "Fix brew issues then run this script again."
fi

# install fish
# brew install fish

# install rbenv
# brew install rbenv
# brew install ruby-build

# install ruby
# rbenv install $RUBY_VERSION
# rbenv rehash

# vim config and plugins
ln -s $DIR/vimrc $HOME/.vimrc
ln -s $DIR/vim $HOME/.vim


