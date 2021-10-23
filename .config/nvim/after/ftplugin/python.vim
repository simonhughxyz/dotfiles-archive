setlocal makeprg=python\ %
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal textwidth=79
setlocal autoindent
setlocal smartindent
setlocal fileformat=unix 
setlocal foldmethod=indent
setlocal foldnestmax=1
inoremap \\ \
inoremap # #<space>
inoremap \# #
inoremap = <space>=<space>
inoremap == <space>==<space>
inoremap != <space>!=<space>
inoremap < <space><<space>
inoremap > <space>><space>
inoremap <= <space><=<space>
inoremap >= <space>>=<space>
inoremap + <space>+<space>
inoremap \+ +
inoremap - <space>-<space>
inoremap \- -
inoremap / <space>/<space>
inoremap \/ /
inoremap * <space>*<space>
inoremap \* *
inoremap ** <space>**<space>
inoremap % <space>%<space>
inoremap \% %
inoremap \cc """<Esc>o"""<Esc>O
inoremap \im <Esc>Ifrom<space><Esc>A<space>import<space>
inoremap \f <Esc>Idef<space><Esc>A():<Esc>F)i
inoremap \ci def<space>__init__(self):<Esc>F)i
inoremap \cf <Esc>Idef<space><Esc>A(self):<Esc>F)i
inoremap \s self
inoremap \p print():<Esc>F(a
inoremap \i if ():<Esc>F(a
inoremap \e else:<Esc>o
inoremap \ef elif ():<Esc>F(a
inoremap \in <space>is not<space>
inoremap \ni <space>not in<space>
