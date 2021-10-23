-- init.lua

local o = vim.opt
local g = vim.g
local cmd = vim.cmd

o.background = 'dark'
g.gruvbox_italic = true
g.gruvbox_bold = false
g.gruvbox_transparent_bg = true
g.gruvbox_constrast_dark = 'hard'
g.gruvbox_improved_strings = false
cmd[[colorscheme gruvbox]]
