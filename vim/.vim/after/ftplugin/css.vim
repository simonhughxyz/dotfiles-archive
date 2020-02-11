set makeprg=$BROWSER\ %
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set textwidth=79
set autoindent
set smartindent
set fileformat=unix 
set foldmethod=marker
set foldmarker={,}
set foldnestmax=1
inoremap { <space>{<ESC>o}<ESC>O
inoremap \b <ESC>^ibackground:<space><ESC>A;
inoremap \bc <ESC>^ibackground-color:<space><ESC>A;
