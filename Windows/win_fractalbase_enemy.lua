-- 0: undiscovered, 1: basic, 2: death, 3: all

p.enemy = 0

function p.__on_start(wid)
    local go_back_button_y = 0.02
    local w = 0.02
    local h = 0.04

    game_win_top_bar.create_stats_buttons(wid, 8)

    local num_buttons = 2
    local delta_x = 1.0 / num_buttons
    local x = 0.0
    local y = 0.94
    local w = 0.0075
    local h = 0.02
    ga_win_widget_button_start(wid, 101, x, y, w, h, "ENEMIES")
    ga_win_widget_button_start(wid, 102, x, y, w, h, "LOCATIONS")

    for i = 1,num_buttons do
        local center_x = (i - 1 + 0.5) * delta_x
        ga_win_widget_button_center_x_at(wid, 100 + i, center_x)
        ga_win_widget_button_set_color(wid, 100 + i, std.vec(0.0, 1.0, 1.0))
    end
end

function p.__render(wid)
    ga_win_set_background(wid, std.vec(0.0, 0.0, 0.0), 0.95)

    game_win_top_bar.create_stats_buttons_bot_line(wid)

    local v = win_fractalbase.enemy_data[p.enemy]

    local type = v[2][3] == 1 and "HITSCAN" or "PROJECTILE"

    local msg = v[1]:upper() .. "\n\nHP: " .. game_difficulty_curve.curve_enemy_health(v[2][1]) .. "\nDMG: " .. game_difficulty_curve.curve_enemy_damage(v[2][2]) .. "\nTYPE: " .. type .. "\n\n" .. v[3]
    local setting = tonumber(ga_get_s("community_xar_fbw.fractalbase.enemies_discovered"):sub(p.enemy,p.enemy))
    if setting >= 2 then
        msg = msg .. "\n\n" .. v[4]
    end
    if setting == 3 then
        msg = msg .. "\n\n" .. v[5]
    end


    ga_win_set_char_size(wid, 0.01, 0.02)


    ga_win_txt_box(wid, msg, true)
end

function p.__process_input(wid)
    if ga_win_key_pressed(wid, "ESC") or ga_win_key_pressed(wid, "F") or ga_win_mouse_pressed(wid, true) then
        ga_window_pop()
        return
    end

    game_win_top_bar.input(wid, 8)

    color_green = std.vec(0.0, 1.0, 0.0)
    color_cyan = std.vec(0.0, 1.0, 1.0)
    for i = 1,2 do
        local color = color_cyan
        if( i == 1 ) then color = color_green end
        ga_win_widget_button_set_color(wid, 100+i, color)
    end
end