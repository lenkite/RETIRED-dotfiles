#  / base-files version 4.0-4
# ~/.bashrc: executed by bash(1) for interactive shells.

# User dependent .bashrc file

# If not running interactively, don't do anything
#[[ "$-" != *i* ]] && return

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#

#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
#Uncomment to turn on programmable completion enhancements.
#Any completions you add in ~/.bash_completion are sourced last.
[[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options
#
# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
export HISTFILE=~/dotfiles/bash_history
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# Aliases
#
# Some people use a different file for aliases

if [[ $OS = Windows* ]]; then
    progfiles="`cygpath -au 'c:\Program Files (x86)'`"
fi


if [ -f "${HOME}/dotfiles/bash_aliases" ]; then
   source "${HOME}/dotfiles/bash_aliases"
fi

if [[ -f /etc/profile.d/wcd.sh ]]; then
    source /etc/profile.d/wcd.sh
fi
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
#
# Default to human readable figures
alias df='df -h'
alias du='du -h'
#
# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
# Some people use a different file for functions
# if [ -f "${HOME}/.bash_functions" ]; then
#   source "${HOME}/.bash_functions"
# fi
#
# Some example functions:
#
# a) function settitle
 settitle () 
 { 
   echo -ne "\e]2;$@\a\e]1;$@\a"; 
 }
# 
# Set terminal title
# @param string $1  Tab/window title
# @param string $2  (optional) Separate window title
 # The latest version of this software can be obtained here:
# See: http://fvue.nl/wiki/NameTerminal
function nameTerminal() {
    [ "${TERM:0:5}" = "xterm" ]   && local ansiNrTab=0
    [ "$TERM"       = "rxvt" ]    && local ansiNrTab=61
    [ "$TERM"       = "konsole" ] && local ansiNrTab=30 ansiNrWindow=0
        # Change tab title
    [ $ansiNrTab ] && echo -n $'\e'"]$ansiNrTab;$1"$'\a'
        # If terminal support separate window title, change window title as well
    [ $ansiNrWindow -a "$2" ] && echo -n $'\e'"]$ansiNrWindow;$2"$'\a'
} # nameTerminal()

# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping, 
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
cd_func ()
{
	local x2 the_new_dir adir index
	local -i cnt

	if [[ $1 ==  "--" ]]; then
		dirs -v
		return 0
	fi

	the_new_dir=$1
	[[ -z $1 ]] && the_new_dir=$HOME

	if [[ ${the_new_dir:0:1} == '-' ]]; then
		#
		# Extract dir N from dirs
		index=${the_new_dir:1}
		[[ -z $index ]] && index=1
		adir=$(dirs +$index)
		[[ -z $adir ]] && return 1
		the_new_dir=$adir
	fi

	#
	# '~' has to be substituted by ${HOME}
	[[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"

	#
	# Now change to the new dir and add to the top of the stack
	pushd "${the_new_dir}" > /dev/null
	[[ $? -ne 0 ]] && return 1
	the_new_dir=$(pwd)

	#
	# Trim down everything beyond 11th entry
	popd -n +11 2>/dev/null 1>/dev/null

	#
	# Remove any other occurence of this dir, skipping the top of the stack
	for ((cnt=1; cnt <= 10; cnt++)); do
		x2=$(dirs +${cnt} 2>/dev/null)
		[[ $? -ne 0 ]] && return 0
		[[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
		if [[ "${x2}" == "${the_new_dir}" ]]; then
			popd -n +$cnt 2>/dev/null 1>/dev/null
			cnt=cnt-1
		fi
	done

	return 0
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

scite() {
    if [[ -z "$1" ]];then
        echo "Usage: scite <filePath>"
    else
        fpath=`cygpath -aw "$1"`
        "$progfiles/SciTE/SciTE.exe" "$fpath"
    fi
}

#http://robertmarkbramprogrammer.blogspot.com/2010/09/using-cdargs-in-cygwin.html
# cd to a cdargs bookmark.
function mark() {
   if [ $# -ne 1 ] ; then
     echo Usage: mark cdargs-bookmark-name
     return 2
   fi
   if [[ $OSTYPE = "cygwin" ]]; then
       cdargs --add=:$1:` cygpath -u -a .`
   else
       cdargs --add=:$1:` pwd`
   fi
}
 
# Create a bookmarks in cdargs for the current directory.
function cdb() {
   if [ $# -ne 1 ] ; then
     echo Usage: cdb cdargs-bookmark-name
     return 2
   fi
   cdargs "$1" && cd "`cat "$HOME/.cdargsresult"`" ;
}

function gitenv-work() {
    export GIT_AUTHOR_EMAIL="tarun.ramakrishna.elankath@sap.com"
    export GIT_COMMITTER_EMAIL="tarun.ramakrishna.elankath@sap.com"
    export GIT_AUTHOR_NAME="Tarun Ramakrishna Elankath"
    export GIT_COMMITTER_NAME="Tarun Ramakrishna Elankath"
}

function gitenv-hub() {
    export GIT_AUTHOR_EMAIL="tarun@elankath.com"
    export GIT_COMMITTER_EMAIL="tarun@elankath.com"
    export GIT_AUTHOR_NAME="Tarun Ramakrishna Elankath"
    export GIT_COMMITTER_NAME="Tarun Ramakrishna Elankath"
}

function proxyset() {
    if [[ $LOGONSERVER == *BLR* ]]; then
        export http_proxy="http://proxy.blrl.sap.corp:8080"
        export https_proxy="http://proxy.blrl.sap.corp:8080"
    elif [[ $LOGONSERVER == *WDF* ]]; then
        export http_proxy="http://proxy.wdf.sap.corp:8080"
        export https_proxy="http://proxy.wdf.sap.corp:8080"
    fi
    if [[ ! -z $http_proxy ]]; then
        echo "Proxy set to $http_proxy"
    fi
}

function proxyclear() {
    unset http_proxy
    unset https_proxy
}

if [[ $USERDOMAIN == SAP_ALL ]]; then
    proxyset
fi
alias cd=cd_func

# Make bash append rather than overwrite the history on disk
shopt -s histappend
shopt -s extglob
export HISTCONTROL="erasedups:ignoreboth"
export HISTFILESIZE=500000
export HISTSIZE=100000
# multi-line commands to the history as one command.
#an interactive shell exits, the last $HISTSIZE lines are copied from the history list to the file named by $HISTFILE. If the histappend shell option is set (see section 4.2 Bash Builtin Commands), the lines are appended to the history file, otherwise the history file is overwritten. If HISTFILE is unset, or if the history file is unwritable, the history is not saved. After saving the history, the history file is truncated to contain no more than $HISTFILESIZE lines. If HISTFILESIZE is not set, no truncation is performed.
shopt -s cmdhist
shopt -s histappend



#Cause I don't have the CA certs on cygwin.
#TODO: find a way to make this possible
export GIT_SSL_NO_VERIFY=true

#Solarized color scheme
#if [[ -e ~/dotfiles/sol.light ]]; then
#    source ~/dotfiles/sol.light
#fi

#cdargs
if [[ -e /usr/share/cdargs/cdargs-bash-completion.sh ]]; then
    source /usr/share/cdargs/cdargs-lib.sh
    source /usr/share/cdargs/cdargs-alias.sh
    source /usr/share/cdargs/cdargs-bash-completion.sh
fi

# TODO:
# For some reason magic-space declaration in input rc isn't working
# so I need an explicit bind here
bind Space:magic-space

#CTRL-s no longer freezes terminal
stty stop ''


