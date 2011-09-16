#!/bin/bash

# Symlinks for bash and readline
rm ~/.bash_profile
rm ~/.bashrc
rm ~/.inputrc
ln -s ~/dotfiles/bash_profile ~/.bash_profile
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/inputrc ~/.inputrc

rm ~/.vimrc
rm -rf ~/.vim
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim
