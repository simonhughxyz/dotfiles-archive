" File Type {{{

function! Run(...)
    let l:cmd=g:runcmd
    if a:1 != ''
        let l:cmd=a:1
    endif
    exec 'silent :!' . l:cmd . ' &'
    exec 'redraw!'
endfu!
command Run call Run()

" runs file type detect if filetype is empty
function! SetFileType()
    if &filetype != 'filetype='
        filetype detect
    endif
endfu!
" get filetype on write
autocmd BufWritePost * call SetFileType()

autocmd BufWritePost statusbar call system("reloadbar")

augroup vim
    autocmd FileType vim set tabstop=4
    autocmd FileType vim set softtabstop=4
    autocmd FileType vim set shiftwidth=4
    autocmd FileType vim set expandtab
    autocmd FileType vim set foldmethod=marker
    autocmd FileType vim set foldnestmax=2
    autocmd FileType vim call after_object#enable('=', '+', '-', ':')
    autocmd FileType vim inoremap # "<space>
    autocmd FileType vim inoremap \\ \
    autocmd FileType vim inoremap \# #
    autocmd FileType vim inoremap \f <ESC>Ifunction!<space><ESC>A()<ESC>oendfu!<ESC>O
    autocmd FileType vim inoremap \i <Esc>Iif (<ESC>A)<ESC>oendif<ESC>O
    autocmd FileType vim vmap <leader># :EasyAlign*"<cr>
augroup END

augroup sh
    autocmd FileType sh let g:runcmd='sh %'
    autocmd FileType sh set makeprg=sh\ %
    autocmd FileType sh set tabstop=4
    autocmd FileType sh set softtabstop=4
    autocmd FileType sh set shiftwidth=4
    autocmd FileType sh set expandtab
    " autocmd FileType sh set foldmethod=indent
    " autocmd FileType sh set foldnestmax=1
    autocmd FileType sh let g:sh_fold_enabled=5
    autocmd FileType sh let g:is_sh=1
    autocmd FileType sh set foldmethod=syntax
    autocmd FileType sh inoremap # #<space>
augroup END

augroup gitcommit
     autocmd FileType gitcommit setlocal spell
     autocmd FileType gitcommit setlocal textwidth=79
augroup END

augroup markdown
    autocmd FileType markdown set makeprg=$BROWSER\ %
    autocmd FileType markdown set tabstop=4
    autocmd FileType markdown set softtabstop=4
    autocmd FileType markdown set shiftwidth=4
    autocmd FileType markdown set expandtab
    autocmd FileType markdown set textwidth=79
    autocmd FileType markdown setlocal spell
    autocmd FileType markdown set conceallevel=2
    autocmd FileType markdown set concealcursor=c
    autocmd FileType markdown vmap<leader><Bslash> :EasyAlign*<Bar><cr>
    autocmd FileType markdown inoremap ``` <Esc>I```<Esc>o```<Esc>O
    autocmd FileType markdown inoremap \1 <Esc>I#<space><Esc>o
    autocmd FileType markdown inoremap \2 <Esc>I##<space><Esc>o
    autocmd FileType markdown inoremap \3 <Esc>I###<space><Esc>o
    autocmd FileType markdown inoremap \4 <Esc>I####<space><Esc>o
    autocmd FileType markdown inoremap \5 <Esc>I#####<space><Esc>o
    autocmd FileType markdown inoremap \6 <Esc>I######<space><Esc>o
    autocmd FileType markdown inoremap \<Bar> <Bar><Esc>I<Bar><Esc>V:s/ *<bar> */ <bar> /g<cr>0x$xyyp0lvt<bar>r-
augroup END 

augroup make
    autocmd FileType make set noexpandtab
    autocmd FileType make set tabstop=4
    autocmd FileType make set shiftwidth=4
    autocmd FileType make set softtabstop=0
    autocmd FileType make set noexpandtab
    autocmd FileType make set foldmethod=indent
    autocmd FileType make set foldnestmax=1
augroup END

augroup python
    autocmd!
    autocmd FileType python let g:runcmd='python %'
    autocmd FileType python set makeprg=python\ %
    autocmd FileType python set tabstop=4
    autocmd FileType python set softtabstop=4
    autocmd FileType python set shiftwidth=4
    autocmd FileType python set expandtab
    autocmd FileType python set textwidth=79
    autocmd FileType python set autoindent
    autocmd FileType python set smartindent
    autocmd FileType python set fileformat=unix 
    autocmd FileType python set foldmethod=indent
    autocmd FileType python set foldnestmax=1
    autocmd FileType python inoremap \\ \
    autocmd FileType python inoremap # #<space>
    autocmd FileType python inoremap \# #
    autocmd FileType python inoremap = <space>=<space>
    autocmd FileType python inoremap == <space>==<space>
    autocmd FileType python inoremap != <space>!=<space>
    autocmd FileType python inoremap < <space><<space>
    autocmd FileType python inoremap > <space>><space>
    autocmd FileType python inoremap <= <space><=<space>
    autocmd FileType python inoremap >= <space>>=<space>
    autocmd FileType python inoremap + <space>+<space>
    autocmd FileType python inoremap \+ +
    autocmd FileType python inoremap - <space>-<space>
    autocmd FileType python inoremap \- -
    autocmd FileType python inoremap / <space>/<space>
    autocmd FileType python inoremap \/ /
    autocmd FileType python inoremap * <space>*<space>
    autocmd FileType python inoremap \* *
    autocmd FileType python inoremap ** <space>**<space>
    autocmd FileType python inoremap % <space>%<space>
    autocmd FileType python inoremap \% %
    autocmd FileType python inoremap \cc """<Esc>o"""<Esc>O
    autocmd FileType python inoremap \im <Esc>Ifrom<space><Esc>A<space>import<space>
    autocmd FileType python inoremap \f <Esc>Idef<space><Esc>A():<Esc>F)i
    autocmd FileType python inoremap \ci def<space>__init__(self):<Esc>F)i
    autocmd FileType python inoremap \cf <Esc>Idef<space><Esc>A(self):<Esc>F)i
    autocmd FileType python inoremap \s self
    autocmd FileType python inoremap \p print():<Esc>F(a
    autocmd FileType python inoremap \i if ():<Esc>F(a
    autocmd FileType python inoremap \e else:<Esc>o
    autocmd FileType python inoremap \ef elif ():<Esc>F(a
    autocmd FileType python inoremap \in <space>is not<space>
    autocmd FileType python inoremap \ni <space>not in<space>
augroup END

augroup html
    autocmd!
    autocmd FileType html let g:runcmd='$BROWSER %'
    autocmd FileType html set makeprg=$BROWSER\ %
    autocmd FileType html,xhtml,xml set tabstop=2
    autocmd FileType html,xhtml,xml set softtabstop=2
    autocmd FileType html,xhtml,xml set shiftwidth=2 
    autocmd FileType html,xhtml,xml set expandtab
    autocmd FileType html,xhtml,xml set foldmethod=indent
    autocmd FileType html,xhtml,xml set foldnestmax=5
    autocmd FileType xhtml,html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType html inoremap ,, ,
    autocmd FileType html inoremap >< ><ESC>yF<o<Esc>pa<space><Esc>F<"hyt<space>ddo<Esc>"hpa><Esc>F<a/<Esc>O
    autocmd FileType html inoremap ,cc <!--//--><Esc>0f/i<space><space><left>
    autocmd FileType html inoremap ,cm <!--<Enter>//--><Esc>O
    autocmd FileType html inoremap ,dd <div><Enter></div><Esc>O
    autocmd FileType html inoremap ,dc <ESC>F"i<div class=<ESC>f";a><Enter></div><Esc>O
    autocmd FileType html inoremap ,b <b></b><Esc>0f>a
    autocmd FileType html inoremap ,b <b></b><Esc>0f>a
	autocmd FileType html inoremap ,em <em></em><Esc>0f>a
	autocmd FileType html inoremap ,1 <h1></h1><Esc>F>a
	autocmd FileType html inoremap ,2 <h2></h2><Esc>F>a
	autocmd FileType html inoremap ,3 <h3></h3><Esc>F>a
	autocmd FileType html inoremap ,4 <h4></h4><Esc>F>a
	autocmd FileType html inoremap ,5 <h5></h5><Esc>F>a
	autocmd FileType html inoremap ,p <p></p><Esc>F>a
	autocmd FileType html inoremap ,a <ESC>F"i<a<Space>href=<ESC>f";a></a><Esc>F>a
	autocmd FileType html inoremap ,td <td></td><Esc>F>a
	autocmd FileType html inoremap ,tr <tr></tr><Esc>F>a
	autocmd FileType html inoremap ,th <th></th><Esc>F>a
	autocmd FileType html inoremap ,tb <table><Enter></table><Esc>O
	autocmd FileType html inoremap ,sc <script type="text/javascript"><Enter></script><Esc>O

    autocmd FileType html inoremap &<space> &amp;<space>
    autocmd FileType html inoremap && &
    autocmd FileType html inoremap ,< &lt;<space>
    autocmd FileType html inoremap ,> &gt;<space>
    autocmd FileType html inoremap ,>= &le;<space>
    autocmd FileType html inoremap ,>= &ge;<space>
    autocmd FileType html inoremap ," &quot;<space>
    autocmd FileType html inoremap ,' &apos;<space>
    autocmd FileType html inoremap ,cp &copy;<space>
    autocmd FileType html inoremap ,tm &trade;<space>
    autocmd FileType html inoremap ,pnd &pound;<space>

	autocmd FileType html inoremap á &aacute;
	autocmd FileType html inoremap é &eacute;
	autocmd FileType html inoremap í &iacute;
	autocmd FileType html inoremap ó &oacute;
	autocmd FileType html inoremap ú &uacute;
	autocmd FileType html inoremap ä &auml;
	autocmd FileType html inoremap ë &euml;
	autocmd FileType html inoremap ï &iuml;
	autocmd FileType html inoremap ö &ouml;
	autocmd FileType html inoremap ü &uuml;
	autocmd FileType html inoremap ã &atilde;
	autocmd FileType html inoremap ẽ &etilde;
	autocmd FileType html inoremap ĩ &itilde;
	autocmd FileType html inoremap õ &otilde;
	autocmd FileType html inoremap ũ &utilde;
	autocmd FileType html inoremap ñ &ntilde;
	autocmd FileType html inoremap à &agrave;
	autocmd FileType html inoremap è &egrave;
	autocmd FileType html inoremap ì &igrave;
	autocmd FileType html inoremap ò &ograve;
    autocmd FileType html inoremap ù &ugrave;
augroup END

augroup css
    autocmd!
    autocmd FileType css set makeprg=$BROWSER\ %
    autocmd FileType css set tabstop=2
    autocmd FileType css set softtabstop=2
    autocmd FileType css set shiftwidth=2
    autocmd FileType css set expandtab
    autocmd FileType css set textwidth=79
    autocmd FileType css set expandtab
    autocmd FileType css set autoindent
    autocmd FileType css set smartindent
    autocmd FileType css set fileformat=unix 
    autocmd FileType css set foldmethod=marker
    autocmd FileType css set foldmarker={,}
    autocmd FileType css set foldnestmax=1
    autocmd FileType css inoremap { <space>{<ESC>o}<ESC>O
    autocmd FileType css inoremap \b <ESC>^ibackground:<space><ESC>A;
    autocmd FileType css inoremap \bc <ESC>^ibackground-color:<space><ESC>A;
augroup END

augroup json
    autocmd FileType json setlocal tabstop=2
    autocmd FileType json setlocal softtabstop=2
    autocmd FileType json setlocal shiftwidth=2
    autocmd FileType json setlocal expandtab
    autocmd FileType json setlocal foldmethod=marker
    autocmd FileType json setlocal foldmarker={,}
    autocmd FileType json setlocal foldnestmax=5
    autocmd FileType json setlocal foldlevel=1
augroup END

augroup nroff
    autocmd!
    autocmd FileType nroff set makeprg=tbl\ %\ \\\|\ groff\ -ms\ -Tpdf\ >\ %:r.pdf
    autocmd FileType nroff set tabstop=2
    autocmd FileType nroff set softtabstop=2
    autocmd FileType nroff set expandtab
    autocmd FileType nroff set autoindent
    autocmd FileType nroff set nosmartindent
    autocmd FileType nroff set nocindent
    autocmd FileType nroff filetype indent off
    autocmd FileType nroff set fileformat=unix 
    autocmd FileType nroff set foldmethod=marker
    autocmd FileType nroff set foldnestmax=1
    autocmd FileType nroff let g:runcmd='zathura %:r.pdf'
    autocmd FileType nroff inoremap # \"<space>
    autocmd FileType nroff inoremap \# #
    autocmd FileType nroff inoremap \b <ESC>I\"<space><ESC>A<space>{{{<ESC>o\"<space>}}}<ESC>O
augroup END

augroup xdefaults
    autocmd BufRead,BufNewFile .Xresources set makeprg=xrdb\ -merge\ %
augroup END
" }}}
"Misc {{{
set nocompatible
filetype plugin indent on
" syntax on
set encoding=utf-8
scriptencoding utf-8
set omnifunc=syntaxcomplete#Complete
set history=500
" NO ANOYING BELL!!!
set noerrorbells
set vb t_vb=
set listchars=eol:$,tab:»\ ,trail:~,extends:>,precedes:<,nbsp:~
set pastetoggle=<F1>
set mouse=a
set clipboard=unnamed
set backspace=indent,eol,start
let g:python_host_prog = '/home/simonhugh/.pyenv/versions/2.7.15/envs/apps2/bin/python'
let g:python3_host_prog = '/home/simonhugh/.pyenv/versions/3.7.1/envs/apps3/bin/python3'
set modelines=1
set modeline
" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null
set updatetime=100
set noshowmode
set undofile
set undodir=~/.vim/undodir
" conceal
set conceallevel=2
" don't conceal on line when in visual, insert or normal mode.
set concealcursor=c
" }}}
" Folding {{{
"=== folding ===
set foldenable          " don't fold files by default on open
set foldmethod=indent   " fold based on indent level
set foldnestmax=1      " max 1 depth
set foldlevelstart=0   " start with fold level of 1
" set fold colors
highlight Folded ctermbg=0 ctermfg=7 guibg=#202020 guifg=Silver
" }}}
" Dictionary and Spelling {{{
set spelllang=en_gb
set dictionary+=~/.vim/words/english
set dictionary+=~/.vim/words/new-german
set thesaurus+=~/.vim/words/th_english
set complete+=k
" }}}
" Plugin {{{
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
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/vim-after-object'
Plug 'kana/vim-textobj-user'
Plug 'wellle/targets.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
" Plug 'tmhedberg/SimpylFold'
Plug 'plasticboy/vim-markdown'
Plug 'Yggdroot/indentLine'
Plug 'baskerville/vim-sxhkdrc'
Plug 'fourjay/vim-password-store'
Plug 'frazrepo/vim-rainbow'
Plug 'coderifous/textobj-word-column.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'dhruvasagar/vim-table-mode'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'chaoren/vim-wordmotion'
Plug 'AndrewRadev/switch.vim'
call plug#end()
" }}}
" Plugin Settings {{{
let g:vimwiki_list = [{'path': '~/.wiki/'}]
set rtp+=~/.fzf
if has('python3')
    let g:gundo_prefer_python3 = 1          " anything else breaks on Ubuntu 16.04+
endif

"Grovebox
let g:gruvbox_italic=1

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Vim-markdown
let g:vim_markdown_folding_style_pythonic = 1

" Vim rainbow
let g:rainbow_active = 1

" vim-after-object
autocmd VimEnter * call after_object#enable('=', ':', ';', '-', '+', '#', ' ', '.', ',', '_', '$')

" vim-table-mode
let g:table_mode_corner='|'

" indent line
let g:indentLine_setConceal = 0
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
hi Normal ctermbg=NONE
" set custom syntax colors
hi Comment ctermbg=235 ctermfg=250 guibg=#262626 guifg=#bcbcbc
" set color of 80 char width column
highlight ColorColumn ctermbg=0 guibg=#303030
" change color of cursor line
highlight CursorLine ctermbg=0 guibg=#303030
highlight CursorLineNr ctermbg=0 ctermfg=2 guibg=#303030
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
" UI Layout {{{
set number  relativenumber      " show line numbers
set showcmd                     " show command in bottom bar
set wildmenu                    " show wildmenu on tab
" set wildmode=list:longest,full  " 1st tab list shown, 2nd tab wildmenu show
set wildmode=longest:full,full
set lazyredraw                  " Vim will only redraw when needed
set showmatch                   " higlight matching parenthesis
set ruler                       " show row and column in footer
set fillchars+=vert:┃
set splitbelow splitright       " Splits open at the bottom and right
" set textwidth=80                " Wrap text at 80th column
set cursorline                  " highlight current line
set colorcolumn=80              " show line at 80th character column
" }}}
" Searching {{{
set ignorecase          " ignore case when searching
set smartcase           " dont ignore uppercase
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
" Visual Select Search
vnoremap / y/\V<C-r>=escape(@",'/\')<CR><CR>
" }}}
" Status Line {{{
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?' '.l:branchname.' |':''
endfunction

function! StatusLinePaste()
    let l:paste = &paste
    if (&paste == 1)
        return ' Paste '
    else
        return ''
    endif
endfunction

" Get current vim mode
function! GetMode()
let l:currentmode={
            \ 'n'  : 'Normal',
            \ 'no' : 'N·Operator Pending',
            \ 'v'  : 'Visual',
            \ 'V'  : 'V·Line',
            \ '' : 'V·Block',
            \ 's'  : 'Select',
            \ 'S'  : 'S·Line',
            \ '' : 'S·Block',
            \ 'i'  : 'Insert',
            \ 'R'  : 'Replace',
            \ 'Rv' : 'V·Replace',
            \ 'c'  : 'Command',
            \ 'cv' : 'Vim Ex',
            \ 'ce' : 'Ex',
            \ 'r'  : 'Prompt',
            \ 'rm' : 'More',
            \ 'r?' : 'Confirm',
            \ '!'  : 'Shell',
            \}
    return currentmode[mode()]
endfunctio

" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
  if (mode() =~# '\v(n|no)')
    exe 'hi User1 ctermbg=2 ctermfg=0  guibg=#008000 guifg=#000000'
    exe 'hi statusline ctermbg=2'
    exe 'hi CursorLineNr ctermbg=0 ctermfg=2 guifg=#008000'
    exe 'hi CursorLine ctermbg=0 guibg=#008000'
  elseif (mode() =~# '\v(v|V|)')
    exe 'hi User1 ctermbg=3 ctermfg=0  guibg=#808000 guifg=#000000'
    exe 'hi statusline ctermbg=3'
    exe 'hi CursorLineNr ctermfg=3 guifg=#808000'
  elseif (mode() ==# 'i')
    exe 'hi User1 ctermbg=6 ctermfg=0  guibg=#008080 guifg=#000000'
    exe 'hi statusline ctermbg=6'
    exe 'hi CursorLineNr ctermbg=16 ctermfg=6 guifg=#008080'
    exe 'hi CursorLine ctermbg=16 guibg=#008000'
  else
    exe 'hi User1 ctermbg=1 ctermfg=255  guibg=#800000 guifg=#eeeeee'
    exe 'hi statusline ctermbg=1'
    exe 'hi CursorLineNr ctermfg=1 guifg=#800000'
  endif

  return ''
endfunction

hi statusline ctermfg=232 ctermbg=2

"define 3 custom highlight groups
hi User1 ctermbg=2 ctermfg=0  guibg=#008000 guifg=#000000
hi User2 ctermbg=5 ctermfg=0  guibg=#008000 guifg=#000000
hi User3 ctermbg=4 ctermfg=0  guibg=#008000 guifg=#000000
hi User8 ctermbg=234 ctermfg=248  guibg=#008000 guifg=#000000
hi User9 ctermbg=236 ctermfg=248 guibg=#008000 guifg=#000000

set laststatus=2
set statusline=

" LEFT SIDE
" Used for color change
set statusline+=%{ChangeStatuslineColor()}
set statusline+=%1*
" show vim mode
set statusline+=\ %{GetMode()}
set statusline+=\ %*
" show paste toggle
set statusline+=%2*
set statusline+=%{StatusLinePaste()}
set statusline+=%*
" show file name
set statusline+=\ %.40f
" truncate line from here
set statusline+=%<
" show if file is modified
set statusline+=\ %m
" show if file is read only
set statusline+=\ %r

" RIGHT SIDE
set statusline+=%=
" show git brannch
set statusline+=%{StatuslineGit()}
" show file type
set statusline+=\ %Y
set statusline+=\ \|
" show buffer number
set statusline+=\ %n
set statusline+=\ \|
" show character code user cursor
set statusline+=\ 0x%B
" gray section
set statusline+=\ %8*
" show file percentage
set statusline+=\ %p%%
set statusline+=\ %*
set statusline+=%9*
" show column:line / total lines
set statusline+=\ %v:%l
set statusline+=\ \/\ %L
set statusline+=\ %*
" }}}
" NetRw {{{
let g:netrw_liststyle = 3
let g:netrw_banner = 0
" }}}
" FZF {{{
" set rtp+=~/.fzf
" }}}
" Deoplete {{{
let g:deoplete#enable_at_startup = 1
" }}}za
" Input mode Shortcuts {{{
inoremap \\ \z
" }}}
" Templates {{{

function! Template(name)
    exe "silent! 0r ~/.vim/templates/" . a:name . ".temp"
    exe "silent! normal! Gdd"
    exe "silent! %s/<<<AUTHOR>>>/Simon Hugh Moore/g"
    exe "silent! %s/<<<UAUTHOR>>>/SIMON HUGH MOORE/g"

    exe "silent! %s/<<<EMAIL>>>/simonhughdev@gmail.com/g"
    exe "silent! %s/<<<UEMAIL>>>/SIMONHUGHDEV@GMAIL.COM/g"

    exe "silent! %s/<<<NAME>>>/" . expand('%:r') . "/g"
    exe "silent! %s/<<<UNAME>>>/" . toupper(expand('%:r')) . "/g"

    exe "silent! %s/<<<FNAME>>>/" . expand('%:t') . "/g"
    exe "silent! %s/<<<UFNAME>>>/" . toupper(expand('%:t')) . "/g"

    exe "silent! %s/<<<PATH>>>/" . escape(expand('%:p'), '/\') . "/g"

    exe "silent! %s/<<<DIR>>>/" . expand('%:p:h:t') . "/g"
    exe "silent! %s/<<<UDIR>>>/" . toupper(expand('%:p:h:t')) . "/g"
    exe "silent! %s/<<<FDIR>>>/" . escape(expand('%:p:h'), '/\') . "/g"

    exe "silent! %s/<<<EXT>>>/" . expand('%:e') . "/g"
    exe "silent! %s/<<<UEXT>>>/" . toupper(expand('%:e')) . "/g"

    exe "silent! normal! gg/<<<CURSOR>>>\<CR>vf>;;x"
    call SetFileType()
endfu!

command -nargs=1 -complete=file Temp call Template(<f-args>)

" augroup templates
"     au!
"     autocmd BufNewFile *.* silent! 0r ~/.vim/templates/%:e.temp
" augroup END

" }}}
" functions {{{
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

function! WordProcessorMode()
 setlocal textwidth=80
 setlocal smartindent
 setlocal spell spelllang=en_us
 setlocal noexpandtab
endfu
command! WP call WordProcessorMode()

" Dead Keys

let g:DeadKeysOn=0

function! ToggleDeadKeys()
	if !g:DeadKeysOn
		call DeadKeys()
	else
		call DeadKeysOff()
	endif
endfunction

function! DeadKeys()
	echo "Dead Keys: On"
	let g:DeadKeysOn=1
    
    imap `1 :call DKUmlaut()<cr> 
    imap `2 :call DKGrave()<cr>
    call DKUmlaut()
endfunction

function! DKUmlaut()
	" umlaut
	imap a ä
	imap e ë
	imap i ï
	imap o ö
	imap u ü
	imap A Ä
	imap E Ë
	imap I Ï
	imap O Ö
	imap U Ü
endfunction

function! DKGrave()
	" grave accents
	imap `a à
	imap `e è
	imap `i ì
	imap `o ò
	imap `u ù
	imap `A À
	imap `E È
	imap `I Ì
	imap `O Ò
	imap `U Ù
	imap `<space> `
endfunction

function! DKMacrons()
	" macrons
	imap :a ā
	imap :e ē
	imap :i ī
	imap :o ō
	imap :u ū
	imap :A Ā
	imap :E Ē
	imap :I Ī
	imap :O Ō
	imap :U Ū

	" acute accents
	imap 'a á
	imap 'A Á
	imap 'C Ć
	imap 'c ć
	imap 'e é
	imap 'E É
	imap 'i í
	imap 'I Í
	imap 'N Ń
	imap 'n ń
	imap 'o ó
	imap 'R Ŕ
	imap 'r ŕ
	imap 'S Ś
	imap 's ś
	imap 'O Ó
	imap 'u ú
	imap 'U Ú
	imap '<space> '

	" under dot
	imap .D Ḍ
	imap .d ḍ
	imap .H Ḥ
	imap .h ḥ
	imap .L Ḹ
	imap .l ḹ
	imap .M Ṃ
	imap .m ṃ
	imap .N Ṇ
	imap .n ṇ
	imap .R Ṛ
	imap .r ṛ
	imap .G Ṝ
	imap .g ṝ
	imap .S Ṣ
	imap .s ṣ
	imap .T Ṭ
	imap .t ṭ

	" tilde
	imap ~a ã
	imap ~A Ã
	imap ~e ẽ
	imap ~E Ẽ
	imap ~i ĩ
	imap ~I Ĩ
	imap ~o õ
	imap ~O Õ
	imap ~u ũ
	imap ~U Ũ
	imap ~n ñ
	imap ~N Ñ

	" caron
	imap >A Ǎ
	imap >a ǎ
	imap >C Č
	imap >c č
	imap >E Ě
	imap >e ě
	imap >G Ǧ
	imap >g ǧ
	imap >I Ǐ
	imap >i ǐ
	imap >O Ǒ
	imap >o ǒ
	imap >R Ř
	imap >r ř
	imap >S Ṧ
	imap >s ṧ
	imap >U Ǔ
	imap >u ǔ
	imap >V Ǚ
	imap >v ǚ
	imap >Z Ž
	imap >z ž

endfunction "deadkeys()


function! DeadKeysOff()
	echo "Dead Keys: Off"
	let g:DeadKeysOn=0

	" unmapping umlauts
	imap a a
	imap b b
	imap c c
	imap d d
	imap e e
	imap f f
	imap g g
	imap h h
	imap i i
	imap j j
	imap k k
	imap l l
	imap m m
	imap n n
	imap o o
	imap p p
	imap q q
	imap r r
	imap s s
	imap t t
	imap u u
	imap v v
	imap w w
	imap x x
	imap y y
	imap z z

	imap A A
	imap B B
	imap C C
	imap D D
	imap E E
	imap F F
	imap G G
	imap H H
	imap I I
	imap J J
	imap K K
	imap L L
	imap M M
	imap N N
	imap O O
	imap P P
	imap Q Q
	imap R R
	imap S S
	imap T T
	imap U U
	imap V V
	imap W W
	imap X X
	imap Y Y
	imap Z Z

endfunction

" }}}
" Line Shortcuts {{{
" Replace all
nnoremap \ :%s//g<Left><Left>
" Replace all in visual range
vnoremap \ :s//g<Left><Left>
" Search visually selected text
vnoremap // "vy/\V<C-r>=escape(@v,'/\')<CR><CR>
" Replace visually selected text
vnoremap /s "vy:%s/<C-r>=escape(@v,'/\')<CR>//g<left><left>
" Change panes
nnoremap <C-J> <C-W><C-J>  " Move down one pane in split sceen
nnoremap <C-K> <C-W><C-K>    " Move up one pane in split screen
nnoremap <C-H> <C-W><C-H>  " Move to the left pane in split screen
nnoremap <C-L> <C-W><C-L> " Move to the right pane in split screen
" Change panes with arrow keys
nnoremap <C-Down> <C-W><C-J>  " Move down one pane in split sceen
nnoremap <C-Up> <C-W><C-K>    " Move up one pane in split screen
nnoremap <C-Left> <C-W><C-H>  " Move to the left pane in split screen
nnoremap <C-Right> <C-W><C-L> " Move to the right pane in split screen
" Move along display lines.
" nnoremap j gj
" nnoremap k gk
" vnoremap j gj
" vnoremap k gk
" nnoremap <Down> gj
" nnoremap <Up> gk
" vnoremap <Down> gj
" vnoremap <Up> gk
" inoremap <Down> <C-o>gj
" inoremap <Up> <C-o>gk

nnoremap <C-O> :Files<cr>   " Open FZF search
nnoremap <C-B> :Buffers<cr>   " Open FZF search
" FOLDING
nnoremap z\ za  " Toggle Folding
nnoremap z[ zR  " Open all Folds
nnoremap z] zM  " Close all folds
" FZF completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
" next and previous hunk
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
" }}}
" Leader Shortcuts {{{
let mapleader=" "
" re-source .vimrc
nnoremap <leader>r :so $MYVIMRC<CR>
" Buffer Commands
nnoremap <silent><leader>b :Buffers<cr>
nnoremap <silent><leader>f :Files<cr>
nnoremap <silent><leader>n :bn<cr>
nnoremap <silent><leader>p :bp<cr>
" spellcheck
nnoremap <silent><leader>s :setlocal spell!<CR>
nnoremap <leader>lb :set spelllang=en_gb<CR>
nnoremap <leader>la :set spelllang=en_us<CR>
nnoremap <leader>ld :set spelllang=de<CR>
" Register to Clipboard (requires gvim/nvim/vim-x11 installed)
nnoremap <silent><leader>y :RegToClip "<CR>
nnoremap <silent><leader>Y :RegToClip<space>
nnoremap <silent><leader>yy ^yg_
" Paste from Clipboard
nnoremap <silent><Leader>p "+p
nnoremap <silent><Leader>P "+P
" Toggle highlight
nnoremap <silent><Leader>h :noh<CR>
" Show empty chars
nnoremap <silent><Leader>w :set invlist<CR>
" Show cursor line
nnoremap <silent><Leader>cl :set invcursorline<CR>
" Show cursor colum
nnoremap <silent><Leader>cc :set invcursorcolumn<CR>
" Toggle Conceal
nnoremap <silent><Leader>ct :let &cole=(&cole == 2) ? 0 : 2 <bar> echo 'conceallevel ' . &cole <CR>
" Toggle deadkeys
nnoremap <leader>d <esc>:call ToggleDeadKeys()<CR>
" Toggle GitGutter Highlights
nnoremap <leader>g :GitGutterLineHighlightsToggle<CR>
" Easy Align
vmap <leader># :EasyAlign # {'filter': 'v/^#/'}<CR>
" Swap characters
" }}}
