-- init.lua

require('settings')    -- lua/settings.lua
require('plugins')    -- lua/settings.lua
require('mappings')    -- lua/mappings.lua
require('highlights')   -- lua/highlights.lua
require('statusline') -- lua/statusline.lua

-- source my old vimscript config
vim.cmd('source old_config.vim')
