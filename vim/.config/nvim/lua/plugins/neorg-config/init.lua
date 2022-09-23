-- init.lua

require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    home = "~/Documents/notes/home"
                },
            }
        },
    }
}
