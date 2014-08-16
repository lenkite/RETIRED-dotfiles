#!/bin/zsh
if [[ -z dotfiles ]]; then
	export dotfiles=`dirname $0`
fi

local noproxy
if [[ $# -gt 0 ]] && [[ "$1" -eq "-noproxy" ]]; then
	noproxy=true
	echo "User has chosen not to use SAP proxy"
else
	noproxy=false
	echo "User has chosen to use SAP proxy"
fi

if [[ "$noproxy" == true ]]; then 
	unset http_proxy
	unset https_proxy
fi

cd $dotfiles
source $dotfiles/setup_scripts.zsh
source $dotfiles/setup_vi.zsh

if [[ "$noproxy" == true ]]; then 
	export https_proxy=http://proxy.blrl.sap.corp:8080
	export http_proxy=http://proxy.blrl.sap.corp:8080
fi
