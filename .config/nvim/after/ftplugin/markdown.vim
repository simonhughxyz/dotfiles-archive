setlocal makeprg=$BROWSER\ %
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal textwidth=79
setlocal spell
setlocal conceallevel=2
setlocal concealcursor=c
vmap<leader><Bslash> :EasyAlign*<Bar><cr>
inoremap ``` <Esc>I```<Esc>o```<Esc>O
inoremap \1 <Esc>I#<space><Esc>o
inoremap \2 <Esc>I##<space><Esc>o
inoremap \3 <Esc>I###<space><Esc>o
inoremap \4 <Esc>I####<space><Esc>o
inoremap \5 <Esc>I#####<space><Esc>o
inoremap \6 <Esc>I######<space><Esc>o
inoremap \<Bar> <Bar><Esc>I<Bar><Esc>V:s/ *<bar> */ <bar> /g<cr>0x$xyyp0lvt<bar>r-

" Toggle tic box
fu! Tictoggle()
    let line = getline('.')
    if(match(line, '\[ \]') != -1)
        execute '.s/\[ \]/\[x\]/'
    else
        execute '.s/\[x\]/\[ \]/'
    endif
endf
command! TicToggle call Tictoggle()
nnoremap gt :call Tictoggle()<cr>
