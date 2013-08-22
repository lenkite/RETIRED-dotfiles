#Misc utility functions

exitIfNotCygwin() {
    if [[ ! `uname` == *CYGWIN* ]]; then
     echo "not cygwin.returning";
     exit 1
    fi
}

determineToolsDir() {
    local toolsdir=/d/sdk/tools
    if [[ ! -d $toolsdir ]]; then
        drive=/cygdrive/c
    fi
    echo $toolsdir
}
