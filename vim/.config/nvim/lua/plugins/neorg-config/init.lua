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
    }
}
