-- init.lua

require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    ensure_installed = {
        'lua',
        'vim',
        'norg',
        'regex',
        'bash',
        'c',
        'make',
        'markdown',
        'comment',
        'html',
        'http',
        'css',
        'javascript',
        'typescript',
        'go',
        'python',
        'json',
        'toml',
        'yaml',
    },
}
