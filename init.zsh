#!/bin/bash

if [[ `uname` == 'Darwin' ]] ; then
	osx=true
	echo "Running osx"
fi

#export dotfiles=`dirname $0`
#http://stackoverflow.com/questions/5756524/how-to-get-absolute-path-name-of-shell-script-on-macos
# it is really crappy that we don't have a better way to get full path to a script
export dotfiles=$(cd "$(dirname "$0")"; pwd)

echo "Dot files directory: $dotfiles"
# if [ "$osx" = true ]
export SDKHOME=~/sdk

#TOOD: may bei should delete this ? 
rm ~/.bash_aliases 2> /dev/null
rm ~/.inputrc 2> /dev/null


# Links to zsh startup scripts
rm ~/.zshrc 2> /dev/null
rm ~/.zprofile 2> /dev/null
rm ~/.zshrc 2> /dev/null

ln $dotfiles/zshrc ~/.zshrc
#TODO: consider using zshenv instead of zprofile
#ln $dotfiles/zprofile ~/.zprofile
rm ~/.zshenv 2> /dev/null
ln $dotfiles/zshenv ~/.zshenv

# Symlinks for VIM
rm ~/.vimrc 2> /dev/null
ln $dotfiles/vimrc ~/.vimrc

rm ~/.vim 2> /dev/null
echo "ln -s $dotfiles/vim ~/.vim"
ln -s $dotfiles/vim ~/.vim

echo "Now kindly run setup.zsh"



