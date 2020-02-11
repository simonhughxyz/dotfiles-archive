set makeprg=tbl\ %\ \\\|\ groff\ -ms\ -Tpdf\ >\ %:r.pdf
set tabstop=2
set softtabstop=2
set expandtab
set autoindent
set nosmartindent
set nocindent
filetype indent off
set fileformat=unix 
set foldmethod=marker
set foldnestmax=1
let g:runcmd='zathura %:r.pdf'
inoremap # \"<space>
inoremap \# #
inoremap \b <ESC>I\"<space><ESC>A<space>{{{<ESC>o\"<space>}}}<ESC>O
