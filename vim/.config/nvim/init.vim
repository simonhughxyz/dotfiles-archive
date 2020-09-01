" File Type {{{

function! Run(...)
    " use b:runcmd if set
    if exists("b:runcmd") | let l:cmd=b:runcmd | endif
    
    " use function argument as cmd if provided.
    if exists("a:1") | let l:cmd=a:1 | endif

    " run command.
    if exists("l:cmd")
        silent !clear
        exec 'silent :!' . l:cmd . ' &'
        exec 'redraw!'
    else
        echo "No runcmd provided, use b:runcmd to set run command!"
    endif
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

" open all mutt config files with filetype muttrc
autocmd BufReadPost *.muttrc set filetype=muttrc
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
" time in milliseconds for key sequence to complete
set timeoutlen=500
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
if has("spell")
    set spelllang=en_us
endif
set dictionary+=~/.vim/words/english
set dictionary+=~/.vim/words/new-german
set thesaurus+=~/.vim/words/th_english
set complete+=k
" }}}
" Plugin {{{
" Install Vim-Plug if not found
if has('nvim')
    if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
      silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
else
    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif

" Load Plugins
" let plugin_path='~/.vim/bundle'
call plug#begin()
Plug 'morhetz/gruvbox'  " Color scheme
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'   " Add, delete, change surroundings such as brackets.
Plug 'tpope/vim-repeat'     " Allows repeating '.' for many plugins.
Plug 'tpope/vim-commentary' " Easily un/comment text.
Plug 'tpope/vim-fugitive'   " Useful git commands.
Plug 'tpope/vim-unimpaired'     " Adds common bracket mappings.
Plug 'universal-ctags/ctags', { 'do': './autogen.sh;./configure --prefix=$HOME/.local;make install'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'  " Align text.
Plug 'junegunn/vim-peekaboo'    " Show register contents in sidebar.
Plug 'unblevable/quick-scope'   " Highlights unique letters to help with 'f'.
Plug 'ludovicchabant/vim-gutentags' " Manage tag files.
Plug 'majutsushi/tagbar'    " Shows list of tags in a sidebar.
Plug 'AndrewRadev/splitjoin.vim'    " Split single lines or join multiple lines.
Plug 'airblade/vim-gitgutter'   " Show git diff in sign column.
Plug 'Yggdroot/indentLine'  " Show a line marking indents.
Plug 'luochen1990/rainbow' " Color matching brackets.
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': 'markdown' }
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'
" Plug 'honza/vim-snippets'
Plug 'AndrewRadev/switch.vim'   " Switch true to false, yes to no etc.
Plug 'junegunn/goyo.vim'    " Distraction free writing.
Plug 'junegunn/limelight.vim'   " Highlight the current column.
Plug 'mcchrish/nnn.vim' " Use nnn file browser.
Plug 'vimwiki/vimwiki'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'} " LSP support.
Plug 'liuchengxu/vim-which-key'

" Text Object Plugins
Plug 'wellle/targets.vim'   " Expands on vim text objects and adds a few new ones.
Plug 'michaeljsmith/vim-indent-object'  " Adds indent text object.
Plug 'chaoren/vim-wordmotion'   " Vim recognizes camel case and more as words.
Plug 'junegunn/vim-after-object'    " Text object to target text after char.
" Plug 'kana/vim-textobj-user'
Plug 'coderifous/textobj-word-column.vim'   " Add column text object.

" Filetype Specific plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
Plug 'baskerville/vim-sxhkdrc', { 'for': 'sxhkdrc' }
Plug 'fourjay/vim-password-store', { 'for': 'pass' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
Plug 'tridactyl/vim-tridactyl', { 'for': 'trydactyl' }
Plug 'neomutt/neomutt.vim', { 'for': 'muttrc' }

" Neovim Plugins
if has('nvim')
    Plug 'norcalli/nvim-colorizer.lua'
endif
call plug#end()
" }}}
" Plugin Settings {{{
let g:vimwiki_list = [{'path': '~/notes/', 'path_html': '~/notes/html/'}]
set rtp+=~/.fzf
if has('python3')
    let g:gundo_prefer_python3 = 1          " anything else breaks on Ubuntu 16.04+
endif

" FZF

if v:version >= 801 || has('nvim-0.4.0')
    let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }
endif

hi! fzf_fg ctermfg=14
hi! fzf_fgp ctermfg=3
hi! fzf_hl ctermfg=5
hi! fzf_hlp ctermfg=9
hi! fzf_info ctermfg=6
hi! fzf_prompt ctermfg=9
hi! fzf_spinner ctermfg=6
hi! fzf_pointer ctermfg=3

let g:fzf_colors = {
    \ 'fg':      ['fg', 'fzf_fg'],
    \ 'hl':      ['fg', 'fzf_hl'],
    \ 'fg+':     ['fg', 'fzf_fgp'],
    \ 'hl+':     ['fg', 'fzf_hlp'],
    \ 'info':    ['fg', 'fzf_info'],
    \ 'prompt':  ['fg', 'fzf_prompt'],
    \ 'pointer': ['fg', 'fzf_pointer'],
    \ 'spinner': ['fg', 'fzf_spinner'] }

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
autocmd VimEnter * call after_object#enable('=', ':', ';', '-', '+', '#', '_', '$')

" vim-table-mode
let g:table_mode_corner='|'

" indent line
let g:indentLine_setConceal = 0

" quickscope
augroup qs_colors
    autocmd!
    autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
    autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

" git-gutter
highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#dddd00 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 ctermfg=Red

" LimeLight
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.8

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 0
" }}}
" Colors {{{
set background=dark
set t_Co=256
if (has("termguicolors"))
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum
    set termguicolors

    " nvim-colorizer only works with termguicolors and neovim
    if has('nvim')
        lua require 'colorizer'.setup(nil, { css = true; })
    endif
endif
syntax enable           " enable syntax processing
colorscheme gruvbox
" Make background transparent
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
" set custom syntax colors
hi Comment ctermbg=235 ctermfg=250 guibg=#262626 guifg=#bcbcbc
" set color of 80 char width column
highlight ColorColumn ctermbg=0 guibg=#303030
" change color of cursor line
highlight CursorLine ctermbg=0 guibg=#000000
highlight CursorLineNr ctermbg=0 ctermfg=2 guibg=#000000 guifg=#008000

" Vim Diff colors
highlight DiffAdd ctermbg=2 ctermfg=0 guibg=#000000 guifg=#00c000
highlight DiffChange ctermbg=2 ctermfg=0 guibg=#000000 guifg=#c0c000
highlight DiffDelete ctermbg=2 ctermfg=0 guibg=#000000 guifg=#c00000
highlight DiffText ctermbg=2 ctermfg=0 guibg=#ffffff guifg=#3000a0

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
            \ 't'  : 'Terminal',
            \}
    return get(currentmode, mode(), 'Normal')
endfunctio

" define statusline and line number color for the vim modes
let g:colors = {
    \ 'black':  '#000000',
    \ 'white':  '#eeeeee',
    \ 'normal': '#008000',
    \ 'visual': '#808000',
    \ 'insert': '#00a0a0',
    \ 'else':   '#800000',
\}

" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
  if (mode() =~# '\v(n|no)')
    exe 'hi User1 ctermbg=2 ctermfg=0  guibg=' . g:colors.normal . ' guifg=' . g:colors.black
    exe 'hi statusline ctermbg=2'
    exe 'hi CursorLineNr ctermbg=0 ctermfg=2 guibg=' . g:colors.black . ' guifg=' . g:colors.normal
    exe 'hi CursorLine ctermbg=0 guibg=' . g:colors.black
    exe 'hi User8 ctermbg=234 ctermfg=248  guibg=' . g:colors.normal . ' guifg=' . g:colors.black
    exe 'hi User9 ctermbg=236 ctermfg=248 guibg=' . g:colors.normal . ' guifg=' . g:colors.black
  elseif (mode() =~# '\v(v|V|)')
    exe 'hi User1 ctermbg=3 ctermfg=0  guibg=' . g:colors.visual . ' guifg=' . g:colors.black
    exe 'hi statusline ctermbg=3'
    exe 'hi CursorLineNr ctermbg=0 ctermfg=3 guifg=' . g:colors.visual
    exe 'hi User8 ctermbg=234 ctermfg=248  guibg=' . g:colors.visual . ' guifg=' . g:colors.black
    exe 'hi User9 ctermbg=236 ctermfg=248 guibg=' . g:colors.visual . ' guifg=' . g:colors.black
  elseif (mode() ==# 'i')
    exe 'hi User1 ctermbg=6 ctermfg=0  guibg=' . g:colors.insert . ' guifg=' . g:colors.black
    exe 'hi statusline ctermbg=6'
    exe 'hi CursorLineNr ctermbg=0 ctermfg=6 guibg=' . g:colors.black . ' guifg=' . g:colors.insert
    exe 'hi CursorLine ctermbg=16 guibg=' . g:colors.black
    exe 'hi User8 ctermbg=234 ctermfg=248  guibg=' . g:colors.insert . ' guifg=' . g:colors.black
    exe 'hi User9 ctermbg=236 ctermfg=248 guibg=' . g:colors.insert . ' guifg=' . g:colors.black
  else
    exe 'hi User1 ctermbg=1 ctermfg=255  guibg=' . g:colors.else . ' guifg=' . g:colors.white
    exe 'hi statusline ctermbg=1'
    exe 'hi CursorLineNr ctermfg=1 guifg=' . g:colors.else
    exe 'hi User8 ctermbg=234 ctermfg=248  guibg=' . g:colors.else . ' guifg=' . g:colors.white
    exe 'hi User9 ctermbg=236 ctermfg=248 guibg=' . g:colors.else . ' guifg=' . g:colors.white
  endif

  return ''
endfunction

" Fix for delay in color change
" so far only works with insert mode.
if version >= 700
    au InsertEnter * call ChangeStatuslineColor()
    au InsertLeave * call ChangeStatuslineColor()
    au CmdlineEnter * redrawstatus
    au CmdlineLeave * redrawstatus
    au CmdwinEnter * call ChangeStatuslineColor()
    au CmdwinLeave * call ChangeStatuslineColor()
    if has('nvim')
        au TermEnter * call ChangeStatuslineColor()
        au TermLeave * call ChangeStatuslineColor()
    endif
endif

" main statusline color
" background and foreground are swapped out of some reason.
exe 'hi statusline ctermfg=232 ctermbg=2 guibg=' . g:colors.white . ' guifg=#101010'

"define 3 custom highlight groups
exe 'hi User1 ctermbg=2 ctermfg=0  guibg=' . g:colors.normal . ' guifg=' . g:colors.black
exe 'hi User2 ctermbg=5 ctermfg=0  guibg=' . g:colors.normal . ' guifg=' . g:colors.black
exe 'hi User3 ctermbg=4 ctermfg=0  guibg=' . g:colors.normal . ' guifg=' . g:colors.black
exe 'hi User8 ctermbg=234 ctermfg=248  guibg=' . g:colors.normal . ' guifg=' . g:colors.black
exe 'hi User9 ctermbg=236 ctermfg=248 guibg=' . g:colors.normal . ' guifg=' . g:colors.black

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
" Function Keys
" <F1> is paste toggle
nnoremap <F4> :make<CR>
nnoremap <F9> :TagbarOpenAutoClose<CR>
nnoremap <F10> :TagbarToggle<CR>
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
" Better tabbing
vnoremap < <gv
vnoremap > >gv
" FZF completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <C-O>:call fzf#vim#complete#path("eval $FZF_DEFAULT_COMMAND")<return>
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
" next and previous hunk
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
" }}}
" Leader Shortcuts {{{
let mapleader=" "
let maplocalleader=","
" re-source .vimrc
nnoremap <leader>R :so $MYVIMRC<CR>
" Which Key
nnoremap <silent><leader> :WhichKey '<space>'<CR>
nnoremap <silent><localleader> :WhichKey ','<CR>
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
nnoremap <leader>gg :GitGutterLineHighlightsToggle<CR>
nnoremap <leader>gs :GitGutterStageHunk<CR>
nnoremap <leader>gu :GitGutterUndoHunk<CR>
" Rainbow toggle
nnoremap <leader>r :RainbowToggle<CR>
" Easy Align
vmap <leader># :EasyAlign # {'filter': 'v/^#/'}<CR>
" Swap characters
" }}}
