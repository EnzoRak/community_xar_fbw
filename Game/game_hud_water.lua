function p.in_water()
    local lp = ga_get_viewer_offset()
    local bt = ga_bp_to_bt(ga_get_viewer_level(), std.lp_to_bp(lp))
    return _G[bt] and _G[bt].water
end

function p.render(wid)
    if p.in_water() then
        local old_mode = ga_win_get_screen_coord_mode(wid)
        ga_win_set_screen_coord_mode(wid, "screen")
        ga_win_quad_color_alpha(wid, 0, 0, 1, 1, std.vec(0,0.2,1), 0.3)
        ga_win_set_screen_coord_mode(wid, old_mode)
    end
end