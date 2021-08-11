-- mappings.lua

utils = require('utils')
map = utils.map
lmap = utils.lmap

-- leader key
vim.g.mapleader = ' '

-- options
silent = {silent = true}

-- Change Panes
map('n', '<C-J>', '<C-W><C-J>', silent)
map('n', '<C-K>', '<C-W><C-K>', silent)
map('n', '<C-H>', '<C-W><C-H>', silent)
map('n', '<C-L>', '<C-W><C-L>', silent)
map('n', '<C-Down>', '<C-W><C-J>', silent)
map('n', '<C-Up>', '<C-W><C-K>', silent)
map('n', '<C-Left>', '<C-W><C-H>', silent)
map('n', '<C-Right>', '<C-W><C-L>', silent)

-- Set exit terminal mode
map('t', '<Esc><Esc>', [[<C-\><C-n>]], silent)

-- Folding
map('n', [[z\]], 'za', silent)
map('n', 'z[', 'zR', silent)
map('n', 'z]', 'zM', silent)


-- Better tabbing
map('v', '<', '<gv', silent)
map('v', '>', '>gv', silent)

-- Function Keys
map('n', '<F2>', ':set number!<CR>:set relativenumber!<CR>', silent)
map('n', '<F4>', ':make<CR>')
map('n', '<F9>', ':TagbarOpenAutoClose<CR>')
map('n', '<F10>', ':TagbarToggle<CR>')

-- Search and replace
map('n', '\\', ':%s//g<Left><Left>')
map('v', '\\', ':s//g<Left><Left>')
map('v', '//', [["vy/\V<C-r>=escape(@v,'/\')<CR><CR>]])
map('v', '/s', [["vy:%s/<C-r>=escape(@v,"/\\")<CR>//g<left><left>]])


-- Leader mappings

-- re-source .vimrc
lmap('n', 'R', ':so $MYVIMRC<CR>')

-- spellcheck
lmap('n', 's', ':setlocal spell!<CR>', silent)

-- Toggle highlight
lmap('n', 'h', ':noh<CR>', silent)

-- Show empty chars
lmap('n', 'c', ':set invlist<CR>', silent)

-- Toggle Conceal
lmap('n', 'C', [[:let &cole=(&cole == 2) ? 0 : 2 <bar> echo 'conceallevel ' . &cole <CR>]], silent)


-- next and previous hunk
lmap('n', ']h', '<Plug>(GitGutterNextHunk)', silent)
lmap('n', '[h', '<Plug>(GitGutterPrevHunk)', silent)
