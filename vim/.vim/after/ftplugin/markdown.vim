set makeprg=$BROWSER\ %
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set textwidth=79
setlocal spell
set conceallevel=2
set concealcursor=c
vmap<leader><Bslash> :EasyAlign*<Bar><cr>
inoremap ``` <Esc>I```<Esc>o```<Esc>O
inoremap \1 <Esc>I#<space><Esc>o
inoremap \2 <Esc>I##<space><Esc>o
inoremap \3 <Esc>I###<space><Esc>o
inoremap \4 <Esc>I####<space><Esc>o
inoremap \5 <Esc>I#####<space><Esc>o
inoremap \6 <Esc>I######<space><Esc>o
inoremap \<Bar> <Bar><Esc>I<Bar><Esc>V:s/ *<bar> */ <bar> /g<cr>0x$xyyp0lvt<bar>r-
