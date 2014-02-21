if [[ $OS = Windows* ]]; then
    #mintty zenburn colors
    source $dotfiles/ttycolors/zenburn.sh
fi
setopt AUTOCD
setopt CD_ABLE_VARS
setopt PUSHD_IGNORE_DUPS AUTOPUSHD
setopt CORRECT
setopt EXTENDED_GLOB

set -o vi
if [[ $OS = Windows* ]]; then
    progfiles="`/usr/bin/cygpath -au 'c:\Program Files (x86)'`"
fi

# Autoloads
# http://www.refining-linux.org/archives/36/ZSH-Gem-1-Programmable-file-renaming/
autoload -U zmv
#autoload -U promptinit
#promptinit
if [[ ! $OS = Windows* ]]; then
    autoload -U compinit #Used for compdef function. See aliases
    compinit
fi

# http://superuser.com/questions/362227/how-to-change-the-title-of-the-mintty-window
# Change title of MinTTY to current dir
function settitle() {
    echo -ne "\033]2;"$1"\007"
}
function chpwd() {
    settitle $PWD
}

expl() {
	if [[ -z "$1" ]]; then
		explorer `cygpath -aw "."`
	else
		explorer `cygpath -aw "$1"`
	fi
}

spdf() {
    if [[ -z "$1" ]];then
        echo "Usage: spdf <pdfPath>"
    else
        pdfPath=`cygpath -aw  "$1"`
        "$progfiles/SumatraPDF/SumatraPDF.exe" "$pdfPath" 
    fi
}

wdiff() {
    # C:\Program Files (x86)\WinMerge
    if [[ $# -lt 2 ]]; then
        echo "Usage: wdiff <file1> <file2>"
    else
        f1=`cygpath -aw  "$1"`
        f2=`cygpath -aw  "$2"`
        "$progfiles/WinMerge/WinMergeU.exe" "$f1" "$f2"
    fi
}

scite() {
    if [[ -z "$1" ]];then
        echo "Usage: scite <filePath>"
    else
        fpath=`cygpath -aw "$1"`
        "$progfiles/SciTE/SciTE.exe" "$fpath"
    fi
}

function proxyset() {
    export http_proxy="http://proxy.blrl.sap.corp:8080"
    export https_proxy=$http_proxy
    if [[ ! -z $http_proxy ]]; then
        echo "Proxy set to $http_proxy"
    fi
}

function proxyclear() {
    unset http_proxy
    unset https_proxy
}


#Figure out whether I should set proxy or not.
#I don't think this works when I am connected remotely...

if [[ $OS = Windows* ]]; then
    myip=`ipconfig | grep -i 'IPv4 Address' | cut -d:  -f2`
    myip=`echo $myip| tr -d '[[:space:]]'`
    if [[ "$myip" != 192.168.1* ]]; then
        proxyset
    fi
fi

export EDITOR='vim'
source $dotfiles/histenv
function gitenv-sap() {
    source $dotfiles/env/gitenv-sap
}
function gitenv-hub() {
   source $dotfiles/env/gitenv-hub
}
source $dotfiles/git.zsh

# Mounts
if [[ $OS = Windows* ]]; then
    if [[ -d /cygdrive/c ]]; then
        mount c: /c 2> /dev/null
    fi
    if [[ -d /cygdrive/d ]]; then
        mount d: /d 2> /dev/null
    fi
fi

#bindkeys
bindkey ' ' magic-space

export SHELL='zsh'
export PS1='%~$ '


if [ -f "${HOME}/dotfiles/aliases" ]; then
   source "${HOME}/dotfiles/aliases"
fi


#Setup SSH Agent
#http://holdenweb.blogspot.in/2007/12/cygwin-ssh-agent-control.html
export SSH_AUTH_SOCK=/tmp/.ssh-socket

ssh-add -l >/dev/null 2>&1
if [ $? = 2 ]; then
# Exit status 2 means couldn't connect to ssh-agent; start one now
rm -rf /tmp/.ssh-*
ssh-agent -a $SSH_AUTH_SOCK >/tmp/.ssh-script
source /tmp/.ssh-script
echo $SSH_AGENT_PID >/tmp/.ssh-agent-pid
fi


function kill-agent {
pid=`cat /tmp/.ssh-agent-pid`
kill $pid
}

#Ok now load some zsh libraries if present
if [[ -d  $dotfiles/scripts/github/z ]]; then
    . $dotfiles/scripts/github/z/z.sh
fi
cd ~


# Add colors to osx terminal
# http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
# Currently use the theme:  Deluxive State
# https://github.com/Deluxive/osx-terminal-themes/blob/master/Deluxive%20State.terminal
if [[ $TERM_PROGRAM == "Apple_Terminal" ]]; then
    echo "Setting ls colors assuming dark themed terminal"
    export CLICOLOR=1
    export LSCOLORS=GxFxCxDxBxegedabagaced #for dark terminal
fi
