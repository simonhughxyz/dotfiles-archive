" gvim specific settings
" gvim will source .vimrc first before sourcing .gvimrc

" set font
set guifont=Monospace\ 20

" set background color
hi normal guibg=#090909

" remove toolbar
set guioptions -=T

" remove menu bar
set guioptions -=m 

" remove scroll bar
set guioptions-=r

function! ToggleGUICruft()
  if &guioptions=='i'
    exec('set guioptions=imTrL')
  else
    exec('set guioptions=i')
  endif
endfunction

map <F11> <Esc>:call ToggleGUICruft()<cr>

" remove toolbar, menubar, scrollbar
set guioptions=i


set guiheadroom=0
set guioptions-=e
