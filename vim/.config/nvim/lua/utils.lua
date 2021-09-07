-- utils.lua

M = {}

-- need a map method to handle the different kinds of key maps
M.map = function(mode, combo, mapping, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, combo, mapping, options)
end

-- leader map method
M.lmap = function(mode, combo, mapping, opts)
    map(mode, '<leader>'..combo, mapping, opts)    
end

M.highlight = function(group, guibg, guifg, ctermbg, ctermfg, au)
    if au == nil then
        exe = 'highlight'
    else
        exe = 'autocmd ColorScheme * highlight'
    end
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

return M
