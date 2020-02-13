setlocal makeprg=$BROWSER\ %
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal textwidth=79
setlocal autoindent
setlocal smartindent
setlocal fileformat=unix 
setlocal foldmethod=marker
setlocal foldmarker={,}
setlocal foldnestmax=1
inoremap { <space>{<ESC>o}<ESC>O
inoremap \b <ESC>^ibackground:<space><ESC>A;
inoremap \bc <ESC>^ibackground-color:<space><ESC>A;
