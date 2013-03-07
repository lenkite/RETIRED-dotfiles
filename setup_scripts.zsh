#!/bin/zsh
cd ~/dotfiles

if [[ ! -d scripts/github ]]; then
    mkdir -p scripts/github
fi

#Grab ack http://betterthangrep.com
wget http://betterthangrep.com/ack-standalone -O scripts/ack && chmod 0755 scripts/ack


if [[ -d scripts/github ]]; then
    rm -rf scripts/github/*
fi
cd scripts/github
git clone --depth 1 -b master https://github.com/rupa/z.git
cd ../../

