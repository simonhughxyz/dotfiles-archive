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
        "npxbr/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"},
        config = function() require('plugins.gruvbox-config') end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        branch = '0.5-compat',
        run = ':TSUpdate',
        config = function() require('plugins.treesitter-config') end
    }

    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        branch = '0.5-compat',
        requires = {'nvim-treesitter/nvim-treesitter'},
        config = function()
            require'nvim-treesitter.configs'.setup {
              textobjects = {
                select = {
                  enable = true,
                  -- Automatically jump forward to textobj, similar to targets.vim 
                  lookahead = true,
                  keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                    ["aa"] = "@parameter.outer",
                    ["ia"] = "@parameter.inner",
                    ["al"] = "@loop.outer",
                    ["il"] = "@loop.inner",
                    ["a#"] = "@comment.outer",
                    ["i#"] = "@comment.outer",
                },
                },
                 swap = {
                    enable = true,
                    swap_next = {
                        ["<leader>a"] = "@parameter.inner",
                    },
                    swap_previous = {
                        ["<leader>A"] = "@parameter.inner",
                    },
                },
            move = {
                  enable = true,
                  set_jumps = true, -- whether to set jumps in the jumplist
                  goto_next_start = {
                    ["]f"] = "@function.outer",
                    ["]c"] = "@class.outer",
                    ["]#"] = "@comment.outer",
                  },
                  goto_next_end = {
                    ["]F"] = "@function.outer",
                    ["]C"] = "@class.outer",
                    ["]~"] = "@comment.outer",
                  },
                  goto_previous_start = {
                    ["[f"] = "@function.outer",
                    ["[c"] = "@class.outer",
                    ["[#"] = "@comment.outer",
                  },
                  goto_previous_end = {
                    ["[F"] = "@function.outer",
                    ["[C"] = "@class.outer",
                    ["[~"] = "@comment.outer",
                  },
                },
              },
            }
        end
    }

    -- use 'luochen1990/rainbow' -- Color matching brackets.
    use {
        'p00f/nvim-ts-rainbow',
        requires = {'nvim-treesitter/nvim-treesitter'},
        config = function() require('plugins.rainbow-config') end
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
        },
        config = function()
            require('plugins.telescope-config')
            require('plugins.telescope-config.mappings')
        end,
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
        config = function() require('plugins.gitsigns-config') end
    }
    use { -- Show a line marking indents
        'Yggdroot/indentLine',
        config = function()
            vim.g.indentLine_setConceal = 0
        end
    }
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
        setup = function()
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
