-- osc-toggle
-- Toggles the osc from never to always.
-- 
-- Expects osc to be set to never by default.

local is_never = true  -- no way to read the osc mode, so we assume it starts in never mode.
mp.add_key_binding("b", "osc-toggle", function()
    is_never = not is_never
    mp.command("script-message osc-visibility " .. (is_never and "always" or "never"))
end)
