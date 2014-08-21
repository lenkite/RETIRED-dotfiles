" Source SPF vimrc {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker:
"
"source ~\dotfiles\spf13.vimrc
"}


" Modeline and Notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker:
"   Tarun Ramakrishna Elankath's vimrc file. Been using VIM for 8 years now. 
"   Re-created from scratch on Aug 20, 2011
"   https://github.com/lenkite/dotfiles
" }


" Sets how many lines of history VIM has to remember
set history=1500
set wildignore=*.swp,*.bak,*.pyc,*.class
set incsearch
set hlsearch "Highlight search things
set visualbell           " don't beep
set noerrorbells         " don't beep


" Set 7 lines to the curors - when moving vertical..
set so=4
set smartcase
set nolazyredraw "Don't redraw while executing macros 
set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink


" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source "$dotfiles/vimrc"




"Buffer management tipcs from
"http://vim.wikia.com/wiki/Easier_buffer_switching
set hidden
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>
"map <Leader>b :b <C-Tab>
"only realized later that Ctrl-p offers plain buffer choosing
map <Leader>b :CtrlPBuffer<CR>
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P


" { Various editing options
set nobackup
set nowritebackup
set noswapfile
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set backspace=2
set backspace=indent,eol,start

"http://stackoverflow.com/questions/5419848/backspace-doesnt-work-in-gvim-7-2-64-bit-for-windows
"}
"z


"http://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim?answertab=votes#tab-top
set showmatch           " show matching bracket (briefly jump)
set showmode            " show mode in status bar (insert/replace/...)
set showcmd             " show typed command in status bar
set ruler               " show cursor position in status bar
"prefixes breaked lines via ellipes
"See http://vimcasts.org/episodes/soft-wrapping-text/
command! -nargs=* Wrap set wrap linebreak nolist
command! -nargs=* Nowrap set nowrap nolinebreak
"if !has("gui")
"    set showbreak=…
"endif


" From Best of VIM Tipcs at http://www.rayninfo.co.uk/vimtips.html


" Quick jumping between splits
set wmh=0
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" remap j and k to scroll by visual lines
nnoremap j gj
nnoremap k gk


"Show linenumbers flip-flop
:map <F12> :set number!<CR><Esc>       

" Edit a file in the same directory as the current buffer.
" This leaves the prompt open, allowing Tab expansion or manual completion.
if has("unix") || has("win32unix")
    map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
elseif has("win32")
    map <leader>e :e <C-R>=expand("%:p:h") . '\' <CR>
endif

if has("gui")
    :set guioptions-=T  "remove toolba
endif

" Enter directory listing for the directory of the current buffer
map <leader>. :e %:p:h<CR>

" Create a new window with directory listing of current buffer
map <leader>wn :new %:p:h<CR>

" Change global directory to the current directory of the current buffer
map <leader>cd :cd %:p:h<CR>


"From http://stackoverflow.com/questions/95072/what-are-your-favorite-vim-tricks?answertab=votes#tab-top
"http://stackoverflow.com/questions/95072/what-are-your-favorite-vim-tricks?answertab=votes#tab-top
"Will allow you to use :w!! to write to a file using sudo if you forgot to sudo vim file (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %


" UI related changes {
"}

"http://stackoverflow.com/questions/2154193/using-vim-as-a-html-editor
" copy the matchit plugin which is present from VIM6 onwards as part of the
" standard distribution
" The ! command does do any variable interpolation
" so you have to create a string with the command you want, and then pass it to :exe 
" and hte fuckly elseif is one word or you can the stupid E488 if you separate
" it
function! CopyMatchIt()
    if has("unix") || has("win32unix")
        let homePluginDir= "$dotfiles/vim/plugin/"
        if !filereadable(homePluginDir . "/matchit.vim")
            if !isdirectory(homePluginDir)
                exec ':silent !mkdir ' . homePluginDir
            endif
            exec ':silent !cp "' . $VIMRUNTIME . '/macros/matchit.vim" ' . homePluginDir
        endif
    elseif has("win32")
        let homePluginDir= $dotfiles\vim\plugin\'
        if !filereadable(homePluginDir . "/matchit.vim")
            if !isdirectory(homePluginDir)
                exec ':silent !mkdir ' . homePluginDir
            endif
            exec ':silent !copy "' . $VIMRUNTIME . '\macros\matchit.vim" ' . homePluginDir
        endif
    endif
endfunction
call CopyMatchIt()




" Copied from http://stackoverflow.com/questions/3316244/set-gvim-font-in-vimrc-file
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif


"netrw plugin config
let g:netrw_liststyle=3

"Make sure that your .bashrc as stty stop ''
"or your terminal will hang with C-s and you'll need to resume with C-q
map <C-s> :w<CR>
nmap <leader>w :w!<cr>
imap <C-s> <Esc>:w<CR>i


if $GOROOT != ""
    set rtp+=$GOROOT/misc/vim
endif

" {
" Some mappings
" C-S-B for make
map <f7> :make<CR>
nmap <F8> :TagbarToggle<CR>
"http://stackoverflow.com/questions/9054780/how-to-toggle-vims-search-highlight-visibility-without-disabling-it
" switch higlight no matter the previous state
nmap <Leader>h :set hls! <cr>
" hit '/' highlights then enter search mode
nnoremap / :set hlsearch<cr>/
"

" }
"Call Pathogen {
filetype off
call pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on
"}

" UI Related {
"http://vim.wikia.com/wiki/Great_wildmode/wildmenu_and_console_mouse
set wildmenu
set wildmode=list:longest,full
"colo zenburn
" visual searching
:vmap // y/<C-R>"<CR>     "search for visually highlighted text  
" Pull word under cursor into LHS of a substitute
:nmap <leader>z :%s#\<<c-r>=expand("<cword>")<cr>\>#
" Pull Visually Highlighted text into LHS of a substitute
:vmap <leader>z :<C-U>%s/\<<c-r>*\>/
" }


" Autocmd's for filetypes{
au FileType xml  setl iskeyword+=-,.
au FileType less setl iskeyword+=-,.
au FileType css setl iskeyword+=-,.
au FileType gitcommit set spell tw=72

"}

