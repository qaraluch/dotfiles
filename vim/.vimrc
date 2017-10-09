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


"""""""""""""""""""""""""""""""""""""""""""""""" SETTINGS """""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" tabs
filetype plugin indent on
set tabstop=4                                    "" show existing tab with 4 spaces width
set shiftwidth=4                                 "" when indenting with '>', use 4 spaces width
set expandtab                                    "" On pressing tab, insert 4 spaces

"""" line numbers
set relativenumber
set number


set ff=unix
set directory^=$HOME/.vim/temp//                 "" swap files dir
