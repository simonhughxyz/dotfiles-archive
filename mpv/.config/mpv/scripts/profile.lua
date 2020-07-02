-- profile
-- Selects profile to use using runtime file or ENV variable.
-- This script will make the '--profile=*' cli non-functional.
--
-- ENV variable: '$MPV_PROFILE'
-- Runtime file: '$XDG_RUNTIME_DIR/mpv/profile'
--
-- Runtime file takes priority over ENV variable.
-- Runtime file is ignored if:
--      - it does not exit.
--      - is empty.

local utils = require("mp.utils")
local msg = require 'mp.msg'

local runtime_file = os.getenv('XDG_RUNTIME_DIR')..'/mpv/profile';

local PROFILE = (os.getenv('MPV_PROFILE') or 'default')

-- get first line on runtime file.
-- return nill if it does not exit or is emply
function get_profile()
    local f = io.open(runtime_file, "rb")
    if not f then return nil end
    profile = f:read "*line"
    if profile == "" then return nil end
    return profile
end

mp.register_event('start-file', function()
    profile = get_profile()
    if not profile then
        profile = PROFILE
    end
    msg.info('Running with "'..profile..'" profile.')
    mp.commandv("apply-profile", profile)
end)
