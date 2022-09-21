-- init.lua

local base = (...):gsub('%.init$', '') -- "my-package"

local r = function(snippet)
    require(base .. '.snippets.' .. snippet )
end

-- load snippet files from ./snippets
r('all')
r('sh')

-- mappings for choices
vim.api.nvim_set_keymap("i", "<C-n>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-n>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("i", "<C-p>", "<Plug>luasnip-prev-choice", {})
vim.api.nvim_set_keymap("s", "<C-p>", "<Plug>luasnip-prev-choice", {})
