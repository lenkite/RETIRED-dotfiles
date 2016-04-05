# Assumes that operating system is windows. Do not source otherwise
progfiles86="`/usr/bin/cygpath -au 'c:\Program Files (x86)'`"
progfiles="`/usr/bin/cygpath -au 'c:\Program Files'`"
myip=`ipconfig | grep -i 'IPv4 Address' | cut -d:  -f2`
myip=`echo $myip| tr -d '[[:space:]]'`
#Figure out whether I should set proxy or not.
#I don't think this works when I am connected remotely...
if [[ "$myip" != 192.168* ]]; then
    proxyset
fi
# Mounts
if [[ -d /cygdrive/c ]]; then
    mount c: /c 2> /dev/null
fi
if [[ -d /cygdrive/d ]]; then
    mount d: /d 2> /dev/null
fi
#mintty zenburn colors
echo "Setting zenburn theme"
source $dotfiles/ttycolors/zenburn.sh
export OS=$OSTYPE

function wstorm() {
   echo "Not implemented" 
}

function pw() {
 cygpath -aw $1 | tee | > /dev/clipboard
 cat /dev/clipboard
}

# System specific aliases
alias killall='taskkill /F /IM'
function sbl() {
 #assumes that sublime is already on path
 subl `cygpath -am $*`
}
alias open='cygstart $*'
