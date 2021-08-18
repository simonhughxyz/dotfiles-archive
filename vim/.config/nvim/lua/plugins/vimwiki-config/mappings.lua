-- mappings.lua
-- see 'help vimwiki_key_mappings'

map = require('utils').map

silent = {silent = true}

map('n', '<CR>', ':VimwikiFollowLink<CR>', silent)
map('n', '<Backspace>', ':VimwikiGoBackLink<CR>', silent)
map('n', '<Tab>', ':VimwikiNextLink<CR>zMzv', silent)
map('n', '<S-Tab>', ':VimwikiPrevLink<CR>zMzv', silent)
