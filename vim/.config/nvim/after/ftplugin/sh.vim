setlocal makeprg=shellcheck\ -f\ gcc\ %
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
" setlocal foldmethod=indent
" setlocal foldnestmax=1
let g:sh_fold_enabled=5
let g:is_sh=1
setlocal foldmethod=syntax
inoremap # #<space>

" Automatically open quickfix window if errors found
au QuickFixCmdPost [^l]* nested cwindow
au QuickFixCmdPost    l* nested lwindow

" Auto run make on write
au BufWritePost * :silent make | redraw!
