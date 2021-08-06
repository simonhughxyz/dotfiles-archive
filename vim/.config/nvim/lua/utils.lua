-- utils.lua

M = {}

-- need a map method to handle the different kinds of key maps
local function map(mode, combo, mapping, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, combo, mapping, options)
end
M.map = map

-- leader map method
local function lmap(mode, combo, mapping, opts)
    map(mode, '<leader>'..combo, mapping, opts)    
end
M.lmap = lmap

return M
