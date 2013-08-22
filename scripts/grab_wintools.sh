#!/bin/bash

scriptdir=`dirname $0`
source $scriptdir/commons/utils.sh
drive=/cygdrive/d

exitIfNotCygwin

toolsdir=$(determineToolsDir)
echo Tools dir: $toolsdir
targetdir=$toolsdir/sysinternals
mkdir -p $targetdir
pushd .
cd /tmp
if [[ ! -f SysinternalsSuite.zip ]]; then
    rm SysinternalsSuite.zip
fi
wget http://download.sysinternals.com/files/SysinternalsSuite.zip
popd
unzip /tmp/SysinternalsSuite.zip -d $targetdir
chmod -R 755 $targetdir
