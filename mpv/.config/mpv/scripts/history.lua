-- history
-- Keeps a history log of all files played with mpv.
--
-- Format: "Date Time Path Title" each separated by 3 spaces.
-- Lack of title is indicated by '---'.

local utils = require("mp.utils")

local HISTFILE = (os.getenv('APPDATA') or os.getenv('HOME')..'/.local/share')..'/mpv/history.log';

local TMP_HISTFILE = os.getenv('XDG_RUNTIME_DIR')..'/mpv/history.log'
local TMP_ERRORFILE = os.getenv('XDG_RUNTIME_DIR')..'/mpv/load_error.log'

local path
local title

function write_to_log(file, log)
    logfile = io.open(file, 'a+');
    logfile:write(log);    
    logfile:close();
end


mp.register_event('start-file', function(event) 
    title = mp.get_property('media-title');  
    path = mp.get_property('path')
end)

-- log files that successfully loaded
mp.register_event('file-loaded', function()
    if not path:find("http.?://") or path:find("magnet:%?") then
        path = utils.join_path(mp.get_property("working-directory"), path)
    end

    log = ('%s\t%s\t%s\n'):format(os.date('%Y-%m-%d %H:%M:%S'), path, title)

    write_to_log(TMP_HISTFILE, log)
    write_to_log(HISTFILE, log)
end)

-- log files that failed to load
mp.register_event('end-file', function(event) 
    if event.reason == "error" then
        if not path:find("http.?://") or path:find("magnet:%?") then
            path = utils.join_path(mp.get_property("working-directory"), path)
        end

        log = ('%s\t%s\t%s\n'):format(os.date('%Y-%m-%d %H:%M:%S'), path, title)

        write_to_log(TMP_ERRORFILE, log)
    end
end)
