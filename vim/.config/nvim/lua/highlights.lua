-- highlight.lua

hl = require('utils').highlight

-- Make background transparent
hl('Normal', 'NONE', nil, 'NONE', nil, true)
hl('NonText', 'NONE', nil, 'NONE', nil, true)

-- -- -- set custom syntax colors
hl('Comment', '#262626', '#bcbcbc', '235', '250', true)
-- -- -- set color of 80 char width column
hl('ColorColumn', '#303030', nil, '0', nil, true)
-- -- -- change color of cursor line
hl('CursorLine', '#000000', nil, '0', nil, true)
hl('CursorLineNr', '#000000', '#008000', '0', '2', true)
hl('TSString', nil, '#449944', '0', '2', true)

-- -- Vim Diff colors
hl('DiffAdd', '#000000', '#00c000', '2', '0', true)
hl('DiffChange', '#000000', '#c0c000', '2', '0', true)
hl('DiffDelete', '#000000', '#c00000', '2', '0', true)
hl('DiffDelete', '#ffffff', '#3000a0', '2', '0', true)
