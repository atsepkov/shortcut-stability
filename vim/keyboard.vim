" keyboard-consistency project
" Author: Alexander Tsepkov <atsepkov@gmail.com>
" Copyright 2015, GPL3

" consistency shortcuts for vim, source this file in your .vimrc
" NOTE: for now this assumes you use NeoBundle, if you have an agnostic way to
" install the necessary repos, feel free to do a pull request


" Shift + Left/Right for word-shifting
" These allow me to shift the word (object of interest) left/right in current
" context in normal mode
Bundle 'AndrewRadev/sideways.vim'
nnoremap <S-Left> :SidewaysLeft<cr>
nnoremap <S-Right> :SidewaysRight<cr>

" Ctrl+Left/Right for word hopping
" These allow me to jump to previous/next word of interest via ctrl +
" left/right
" NOTE: this conflicts with default behavior of other editors, of using alt +
" left/right for this purpose, so you will need to remap those to stay
" consistent
nmap Oc W
nmap Od B
imap Oc <C-o>W
imap Od <C-o>B

" Ctrl + C/V to copy/paste
" this will emulate GUI-like Ctrl+C/V when clipboard is setup
nmap <C-c> "*y
nmap <C-v> "*p
vmap <C-c> "*y
vmap <C-v> "*p




" NOTE: in insert mode Ctrl+V inserts verbatim character, because of that I
" often accidently generate ^V sequence when attempting to paste in insert
" mode, that needs to be fixed. I remapped it to Alt+V for now, let's see
" how that works. This also relies on urxvt unicode mapping for Alt+V
imap <C-v> <C-o>"*p
inoremap ξ <C-v>
