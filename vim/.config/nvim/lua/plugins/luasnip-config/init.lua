-- init.lua

local base = (...):gsub('%.init$', '') -- "my-package"

local r = function(snippet)
    require(base .. '.snippets.' .. snippet )
end

-- load vs_code snippets (used for friendly-snippet plugin)
require("luasnip.loaders.from_vscode").lazy_load()

-- load custom snippet files from ./snippets
r('all')
r('sh')

-- mappings for choices
vim.api.nvim_set_keymap("i", "<C-n>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-n>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("i", "<C-p>", "<Plug>luasnip-prev-choice", {})
vim.api.nvim_set_keymap("s", "<C-p>", "<Plug>luasnip-prev-choice", {})
