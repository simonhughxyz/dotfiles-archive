-- history
-- Kepps a history log of all files played with mpv.
--
-- Format: "Date Time Path Title" each seperated by 3 spaces.
-- Lack of title is indicated by '---'.

local HISTFILE = (os.getenv('APPDATA') or os.getenv('HOME')..'/.local/share')..'/mpv/history.log';

mp.register_event('file-loaded', function()
    local title, logfile;

    title = mp.get_property('media-title');  
    title = (title == mp.get_property('filename') and '---' or title);

    logfile = io.open(HISTFILE, 'a+');
    logfile:write(('%s   %s   %s\n'):format(os.date('%Y-%m-%d   %H:%M:%S'), mp.get_property('path'), title));    
    logfile:close();
end)
