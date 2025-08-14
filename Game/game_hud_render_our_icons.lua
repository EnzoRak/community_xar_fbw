function p.render_our_icons(wid)
    if not ga_get_b("xar.hud.show_icons") then return end

    -- Icons.
    --changed the bottom
    local icon_bot = 0.25
    local icon_top = icon_bot + 0.08
    local icon_width = 0.05

    local step_x = icon_width + 0.01
    local cur_x = 0.01

    local col_red  = std.vec(1.0, 0.0, 0.0)
    local col_green  = std.vec(0.0, 1.0, 0.0)


    if ga_get_b("community_xar_fbw.pink_ascended") then
        local tex = "block_pink"
        ga_win_quad(wid, cur_x, icon_bot, cur_x+icon_width, icon_top, tex)
        --idk man
        ga_win_set_char_size(wid, 0.005,0.015)
        ga_win_txt_center_at_bg(wid, 
            cur_x + 0.5*icon_width,
            icon_top,
            "^xFF91C7Pink Ascended^!")
        cur_x = cur_x + step_x
    end
end
