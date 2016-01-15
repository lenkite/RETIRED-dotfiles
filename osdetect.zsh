# Sets variables iswindows, isosx, islinux

if [[  $OS = darwin* ]]; then
    isosx=true
elif [[ $OS = *linux* ]]; then
    islinux=true
elif [[ $OS = *Windows* ]]; then
    iswin=true
fi
