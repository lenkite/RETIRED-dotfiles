#!/bin/zsh

if [[ ! -d autoload ]]; then
    mkdir vim/{autoload,bundle}
fi
rm vim/autoload/pathogen.vim
cd vim/autoload
wget --no-check-certificate https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
cd ../../
rm -rf vim/bundle
mkdir -p vim/bundle
#git submodule add https://github.com/sukima/xmledit.git vim/bundle/xmledit
#git submodule add https://github.com/tpope/vim-ragtag.git vim/bundle/vim-ragtag 
git clone https://github.com/tpope/vim-surround.git -b master vim/bundle/vim-surround
git clone https://github.com/flazz/vim-colorschemes.git -b master vim/bundle/colorschemes
git clone https://github.com/altercation/vim-colors-solarized.git -b master vim/bundle/vim-colors-solarized
git clone https://github.com/tpope/vim-repeat.git -b master vim/bundle/vim-repeat
git clone https://github.com/garbas/vim-snipmate.git -b master vim/bundle/vim-snipmate
git clone https://github.com/tomtom/tlib_vim.git -b master vim/bundle/tlib_vim
git clone https://github.com/MarcWeber/vim-addon-mw-utils.git -b master vim/bundle/vim-addon-mw-utils
git clone https://github.com/lenkite/snipmate-snippets.git -b master vim/bundle/snipmate-snippets 
git clone https://github.com/kien/ctrlp.vim.git -b master vim/bundle/ctrlp.vim
rm -rf mintty/mintty-colors-solarized
git clone https://github.com/skammer/vim-css-color.git vim/bundle/vim-css-color
git clone https://github.com/hail2u/vim-css3-syntax.git vim/bundle/vim-css3-syntax
git clone https://github.com/groenewege/vim-less.git vim/bundle/vim-less

#git submodule foreach git submodule init
#git submodule foreach git submodule update
