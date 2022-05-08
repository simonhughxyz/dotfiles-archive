-- mappings.lua

utils = require('utils')
lmap = utils.lmap

lmap('n', 'f', [[<CMD>lua require'plugins.telescope-config.cmd'.project_files()<CR>]], silent)
lmap('n', 'F', [[:Telescope find_files<CR>]], silent)
lmap('n', 'bb', [[:Telescope buffers<CR>]])
lmap('n', 'bf', [[:Telescope current_buffer_fuzzy_find<CR>]], silent)
lmap('n', 'tm', [[:Telescope man_pages<CR>]], silent)
lmap('n', 'th', [[:Telescope help_tags<CR>]], silent)
lmap('n', 'gf', [[:Telescope git_files<CR>]], silent)
lmap('n', 'gb', [[:Telescope git_branches<CR>]], silent)
lmap('n', 'gs', [[:Telescope git_status<CR>]], silent)
lmap('n', 'gS', [[:Telescope git_stash<CR>]], silent)
lmap('n', 'gc', [[:Telescope git_commits<CR>]], silent)
lmap('n', 'gC', [[:Telescope git_bcommits<CR>]], silent)
lmap('n', 'o', [[:Telescope vim_options<CR>]], silent)
lmap('n', '"', [[:Telescope registers<CR>]], silent)
