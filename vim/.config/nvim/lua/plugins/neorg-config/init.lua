-- init.lua

require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    home = "~/Documents/notes/home",
                    gtd = "~/Documents/notes/gtd",
                },
            }
        },
        ["core.gtd.base"] = {
            config = {
                workspace = "gtd",
            }
        },
        ["core.norg.completion"] = {
           config = {
                engine = 'nvim-cmp',
           }
        },
        ["core.norg.qol.toc"] = {
            config = {
                close_split_on_jump = true,
                toc_split_placement = "right",
            }
        },
        ["core.export"] = {},
        ["core.export.markdown"] = {
            config = {
                extensions = "all",
            }
        },
        ["core.integrations.telescope"] = {},
    }
}
