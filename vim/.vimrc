"""""""""""""""""""""""""""""""""""""""""""""""" MAPPINGS """""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" disable arrows
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     ddkP
noremap   <Down>   ddp
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

"""" empty lines with no insert mode
noremap oo o<Esc>k
noremap OO O<Esc>j

"""""""""""""""""""""""""""""""""""""""""""""""" SETTINGS """""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" tabs
filetype plugin indent on
set tabstop=2                                    "" show existing tab with 2 spaces width
set shiftwidth=2                                 "" when indenting with '>', use 2 spaces width
set expandtab                                    "" On pressing tab, insert 2 spaces

"""" line numbers
set relativenumber
set number


set ff=unix
syntax on                                        "" syntax highlights
set directory^=$HOME/.vim/temp//                 "" swap files dir


"""""""""""""""""""""""""""""""""""""""""""""""" PLUGS """""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'plasticboy/vim-markdown'
call plug#end()
