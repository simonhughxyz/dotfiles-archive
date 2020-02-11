setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal foldmethod=marker
setlocal foldnestmax=2
call after_object#enable('=', '+', '-', ':')
inoremap # "<space>
inoremap \\ \
inoremap \# #
inoremap \f <ESC>Ifunction!<space><ESC>A()<ESC>oendfu!<ESC>O
inoremap \i <Esc>Iif (<ESC>A)<ESC>oendif<ESC>O
vmap <leader># :EasyAlign*"<cr>
