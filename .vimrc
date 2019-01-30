" Misc {{{
set nocompatible
syntax on
set encoding=utf-8
scriptencoding utf-8
filetype plugin indent on
" NO ANOYING BELL!!!
set noerrorbells
set vb t_vb=
set listchars=eol:$,tab:»\ ,trail:~,extends:>,precedes:<,nbsp:~
set pastetoggle=<C-p>
set mouse=a
set clipboard=unnamed
set backspace=indent,eol,start
let g:python_host_prog = '/home/simonhugh/.pyenv/versions/2.7.15/envs/apps2/bin/python'
let g:python3_host_prog = '/home/simonhugh/.pyenv/versions/3.7.1/envs/apps3/bin/python3'
set modelines=0
set nomodeline
" }}}
" Plugin Manager {{{
" Install Vim-Plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load Plugins
" let plugin_path='~/.vim/bundle'
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'juanedi/predawn.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'sjl/gundo.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()
" }}}
" Plugin Settings {{{
let g:vimwiki_list = [{'path': '~/.wiki/'}]
set rtp+=~/.fzf
if has('python3')
    let g:gundo_prefer_python3 = 1          " anything else breaks on Ubuntu 16.04+
endif
" set pyxversion=3
" }}}
" Colors {{{
set background=dark
set t_Co=256
"if (has("termguicolors"))
"  set termguicolors
"endif
syntax enable           " enable syntax processing
colorscheme gruvbox
" Make background transparent
hi Normal guibg=NONE ctermbg=NONE
" }}}
" Spaces & Tabs {{{
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4
set autoindent
set smartindent
set cindent
" }}}
" Folder Tree {{{
" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
function! OpenNetrw()
    Vexplorez\
    nmap <F3> :call CloseNetrw()<cr>
endfunction

function! CloseNetrw()
    :q
    nmap <F3> :call OpenNetrw()<cr>
endfunction
nmap <F3> :call OpenNetrw()<cr>

" }}}
" UI Layout {{{
set number  relativenumber      " show line numbers
set showcmd                     " show command in bottom bar
set cursorline                  " highlight current line
set wildmenu                    " show wildmenu on tab
set wildmode=list:longest,full  " 1st tab list shown, 2nd tab wildmenu show
set lazyredraw                  " Vim will only redraw when needed
set showmatch                   " higlight matching parenthesis
set ruler                       " show row and column in footer
set fillchars+=vert:┃
set splitbelow splitright       "Splits open at the bottom and right
" }}}
" Searching {{{
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
" }}}
" Folding {{{
"=== folding ===
set foldmethod=marker   " fold based on indent level
set foldnestmax=2      " max 10 depth
set foldenable          " don't fold files by default on open
set foldlevelstart=0   " start with fold level of 1
" }}}
" FZF {{{
" set rtp+=~/.fzf
" }}}
" Deoplete {{{
let g:deoplete#enable_at_startup = 1
" }}}za
" LightLine {{{
set laststatus=2
" }}}
" Language Specific {{{
augroup python
    autocmd!
    autocmd FileType python set tabstop=4
    autocmd FileType python set softtabstop=4
    autocmd FileType python set shiftwidth=4
    autocmd FileType python set textwidth=79
    autocmd FileType python set expandtab
    autocmd FileType python set autoindent
    autocmd FileType python set smartindent
    autocmd FileType python set fileformat=unix 
augroup END

augroup html
    autocmd!
    autocmd FileType html set tabstop=2
    autocmd FileType html set softtabstop=2
    autocmd FileType html set shiftwidth=2 
    autocmd FileType html inoremap &<space> &amp;<space>
	autocmd FileType html inoremap ? &aacute;
	autocmd FileType html inoremap ? &eacute;
	autocmd FileType html inoremap ? &iacute;
	autocmd FileType html inoremap ? &oacute;
	autocmd FileType html inoremap ? &uacute;
	autocmd FileType html inoremap ? &auml;
	autocmd FileType html inoremap ? &euml;
	autocmd FileType html inoremap ? &iuml;
	autocmd FileType html inoremap ? &ouml;
	autocmd FileType html inoremap ? &uuml;
	autocmd FileType html inoremap ? &atilde;
	autocmd FileType html inoremap ? &etilde;
	autocmd FileType html inoremap ? &itilde;
	autocmd FileType html inoremap ? &otilde;
	autocmd FileType html inoremap ? &utilde;
	autocmd FileType html inoremap ? &ntilde;
	autocmd FileType html inoremap ? &agrave;
	autocmd FileType html inoremap ? &egrave;
	autocmd FileType html inoremap ? &igrave;
	autocmd FileType html inoremap ? &ograve;
    autocmd FileType html inoremap ? &ugrave;
augroup END
" }}}
" ClipBoard {{{
function! RegToClip(reg)
    let value = getreg(a:reg, 1, 1)
    if executable('clip.exe')
        call system('clip.exe', value) 
    else
        let @* = value[0]
        let @+ = value[0]
    endif
endfunction
command! -nargs=1 RegToClip call RegToClip(<f-args>)
" }}}
" Line Shortcuts {{{
" Change panes
nnoremap <C-J> <C-W><C-J>  " Move down one pane in split sceen
nnoremap <C-K> <C-W><C-K>    " Move up one pane in split screen
nnoremap <C-H> <C-W><C-H>  " Move to the left pane in split screen
nnoremap <C-L> <C-W><C-L> " Move to the right pane in split screen
nnoremap j gj   " Move down one displayed line
nnoremap k gk   " Move up one displayed line
nnoremap <C-x> :Files<cr>   " Open FZF search
" FOLDING
nnoremap z\ za  " Toggle Folding
nnoremap z[ zR  " Open all Folds
nnoremap z] zM  " Close all folds
" }}}
" Leader Shortcuts {{{
let mapleader=" "
" re-source .vimrc
nnoremap <Leader>s :so $MYVIMRC<CR>
" Buffer Commands
nnoremap <Leader>b :Buffers<cr>
nnoremap <silent> <leader>n :bn<cr>
nnoremap <silent> <leader>p :bp<cr>
" spellcheck
nnoremap <leader>o :setlocal spell! spelllang=en_us<CR>
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" switch to dark mode
nnoremap <silent> <leader>bd :set background=dark<CR>
" switch to light mode
nnoremap <silent> <leader>bl :set background=light<CR>
" Register to Clipboard (requires gvim/nvim/vim-x11 installed): 
nnoremap <silent> <Leader>y :RegToClip "<CR>
nnoremap <Leader>Y :RegToClip<space>  
" Paste from Clipboard
nnoremap <silent><Leader>p "+p
nnoremap <silent><Leader>P "+P
" Search
nnoremap <silent> <Leader>h :noh<CR>
" Show empty chars
nnoremap <silent><Leader>a :set invlist<CR> 
" Show cursor line
nnoremap <silent><Leader>cl :set invcursorline<CR>
" Show cursor colum
nnoremap <silent><Leader>cc :set invcursorcolumn<CR>
" NERD tree toggle
nnoremap <silent><Leader>t :NERDTreeToggle<Enter>
" }}}
