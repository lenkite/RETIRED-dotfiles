# Sets variables iswindows, isosx, islinux

if [[  $OS = darwin* ]]; then
    iswin=true
elif [[ $OS = *linux* ]]; then
    islinux=true
elif [[ $OS = *Windows* ]]; then
    iswindows=true
fi
