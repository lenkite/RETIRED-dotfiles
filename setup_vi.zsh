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
git clone --depth=1 https://github.com/Rip-Rip/clang_complete.git  -b master vim/bundle/clang_complete
git clone --depth=1 https://github.com/scrooloose/nerdcommenter.git  -b master vim/bundle/nerdcommenter
git clone --depth=1 https://github.com/majutsushi/tagbar  -b master vim/bundle/tagbar
git clone --depth=1 https://github.com/vim-scripts/ZoomWin.git -b master vim/bundle/zoomwin
git clone --depth=1 https://github.com/vim-scripts/CRefVim.git -b master vim/bundle/crefvim
git clone --depth=1 https://github.com/xolox/vim-session.git  -b master vim/bundle/vim-session.git 
git clone --depth=1 https://github.com/Lokaltog/vim-easymotion.git -b master vim/bundle/vim-easymotion

git clone --depth=1 https://github.com/vim-scripts/cscope.vim.git -b master vim/bundle/cscope
git clone --depth=1 https://github.com/tpope/vim-surround.git -b master vim/bundle/vim-surround
git clone --depth=1 https://github.com/flazz/vim-colorschemes.git -b master vim/bundle/colorschemes
git clone --depth=1 https://github.com/altercation/vim-colors-solarized.git -b master vim/bundle/vim-colors-solarized
git clone --depth=1 https://github.com/tpope/vim-repeat.git -b master vim/bundle/vim-repeat
git clone --depth=1 https://github.com/garbas/vim-snipmate.git -b master vim/bundle/vim-snipmate
git clone --depth=1 https://github.com/tomtom/tlib_vim.git -b master vim/bundle/tlib_vim
git clone --depth=1 https://github.com/MarcWeber/vim-addon-mw-utils.git -b master vim/bundle/vim-addon-mw-utils
git clone --depth=1 https://github.com/kien/ctrlp.vim.git -b master vim/bundle/ctrlp.vim
git clone --depth=1 https://github.com/mattn/zencoding-vim.git -b master vim/bundle/zencoding-vim
rm -rf mintty/mintty-colors-solarized
git clone --depth=1 https://github.com/skammer/vim-css-color.git vim/bundle/vim-css-color
git clone --depth=1 https://github.com/hail2u/vim-css3-syntax.git vim/bundle/vim-css3-syntax
git clone --depth=1 https://github.com/groenewege/vim-less.git vim/bundle/vim-less

#tiled window management for VIM
# this guy overwrites C-N and my switch window bindings. saying tata to him
#git clone --depth=1 https://github.com/spolu/dwm.vim -b master vim/bundle/dwm

# Snipmate-snippets was formed from honza..add him as upstream
git clone --depth=1 https://github.com/lenkite/snipmate-snippets.git -b master vim/bundle/snipmate-snippets 
cd vim/bundle/snipmate-snippets
git remote add upstream https://github.com/honza/snipmate-snippets.git
git fetch upstream
git merge upstream/master
cd ../../../


#git submodule foreach git submodule init
#git submodule foreach git submodule update
source setup_gocode.zsh
