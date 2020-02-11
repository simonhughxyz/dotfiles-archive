filetype indent off
setlocal makeprg=tbl\ %\ \\\|\ groff\ -ms\ -Tpdf\ >\ %:r.pdf
setlocal tabstop=2
setlocal softtabstop=2
setlocal expandtab
setlocal autoindent
setlocal nosmartindent
setlocal nocindent
setlocal fileformat=unix 
setlocal foldmethod=marker
setlocal foldnestmax=1
let g:runcmd='zathura %:r.pdf'
inoremap # \"<space>
inoremap \# #
inoremap \b <ESC>I\"<space><ESC>A<space>{{{<ESC>o\"<space>}}}<ESC>O
