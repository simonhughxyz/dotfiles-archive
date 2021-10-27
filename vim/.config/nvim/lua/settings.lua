local o = vim.opt
local env = vim.env

-- global options
o.encoding = 'utf-8'
o.history = 500
o.errorbells = false
o.visualbell = false
o.listchars = "eol:$,tab:» ,trail:~,extends:>,precedes:<,nbsp:~"
o.pastetoggle = '<F1>'
o.mouse = 'a'
o.clipboard = 'unnamedplus'
o.backspace = 'indent,eol,start'
o.updatetime = 100
o.showmode = false
o.undofile =  true
o.undodir = env.XDG_DATA_HOME .. '/nvim/undo'
o.timeoutlen = 500
o.scrolloff = 5



o.swapfile = true
o.dir = '/tmp'
o.smartcase = true
o.laststatus = 2
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.scrolloff = 12
-- ... snip ... 

-- window-local options
o.number = false
o.wrap = false
o.conceallevel = 2
o.concealcursor = 'c'

-- buffer-local options
o.expandtab = true
o.omnifunc = 'syntaxcomplete#Complete'
o.modelines = 0
o.modeline = false

-- folding
o.foldenable = true          -- don't fold files by default on open
o.foldmethod = 'indent'   -- fold based on indent level
o.foldnestmax = 1      -- max 1 depth
o.foldlevelstart = 0   -- start with fold level of 1

-- dictionary

o.spelllang = 'en_us'
o.dictionary:append '~/.vim/words/english'
o.dictionary:append '~/.vim/words/new-german'
o.thesaurus:append '~/.vim/words/th_english'
o.complete:append 'k'

-- colors
o.background = 'dark'
o.termguicolors = true

-- spaces and tabs
o.tabstop = 4
o.expandtab = true
o.softtabstop = 4
o.shiftwidth = 4
o.autoindent = true
o.smartindent = true
o.cindent = true

-- UI Layout
o.number = true
o.relativenumber = true
o.showcmd = true                     -- show command in bottom bar
o.wildmenu = true                    -- show wildmenu on tab
-- o.wildmode=list:longest,full  -- 1st tab list shown, 2nd tab wildmenu show
o.wildmode = 'longest:full,full'
o.lazyredraw = true                  -- Vim will only redraw when needed
o.showmatch = true                   -- higlight matching parenthesis
o.ruler = true                      -- show row and column in footer
o.splitbelow = true
o.splitright = true
-- o.textwidth = 80                 -- Wrap text at 80th column
o.cursorline = true               -- highlight current line
o.colorcolumn = '80'              -- show line at 80th character column

-- Searching
o.ignorecase = true          -- ignore case when searching
o.smartcase = true           -- dont ignore uppercase
o.incsearch = true           -- search as characters are entered
o.hlsearch = true            -- highlight all matches
