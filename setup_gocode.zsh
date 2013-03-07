#!/bin/zsh

function get_vim_gocode() {
    local plugin_dir=~/dotfiles/vim/bundle/gocode
    if [[ -d  $plugin_dir ]]; then
        rm -rf $plugin_dir
    fi
    if [[ -f $TMP/gocode.zip ]]; then
        rm $TMP/gocode.zip
    fi
    if [[ -d $TMP/gocode-master ]]; then
        rm -rf $TMP/gocode-master
    fi
    wget --no-check-certificate  https://github.com/nsf/gocode/archive/master.zip -O $TMP/gocode.zip
    unzip $TMP/gocode.zip  -p 'gocode-master/vim/*' -d $TMP
    if [[ ! -d $plugin_dir ]]; then
        mkdir $plugin_dir
    fi
    mv $TMP/gocode-master/vim/* $plugin_dir
    if [[ ! -z "$GOROOT" ]]; then
        echo "Installing gocode..."
        go get -u github.com/nsf/gocode
        echo "gocode installed."
    else
        echo "Please install go and set GOROOT"
    fi

}

