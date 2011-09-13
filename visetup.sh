#!/bin/bash


if [[ ! -d autoload ]]; then
    mkdir vim/{autoload,bundle}
fi
rm vim/autoload/pathogen.vim
cd vim/autoload
wget --no-check-certificate https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
cd ../../
#git submodule add https://github.com/sukima/xmledit.git vim/bundle/xmledit
git submodule add https://github.com/tpope/vim-ragtag.git vim/bundle/vim-ragtag 
git submodule add https://github.com/tpope/vim-surround.git vim/bundle/vim-surround
git submodule add https://github.com/flazz/vim-colorschemes.git vim/bundle/colorschemes
git submodule add https://github.com/altercation/vim-colors-solarized.git vim/bundle/vim-colors-solarized
git submodule add https://github.com/tpope/vim-repeat.git vim/bundle/vim-repeat
git submodule add https://github.com/garbas/vim-snipmate.git vim/bundle/vim-snipmate
git submodule add https://github.com/tomtom/tlib_vim.git vim/bundle/tlib_vim
git submodule add https://github.com/MarcWeber/vim-addon-mw-utils.git vim/bundle/vim-addon-mw-utils
git submodule add https://github.com/honza/snipmate-snippets.git vim/bundle/snipmate-snippets
git submodule add git://git.wincent.com/command-t.git vim/bundle/command-t

git submodule add https://github.com/sjbach/lusty.git vim/bundle/lusty

git submodule init
git submodule update
git submodule foreach git submodule init
git submodule foreach git submodule update
