#!/bin/bash

cd $HOME
if [ ! -d ~/dotfiles ]; then
  echo No existing ~/dotfiles, cloning...
  git clone git://github.com/derwiki/dotfiles.git ~/dotfiles
  (cd ~/dotfiles && bash install.sh)
else
  echo Found ~/dotfiles, updating...
  (cd ~/dotfiles && bash update.sh)
fi

for folder in bin src; do
  if [ ! -d ~/$folder ]; then
    mkdir ~/$folder
  fi
done

if [ ! -d ~/scripts ]; then
  git clone git://github.com/derwiki/scripts.git ~/scripts
  echo >> ~/.bashrc
  echo # auto-generated by github.com/derwiki/scripts/install.sh >> ~/.bashrc
  echo . ~/scripts/helpers.sh >> ~/.bashrc
fi

if [ ! -f ~/scripts/git-completion.bash ]; then
  curl -L https://github.com/git/git/raw/master/contrib/completion/git-completion.bash > ~/scripts/git-completion.bash
  echo source ~/scripts/git-completion.bash >> $HOME/.bash_profile
fi