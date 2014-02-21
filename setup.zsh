#!/bin/zsh
if [[ -z dotfiles ]]; then
	export dotfiles=`dirname $0`
fi
cd $dotfiles
source $dotfiles/setup_scripts.zsh
source $dotfiles/setup_vi.zsh
