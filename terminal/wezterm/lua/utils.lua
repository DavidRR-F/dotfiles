local wezterm = require 'wezterm'

local M = {}

M.isViProcess = function(pane)
    return pane:get_title():find("n?vim") ~= nil
end

M.conditionalActivatePane = function(window, pane, pane_direction, vim_direction)
    local vim_pane_changed = false

    if isViProcess(pane) then
        local before = pane:get_cursor_position()
        window:perform_action(
            wezterm.action.SendKey({ key = vim_direction, mods = 'CTRL' }),
            pane
        )
        wezterm.sleep_ms(50)
        local after = pane:get_cursor_position()

        if before.x ~= after.x and before.y ~= after.y then
            vim_pane_changed = true
        end
    end

    if not vim_pane_changed then
        window:perform_action(wezterm.action.ActivatePaneDirection(pane_direction), pane)
    end
end

return M
