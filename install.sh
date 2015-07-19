#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
OS_NAME=`uname`
RUBY_VERSION=2.2.1

pathadd() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="${PATH:+"$PATH:"}$1"
  fi
}

# update submodules
(cd $DIR && git submodule update --init --recursive)

# install brew
if [ $OS_NAME == "Darwin" ]
then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
  BREW_PATH=/usr/local/bin
  pathadd $BREW_PATH
elif [ $OS_NAME == "Linux" ]
then
  echo "Checking homebrew dependencies..."
  PACKAGES=(build-essential curl git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev)
  for package in $PACKAGES 
  do
    dpkg -s $package > /dev/null 2>&1
    if [ $? == 1 ]
    then
      echo "Installing homebrew dependency $package"
      yes | sudo apt-get install $package > /dev/null 2>&1 
    fi
  done
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)";
  BREW_PATH=$HOME/.linuxbrew/bin
  pathadd $BREW_PATH
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
  exit 1
fi

# install python

if [ $OS_NAME == "Darwin" ]
then
  brew install python 
elif [ $OS_NAME == "Linux" ]
then
  yes | sudo apt-get install python-dev 
fi 

# vim config and plugins

if [[ ! `which vim` == *$BREW_PATH* ]]
then
  brew install vim
fi

if [[ ! -e $HOME/.vimrc ]]
then 
  ln -s $DIR/vimrc $HOME/.vimrc
fi

if [[ ! -e $HOME/.vim ]]
then 
  ln -s $DIR/vim $HOME/.vim
fi

if [[ ! -e $HOME/.vimbackup ]]
then 
  mkdir $HOME/.vimbackup
fi

which cmake > /dev/null 2>&1
if [ $? != 0 ]
then
  if [ $OS_NAME == "Darwin" ]
  then
    brew install cmake
  elif [ $OS_NAME == "Linux" ]
  then
    yes | sudo apt-get install cmake
  fi 
fi
(cd $DIR/vim/bundle/YouCompleteMe && ./install.sh)

# install fish
which fish > /dev/null 2>&1
if [ $? != 0 ]
then
  brew install fish
fi

if ! grep fish /etc/shells > /dev/null 2>&1
then
  echo `which fish` | sudo tee -a /etc/shells
fi

if [[ ! $SHELL == *"fish"* ]]
then
  chsh -s `which fish` 
fi

# link fish config
if [[ ! -e $HOME/.config ]]
then 
  ln -s $DIR/config $HOME/.config
fi

if [[ ! -e $HOME/.oh-my-fish ]]
then 
  ln -s $DIR/oh-my-fish $HOME/.oh-my-fish
fi

fish -c "omf install"

# install rbenv
# brew install rbenv
# brew install ruby-build

# install ruby
# rbenv install $RUBY_VERSION
# rbenv rehash

echo "Done! Open a new terminal window to see your new shell."

