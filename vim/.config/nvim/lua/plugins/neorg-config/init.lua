-- init.lua

require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    home = "~/Documents/notes/home"
                },
            }
        },
        ["core.norg.completion"] = {
           config = { -- Note that this table is optional and doesn't need to be provided
                engine = 'nvim-cmp',
           }
        },
    }
}
