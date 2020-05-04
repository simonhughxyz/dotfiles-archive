-- notify
-- Sends a desktop notification when file loaded.


mp.register_event('file-loaded', function()
    local title

    title = mp.get_property('media-title');  
    title = (title == mp.get_property('filename') and mp.get_property('path') or title);

    mp.command_native({"run", "notify-send", "MPV", title})
end)
