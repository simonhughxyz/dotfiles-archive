-- history
-- Kepps a history log of all files played with mpv.
--
-- Format: "Date Time Path Title" each seperated by 3 spaces.
-- Lack of title is indicated by '---'.

local utils = require("mp.utils")

local HISTFILE = (os.getenv('APPDATA') or os.getenv('HOME')..'/.local/share')..'/mpv/history.log';

mp.register_event('file-loaded', function()
    local title, path, logfile;

    title = mp.get_property('media-title');  
    title = (title == mp.get_property('filename') and '---' or title);
    
    path = utils.join_path(mp.get_property("working-directory"), mp.get_property('path'))

    logfile = io.open(HISTFILE, 'a+');
    logfile:write(('%s   %s   %s\n'):format(os.date('%Y-%m-%d   %H:%M:%S'), path, title));    
    logfile:close();
end)
