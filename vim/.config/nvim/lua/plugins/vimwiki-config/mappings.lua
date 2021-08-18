-- mappings.lua
-- see 'help vimwiki_key_mappings'

map = require('utils').map

silent = {silent = true}

map('n', '<Tab>', ':VimwikiNextLink<CR>zMzv', silent)
map('n', '<S-Tab>', ':VimwikiPrevLink<CR>zMzv', silent)
