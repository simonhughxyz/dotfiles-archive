-- statusline.lua

local o = vim.opt
local cmd = vim.cmd
local v = vim.api
hl = require('utils').highlight

-- Get current vim mode
function get_mode()
    mode={
        ['n']  = 'Normal',
        ['no'] = 'N·Operator Pending',
        ['v']  = 'Visual',
        ['V']  = 'V·Line',
        [''] = 'V·Block',
        ['s']  = 'Select',
        ['S']  = 'S·Line',
        [''] = 'S·Block',
        ['i']  = 'Insert',
        ['R']  = 'Replace',
        ['Rv'] = 'V·Replace',
        ['c']  = 'Command',
        ['cv'] = 'Vim Ex',
        ['ce'] = 'Ex',
        ['r']  = 'Prompt',
        ['rm'] = 'More',
        ['r?'] = 'Confirm',
        ['!']  = 'Shell',
        ['t']  = 'Terminal',
    }
    return mode[v.nvim_get_mode().mode]
end

function status_line_paste()
    if (v.nvim_get_option('paste'))
    then
        return ' Paste '
    else
        return ''
    end
end

function get_git_branch()
  local git_branches_file = io.popen([[git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n']],'r')
  if not git_branches_file then return '' end

  local git_branches_data = git_branches_file:read("*l")
  io.close(git_branches_file)

  if not git_branches_data then return '' end
  return git_branches_data..' |'
end

colors = {
    black      = '#000000',
    white      = '#ffffff',
    background = '#0c0c0c',
    normal     = '#005000',
    visual     = '#706000',
    insert     = '#004090',
    paste      = '#5518ab',
    ['else']   = '#800000',
}

-- Automatically change the statusline color depending on mode
function change_mode_color()
    mode = v.nvim_get_mode().mode
    if mode == 'n' or mode == 'no' then
        hl('User1', colors['normal'], colors['white'], '2', '0')
        hl('CursorLineNr', colors['normal'], colors['white'], '0', '2')
--  elseif (mode() =~# '\v(v|V|)')
    elseif mode == 'v' or mode == 'V' or mode =='' then
        hl('User1', colors['visual'], colors['white'], '3', '0')
        hl('CursorLineNr', colors['visual'], colors['white'], '0', '6')
--  elseif (mode() ==# 'i')
    elseif mode == 'i' then
        hl('User1', colors['insert'], colors['white'], '6', '0')
        hl('CursorLineNr', colors['insert'], colors['white'], '0', '6')
    else
        hl('User1', colors['else'], colors['white'], '1', '255')
        hl('CursorLineNr', colors['else'], colors['white'], '0', '1')
    end
    return ''
end

cmd([[
augroup ColorSwapFix
au InsertEnter * call v:lua.change_mode_color()
au InsertLeave * call v:lua.change_mode_color()
au CmdlineEnter * redrawstatus
au CmdlineLeave * redrawstatus
au CmdwinEnter * call v:lua.change_mode_color()
au CmdwinLeave * call v:lua.change_mode_color()
au BufEnter * call v:lua.change_mode_color()
au BufLeave * call v:lua.change_mode_color()
au TermEnter * call v:lua.change_mode_color()
au TermLeave * call v:lua.change_mode_color()
augroup END
]])


-- main statusline color
hl('statusline', colors['white'], colors['background'], '0', '15', true)

-- Paste Toggle Color
hl('User2', colors['paste'], colors['white'], '5', '15', true)


o.laststatus = 2
o.statusline = ''


-- LEFT SIDE
-- Used for color change
o.statusline:append [[%{v:lua.change_mode_color()}]]
o.statusline:append [[%1*]]
-- show vim mode
o.statusline:append [[ %{v:lua.get_mode()}]]
o.statusline:append [[ %*]]
-- show paste toggle
o.statusline:append [[%2*]]
o.statusline:append [[%{v:lua.status_line_paste()}]]
o.statusline:append [[%*]]
-- show file name
-- set statusline+=\ %.40f
o.statusline:append [[ %.40f]]
-- truncate line from here
o.statusline:append [[%<]]
-- show if file is modified
o.statusline:append [[ %m]]
-- show if file is read only
o.statusline:append [[ %r]]

-- RIGHT SIDE
o.statusline:append [[%=]]
-- show git brannch
-- set statusline+=%{StatuslineGit()}
o.statusline:append [[%{v:lua.get_git_branch()}]]
-- show file type
o.statusline:append [[ %Y]]
o.statusline:append [[ |]]
-- show buffer number
o.statusline:append [[ %n]]
o.statusline:append [[ |]]
-- show character code user cursor
o.statusline:append [[ 0x%B]]
-- gray section
o.statusline:append [[ %1*]]
-- show file percentage
o.statusline:append [[ %p%%]]
-- show column:line / total lines
o.statusline:append [[ %v:%l]]
-- set statusline+=\ \/\ %L
o.statusline:append [[ / %L]]
o.statusline:append [[ %*]]
