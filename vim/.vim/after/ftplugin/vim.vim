set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set foldmethod=marker
set foldnestmax=2
call after_object#enable('=', '+', '-', ':')
inoremap # "<space>
inoremap \\ \
inoremap \# #
inoremap \f <ESC>Ifunction!<space><ESC>A()<ESC>oendfu!<ESC>O
inoremap \i <Esc>Iif (<ESC>A)<ESC>oendif<ESC>O
vmap <leader># :EasyAlign*"<cr>
