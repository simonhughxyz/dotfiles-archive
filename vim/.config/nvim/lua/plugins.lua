-- plugins.lua

local fn = vim.fn

-- Install packer if not already installed
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.api.nvim_command('packadd packer.nvim')
end

-- Run :PackerCompile whenever plugins.lua is updated
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'morhetz/gruvbox',
        config = function()
            vim.cmd[[colorscheme gruvbox]]
            vim.g.gruvbox_italic = 1
            vim.g.gruvbox_transparent_bg = true
            vim.g.gruvbox_improved_strings = true
            vim.g.gruvbox_constrast_dark = 'hard'
        end
    }

    use 'tpope/vim-surround'   -- Add, delete, change surroundings such as brackets.
    use 'tpope/vim-repeat'     -- Allows repeating '.' for many plugins.
    use 'tpope/vim-commentary' -- Easily un/comment text.
    use 'tpope/vim-fugitive'   -- Useful git commands.
    use 'tpope/vim-unimpaired'     -- Adds common bracket mappings.
    -- use {
    --     'universal-ctags/ctags', 
    --     run = './autogen.sh;./configure --prefix=$HOME/.local;make install'
    -- }
    use {
        'junegunn/fzf',
        dir = '~/.fzf',
        run = './install --all',
        config = function()
            vim.g.fzf_layout = {
                window = {
                    width = 0.8,
                    height = 0.5,
                    highlight = 'Comment',
                }
            }
        end
    }
    use 'junegunn/fzf.vim'
    use 'junegunn/vim-easy-align'  -- Align text.
    use 'junegunn/vim-peekaboo'    -- Show register contents in sidebar.
    use { -- Highlights unique letters to help with 'f'
        'unblevable/quick-scope',
        config = function()
            vim.cmd([[
            augroup qs_colors
                autocmd!
                autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
                autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
            augroup END
            ]])
        end
    }
    use 'ludovicchabant/vim-gutentags' -- Manage tag files.
    use 'majutsushi/tagbar'    -- Shows list of tags in a sidebar.
    use 'AndrewRadev/splitjoin.vim'    -- Split single lines or join multiple lines.
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('gitsigns').setup {
                signs = {
                    add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
                    change       = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
                    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
                    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
                    changedelete = {hl = 'GitSignsChange', text = '*', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
                },
                numhl = false,
                linehl = false,
                keymaps = {
                    -- Default keymap options
                    noremap = true,

                    ['n ]h'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
                    ['n [h'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},

                    ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
                    ['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
                    ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
                    ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
                    ['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
                    ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
                    ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
                    ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',

                    -- Text objects
                    ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
                    ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
                    ['o ah'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
                    ['x ah'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
                },
                watch_index = {
                    interval = 1000,
                    follow_files = true
                },
                current_line_blame = false,
                current_line_blame_delay = 1000,
                current_line_blame_position = 'eol',
                sign_priority = 6,
                update_debounce = 100,
                status_formatter = nil, -- Use default
                word_diff = false,
                use_decoration_api = true,
                use_internal_diff = true,  -- If luajit is present
            }
        end
    }
    use { -- Show a line marking indents
        'Yggdroot/indentLine',
        config = function()
            vim.g.indentLine_setConceal = 0
        end
    }
    use 'luochen1990/rainbow' -- Color matching brackets.
    use {
        'dhruvasagar/vim-table-mode',
        ft = 'markdown',
        cmd = 'TableModeToggle',
        config = function()
            vim.g.table_mode_corner = '|'
        end
    }
    use 'MarcWeber/vim-addon-mw-utils'
    use 'tomtom/tlib_vim'
    -- use 'garbas/vim-snipmate'
    -- use 'honza/vim-snippets'
    use { -- Switch true to false, yes to no etc.
        'AndrewRadev/switch.vim',
        config = function()
            vim.g.switch_custom_definitions = {
                vim.fn["switch#NormalizedCase(['yes','no'])"]
            }
        end
    }
    use {
        'mcchrish/nnn.vim',
        config = function()
            require('nnn').setup{
                command = 'nnn -HR -T e',
                layout = { left = '20%' },
            }
        end
    }
    use {
        'vimwiki/vimwiki',
        conifg = function()
            vim.g.vimwiki_auto_header = 1
            vim.g.vimwiki_folding = 'custom'
            vim.g.vimwiki_key_mappings = { links = 0 }
            vim.g.vimwiki_list = {
                {
                    path = '~/Documents/notes/',
                    path_html = '~/Documents/notes/build/',
                    custom_wiki2html = '~/.local/bin/vimwiki_convert.sh',
                    syntax = 'markdown',
                    ext = '.md',
                    links_space_char = '_'
                }
            }
            vim.g.vimwiki_ext2syntax = {
                ['.md'] = 'markdown',
                ['.markdown'] = 'markdown',
                ['.mdown'] = 'markdown'
            }
        end
    }
    -- use {
    --     'autozimu/LanguageClient-neovim',
    --     branch = 'next',
    --     run =  'bash install.sh'
    -- }
    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require 'colorizer'.setup({'*';},
                {
                   RGB      = true;
                   RRGGBB   = true;
                   names    = true;
                   RRGGBBAA = true;
                   rgb_fn   = true;
                   hsl_fn   = true;
                   css      = true;
                   css_fn   = true;
                   mode     = 'background';
                })
        end
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    

    -- Text Object Plugins
    use 'wellle/targets.vim'   -- Expands on vim text objects and adds a few new ones.
    use 'michaeljsmith/vim-indent-object'  -- Adds indent text object.
    use 'chaoren/vim-wordmotion'   -- Vim recognizes camel case and more as words.
    use { -- Text object to target text after char.
        'junegunn/vim-after-object',
        config = function()
            vim.cmd([[autocmd VimEnter * call after_object#enable('=', ':', ';', '-', '+', '#', '_', '$')]])
        end
    }
    -- use 'kana/vim-textobj-user'
    use 'coderifous/textobj-word-column.vim'   -- Add column text object.

    
    -- Filetype Specific plugins
    use {
        'fatih/vim-go',
        ft = {'go'},
        run = ':GoUpdateBinaries'
    }
    use { 'tmux-plugins/vim-tmux', ft = {'tmux'} }
    use { 'baskerville/vim-sxhkdrc', ft = {'sxhkdrc'} }
    use { 'fourjay/vim-password-store', ft = {'pass'} }
    use { 'tmhedberg/SimpylFold', ft = {'python'} }
    use { 'tridactyl/vim-tridactyl', ft = {'trydactyl'} }
    use { 'neomutt/neomutt.vim', ft = {'muttrc'} }
    use { 'pangloss/vim-javascript', ft = {'javascript'} }
    use { 'leafgarland/typescript-vim', ft = {'typescript'} }
    use { 
        'jamessan/vim-gnupg',
        config = function()
            vim.g.GPGFilePattern = [[*.\(gpg\|asc\|pgp\)\(.*\)\=]]
            vim.g.GPGPreferArmor=1
            vim.g.GPGDefaultRecipients={"pass@pass"}
        end
    }
end)
