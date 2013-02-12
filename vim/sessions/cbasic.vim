" ~\vimfiles\sessions\cbasic.vim: Vim session script.
" Created by session.vim 1.5 on 29 January 2013 at 15:37:25.
" Open this file in Vim and run :source % to restore your session.

set guioptions=egmrLt
silent! set guifont=Consolas:h11:cANSI
if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'dark'
	set background=dark
endif
if !exists('g:colors_name') || g:colors_name != 'zenburn' | colorscheme zenburn | endif
call setqflist([{'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '\Users\i034796\dotfiles\vimrc', 'text': 'dmc -wx cbasic.c stdafx.h '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '\Users\i034796\dotfiles\vimrc', 'text': 'cbasic.c:'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '\Users\i034796\dotfiles\vimrc', 'text': 'stdafx.h:'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '\Users\i034796\dotfiles\vimrc', 'text': 'link cbasic+stdafx,,,user32+kernel32/noi;'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '\Users\i034796\dotfiles\vimrc', 'text': ''}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '\Users\i034796\dotfiles\vimrc', 'text': ''}])
let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd C:\dev\learn\c\basic
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +40 cbasic.c
badd +18 \Users\i034796\dotfiles\setup_vi.zsh
badd +648 \Program\ Files\ (x86)\Vim\vim73\doc\index.txt
badd +1 \Users\i034796\dotfiles
silent! argdel *
set lines=58 columns=113
edit cbasic.c
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 45 + 29) / 58)
exe 'vert 1resize ' . ((&columns * 72 + 56) / 113)
exe '2resize ' . ((&lines * 10 + 29) / 58)
exe 'vert 2resize ' . ((&columns * 72 + 56) / 113)
exe 'vert 3resize ' . ((&columns * 40 + 56) / 113)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 81 - ((38 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
81
normal! 0
wincmd w
argglobal
enew
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
wincmd w
argglobal
enew
file __Tagbar__
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
wincmd w
exe '1resize ' . ((&lines * 45 + 29) / 58)
exe 'vert 1resize ' . ((&columns * 72 + 56) / 113)
exe '2resize ' . ((&lines * 10 + 29) / 58)
exe 'vert 2resize ' . ((&columns * 72 + 56) / 113)
exe 'vert 3resize ' . ((&columns * 40 + 56) / 113)
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
tabnext 1
2wincmd w
let s:bufnr = bufnr("%")
cwindow
execute "bwipeout" s:bufnr
1resize 45|vert 1resize 72|2resize 10|vert 2resize 72|3resize 56|vert 3resize 40|
tabnext 1
1wincmd w

" vim: ft=vim ro nowrap smc=128
