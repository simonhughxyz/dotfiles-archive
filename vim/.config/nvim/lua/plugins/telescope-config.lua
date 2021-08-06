-- telescope.lua

local M = {}
utils = require('utils')
lmap = utils.lmap

require('telescope').setup{
    defaults = {
    vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
        horizontal = {
            mirror = false,
            prompt = bottom,
            preview_width = 0.50,
            preview_cutoff = 80,
        },
        vertical = {
            mirror = false,
            prompt = bottom,
            preview_height = 0.40,
            preview_cutoff = 80,
        },
        width = 0.96,
        height = 0.80,
    },
    file_sorter =  require('telescope.sorters').get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require('telescope.sorters').get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    previewer = true,
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker
}
}

M.project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require'telescope.builtin'.git_files, opts)
  if not ok then require'telescope.builtin'.find_files(opts) end
end

lmap('n', 'f', [[<CMD>lua require'plugins.telescope-config'.project_files()<CR>]], silent)
lmap('n', 'F', [[:Telescope find_files<CR>]], silent)
lmap('n', 'bb', [[:Telescope buffers<CR>]], silent)
lmap('n', 'bf', [[:Telescope current_buffer_fuzzy_find<CR>]], silent)
lmap('n', 'tm', [[:Telescope man_pages<CR>]], silent)
lmap('n', 'th', [[:Telescope help_tags<CR>]], silent)
lmap('n', 'gf', [[:Telescope git_files<CR>]], silent)
lmap('n', 'gb', [[:Telescope git_branches<CR>]], silent)
lmap('n', 'gs', [[:Telescope git_status<CR>]], silent)
lmap('n', 'gS', [[:Telescope git_stash<CR>]], silent)
lmap('n', 'gc', [[:Telescope git_commits<CR>]], silent)

return M
