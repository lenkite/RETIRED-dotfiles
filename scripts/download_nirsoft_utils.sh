#!/bin/bash

function trim {
    local var=$@
    var="${var#"${var%%[![:space:]]*}"}"   # remove leading whitespace characters
    var="${var%"${var##*[![:space:]]}"}"   # remove trailing whitespace characters
    echo -n "$var"
}

if [[ ! -d nirsoft_utils ]]; then
    mkdir nirsoft_utils
fi
cd nirsoft_utils
#scriptdir=$(dirname $0:h)
#nirsoft_urls=$scriptdir/nirsoft_urls.txt
#wget -N -i $nirsoft_urls
extractdir=$PWD/nirsoft
if [[ -d $extractdir ]]; then
    rm -rf $extractdir
fi
if [[ -f nirsoft.zip ]]; then
    rm nirsoft.zip
fi
for i in *.zip; do
    [ -e "$i" ] || continue
    exename=$(unzip -l "$i"| grep '[[:alpha:]]\.exe' | awk '{print $4}') 
    exename=$(trim $exename)
    exename=${exename%.exe}
    exename=${exename%.EXE}
    unzip "$i" -d $extractdir
    if [[ -f $extractdir/readme.txt ]]; then
        readme="$extractdir/readme.txt"
        exereadme="$extractdir/$exename.txt"
        echo "Renaming $readme to $exereadme"
        mv $readme $exereadme
    fi
done
zipdir=$(basename $extractdir)
chmod 755 $extractdir/*.exe
zip -r nirsoft.zip $zipdir





