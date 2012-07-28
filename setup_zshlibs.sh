#!/bin/zsh
cd ~/dotfiles
rm -rf zlibs/github/*
cd zlibs/github
git clone --depth 1 -b master https://github.com/rupa/z.git
