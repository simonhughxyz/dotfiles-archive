-- init.lua

vim.g.vimwiki_auto_header = 1
vim.g.vimwiki_folding = 'custom'
vim.g.vimwiki_key_mappings = { links = 0 }
vim.g.vimwiki_list = {
    {
        path = '~/Documents/notes/',
        path_html = '~/Documents/notes/build/',
        custom_wiki2html = '~/.local/bin/vimwiki_convert.sh',
        syntax = 'markdown',
        ext = '.md',
        links_space_char = '_'
    }
}
vim.g.vimwiki_ext2syntax = {
    ['.md'] = 'markdown',
    ['.markdown'] = 'markdown',
    ['.mdown'] = 'markdown'
}
