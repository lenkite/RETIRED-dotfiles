# Aliases go into this file

# Default to human readable figures
alias df='df -h'
alias du='du -h'
# -v	Causes dirs to print the directory stack with one entry per 
#	line, prefixing each entry with its index in the stack.
alias dirs='dirs -v'
alias dv='dirs -v'
alias pd='pushd'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias ls='ls -F --color=auto'
# list dirs only
alias ldir='ls -d */'
alias grep='grep --color'                     # show differences in colour

alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #
alias ll='ls -al'
alias llt='ls -F -alt'
alias pw='cygpath -aw'
# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
# alias egrep='egrep --color=auto'              # show differences in colour
# alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
# alias ls='ls -hF --color=tty'                 # classify files in colour
# alias ll='ls -l'                              # long list

#windows specific stuff

#if [[ $OS = Windows* ]]; then

#fi

alias sshl1="ssh root@10.66.189.121"
alias mvne="mvn eclipse:eclipse -DdownloadSources=true -DdownloadJavadocs=true"
alias m3='C:\sdk\apache\maven\3.0.3'
