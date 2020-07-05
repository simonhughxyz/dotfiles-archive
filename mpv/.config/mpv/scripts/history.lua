-- history
-- Kepps a history log of all files played with mpv.
--
-- Format: "Date Time Path Title" each seperated by 3 spaces.
-- Lack of title is indicated by '---'.

local utils = require("mp.utils")

local HISTFILE = (os.getenv('APPDATA') or os.getenv('HOME')..'/.local/share')..'/mpv/history.log';

local TMP_HISTFILE = os.getenv('XDG_RUNTIME_DIR')..'/mpv/history.log'

function write_to_log(file, log)
    logfile = io.open(file, 'a+');
    logfile:write(log);    
    logfile:close();
end

mp.register_event('file-loaded', function()
    local title, path, logfile;

    -- get title or use '---'.
    title = mp.get_property('media-title');  
    -- title = (title == mp.get_property('filename') and '---' or title);
    
    -- get full path if local file.
    path = mp.get_property('path')
    if not path:find("http.?://") or path:find("magnet:%?") then
        path = utils.join_path(mp.get_property("working-directory"), path)
    end

    log = ('%s\t%s\t%s\n'):format(os.date('%Y-%m-%d\t%H:%M:%S'), path, title)

    write_to_log(TMP_HISTFILE, log)
    write_to_log(HISTFILE, log)
end)
