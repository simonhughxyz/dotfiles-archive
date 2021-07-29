-- highlight.lua

function highlight(group, guibg, guifg, ctermbg, ctermfg)
    exe = 'autocmd ColorScheme * highlight'
    if group == nil then
        exe = exe .. ' *'
    else
        exe = exe .. ' ' .. group
    end
    if not (guibg == nil) then
        exe = exe .. ' guibg=' .. guibg
    end
    if not (guifg == nil) then
        exe = exe .. ' guifg=' .. guifg
    end
    if not (ctermbg == nil) then
        exe = exe .. ' ctermbg=' .. ctermbg
    end
    if not (ctermfg == nil) then
        cfg = 'ctermfg=' .. ctermfg
        exe = exe .. ' ctermfg=' .. ctermfg
    end
    vim.cmd(exe)
end

-- Make background transparent
highlight('Normal', 'NONE', nil, 'NONE', nil)
highlight('NonText', 'NONE', nil, 'NONE', nil)

-- -- set custom syntax colors
highlight('Comment', '#262626', '#bcbcbc', '235', '250')
-- -- set color of 80 char width column
highlight('ColorColumn', '#303030', nil, '0', nil)
-- -- change color of cursor line
highlight('CursorLine', '#000000', nil, '0', nil)
highlight('CursorLineNr', '#000000', '#008000', '0', '2')

-- -- Vim Diff colors
highlight('DiffAdd', '#000000', '#00c000', '2', '0')
highlight('DiffChange', '#000000', '#c0c000', '2', '0')
highlight('DiffDelete', '#000000', '#c00000', '2', '0')
highlight('DiffDelete', '#ffffff', '#3000a0', '2', '0')
