function p.strip_option(option)
    if option:find("^x00ff00", 1, true) then
        local new = string.sub(option, 9)
        return new
    end
    return option
end

function p.__on_start(wid)
    ga_init_i("temp.xar.stats7.win_num", 1)
    ga_init_i("temp.xar.stats7.wep_mode", 1)
    p.init_list_widget(wid, 1)

    local go_back_button_y = 0.02
    local w = 0.02
    local h = 0.04
    local go_back_msg = "Return To Game (ESC)"
    ga_win_widget_go_back_button_start(
        wid, go_back_button_y, w, h, go_back_msg)

    game_win_top_bar.create_stats_buttons(wid, 7)
    p.create_tab_buttons(wid)
end

function p.create_tab_buttons(wid)
    local num_buttons = 10
    local delta_x = 1.0 / num_buttons
    local x = 0.0
    local y = 0.94
    local w = 0.0075
    local h = 0.02
    ga_win_widget_button_start(wid, 101, x, y, w, h, "GUN 1")
    ga_win_widget_button_start(wid, 102, x, y, w, h, "GUN 2")
    ga_win_widget_button_start(wid, 103, x, y, w, h, "GUN 3")
    ga_win_widget_button_start(wid, 104, x, y, w, h, "GUN 4")
    ga_win_widget_button_start(wid, 105, x, y, w, h, "GUN 5")
    ga_win_widget_button_start(wid, 106, x, y, w, h, "GUN 6")
    ga_win_widget_button_start(wid, 107, x, y, w, h, "GUN 7")
    ga_win_widget_button_start(wid, 108, x, y, w, h, "GUN 8")
    ga_win_widget_button_start(wid, 109, x, y, w, h, "GUN 9")
    ga_win_widget_button_start(wid, 110, x, y, w, h, "GUN 0")

    for i = 1,num_buttons do
        local center_x = (i - 1 + 0.5) * delta_x
        ga_win_widget_button_center_x_at(wid, 100 + i, center_x)
        ga_win_widget_button_set_color(wid, 100 + i, std.vec(0.0, 1.0, 1.0))
    end
end

function p.__render(wid)
    ga_init_i("temp.xar.stats7.win_num", 1)
    ga_init_i("temp.xar.stats7.wep_mode", 1)
    local win_num = ga_get_i("temp.xar.stats7.win_num")
    local mode = ga_get_i("temp.xar.stats7.wep_mode")

    ga_win_set_background(wid, std.vec(0.0, 0.0, 0.0), 0.95)
    
    game_win_top_bar.create_stats_buttons_bot_line(wid)

    ga_win_set_char_size(wid, 0.02, 0.04)
    ga_win_txt_center(wid, 0.88, "WEAPON MODES")

    ga_win_set_char_size(wid, 0.01, 0.02)
    ga_win_txt_center(wid, 0.84, "USE LEFT / RIGHT ARROWS TO SELECT A WEAPON")
    local wep_name = game_wep_modes.get_wep_name(win_num % 10)
    ga_win_txt_center(wid, 0.80, "WEAPON #" .. tostring(win_num) .. " (" .. wep_name .. ")")

    ga_win_txt_center(wid, 0.72, "USE UP / DOWN KEYS TO SELECT A WEAPON \"MODE\"")
    ga_win_txt_center(wid, 0.68, "PRESS ENTER TO EQUIP THE WEAPON MODE (ONLY TWO CAN BE EQUIPPED)")

    if win_num == 1 then p.bar_graphs_1(wid, mode) end
    if win_num == 2 then p.bar_graphs_2(wid, mode) end
    if win_num == 3 then p.bar_graphs_3(wid, mode) end
    if win_num == 4 then p.bar_graphs_4(wid, mode) end
    --more!!!
    if win_num == 7 then p.bar_graphs_7(wid, mode) end
    --more!!!
    if win_num == 9 then p.bar_graphs_9(wid, mode) end
    --more!!!

    --DEBUGGING!!!
    -- ga_win_txt(wid, 0.2, 0.4, "MODE = " .. tostring(mode))

    ga_win_set_char_size(wid, 0.02, 0.04)
end

function p.init_list_widget(wid, sel_mode)
    local wep_num = ga_get_i("temp.xar.stats7.win_num")
    if wep_num == 10 then wep_num = 0 end
    local min_y = 0.11
    local max_y = 0.46
    local w = 0.02
    local h = 0.04
    local col = {x=0.0, y=0.5, z=0.5}
    --
    options = {}
    local max_mode = game_wep_modes.get_max_mode(wep_num)
    for i = 1,max_mode do
        if game_wep_modes.get_has(wep_num,i) then
            local color_esc = ""
            if game_wep_modes.get_equipped(wep_num, i) then color_esc = "^x00ff00" end
            table.insert(options, color_esc .. game_wep_modes.get_wep_mode_name(wep_num,i))
        end
    end
    --
    ga_win_widget_small_list_start(wid, min_y, max_y, w, h, col, options)
    --
    ga_win_widget_small_list_set_selected(wid, sel_mode-1)
end

function p.draw_bar(wid, min_y, frac)
    local grey = std.vec(0.2, 0.2, 0.2)
    local green = std.vec(0.0, 1.0, 0.0)
    local min_x = 0.37
    local max_x = 0.8
    ga_win_quad_color(wid, min_x, min_y, max_x, min_y+0.03, grey)
    local mid_x = (1.0 - frac) * min_x + frac * max_x
    ga_win_quad_color(wid, min_x, min_y, mid_x, min_y+0.03, green)
end

function p.bar_graphs_1(wid, mode)
    ga_win_txt(wid, 0.2, 0.64, " DAMAGE PER SEC:")
    ga_win_txt(wid, 0.2, 0.60, "DAMAGE PER AMMO:")
    ga_win_txt(wid, 0.2, 0.56, "       VELOCITY:")
    ga_win_txt(wid, 0.2, 0.52, "       ACCURACY:")
    --    
    local max_dps = math.max(
        game_wep_modes.get_dps(1,3),
        game_wep_modes.get_dps(1,4))
    local dps = game_wep_modes.get_dps(1,mode)
    p.draw_bar(wid, 0.64, dps / max_dps)
    --
    local max_dpa = game_wep_modes.get_dpa(1,1)
    local dpa = game_wep_modes.get_dpa(1,mode)
    p.draw_bar(wid, 0.60, dpa / max_dpa)
    --
    local max_vel = game_wep_modes.get_vel(1,4)
    local vel = game_wep_modes.get_vel(1,mode)
    local vel_frac = 0.5 * (vel / max_vel)
    if( vel_frac > 1.0 ) then
        --The flare has a much higher velocity
        --than the other modes.  Because we do not
        --want the display to look annnoying, we cap
        --the vel of the flare in this display
        --and say mode 4 has the max vel.
        vel_frac = 1.0
    end
    if mode == 5 then vel_frac = 1.0 end
    p.draw_bar(wid, 0.56, vel_frac)
    --
    local accuracy = 1.0 - 2.0 * game_wep_modes.get_spread(1,mode)
    p.draw_bar(wid, 0.52, accuracy)
end

function p.bar_graphs_2(wid, mode)
    ga_win_txt(wid, 0.2, 0.64, " DAMAGE PER SEC:")
    ga_win_txt(wid, 0.2, 0.60, "DAMAGE PER AMMO:")
    ga_win_txt(wid, 0.2, 0.56, "       VELOCITY:")
    ga_win_txt(wid, 0.2, 0.52, "       ACCURACY:")
    --
    local max_dps =
        game_wep_modes.get_dps(2,2)
    local dps = game_wep_modes.get_dps(2,mode)
    p.draw_bar(wid, 0.64, dps / max_dps)
    --
    local max_dpa = game_wep_modes.get_dpa(2,1)
    local dpa = game_wep_modes.get_dpa(2,mode)
    p.draw_bar(wid, 0.60, dpa / max_dpa)
    --
    local max_vel = game_wep_modes.get_vel(2,2)
    local vel = game_wep_modes.get_vel(2,mode)
    local vel_frac = 0.5 * (vel / max_vel)
    p.draw_bar(wid, 0.56, vel_frac)
    --
    local accuracy = 1.0 - 4.0 * game_wep_modes.get_spread(2,mode)
    p.draw_bar(wid, 0.52, accuracy)
end

function p.bar_graphs_3(wid, mode)
    ga_win_txt(wid, 0.2, 0.64, " DAMAGE PER SEC:")
    ga_win_txt(wid, 0.2, 0.60, "DAMAGE PER AMMO:")
    ga_win_txt(wid, 0.2, 0.56, "    FREEZE TIME:")
    --
    local max_dps =
        game_wep_modes.get_dps(3,4)
    local dps = game_wep_modes.get_dps(3,mode)
    p.draw_bar(wid, 0.64, dps / max_dps)
    --
    local max_dpa = game_wep_modes.get_dpa(3,4)
    local dpa = game_wep_modes.get_dpa(3,mode)
    p.draw_bar(wid, 0.60, dpa / max_dpa)
    --
    local max_freeze = game_wep_modes.get_freeze_length(3,2)
    local freeze = game_wep_modes.get_freeze_length(3,mode)
    p.draw_bar(wid, 0.56, freeze / max_freeze)
end

--more!!!

function p.bar_graphs_4(wid, mode)
    ga_win_txt(wid, 0.2, 0.64, " DAMAGE PER SEC:")
    ga_win_txt(wid, 0.2, 0.60, "DAMAGE PER AMMO:")
    ga_win_txt(wid, 0.2, 0.56, "       VELOCITY:")
    ga_win_txt(wid, 0.2, 0.52, "         RADIUS:")
    -- --
    local max_dps = game_wep_modes.get_dps(4,5)
    local dps = game_wep_modes.get_dps(4,mode)
    p.draw_bar(wid, 0.64, dps / max_dps)
    -- --
    local max_dpa = game_wep_modes.get_dpa(4,5)
    local dpa = game_wep_modes.get_dpa(4,mode)
    p.draw_bar(wid, 0.60, dpa / max_dpa)
    -- --
    local max_vel = game_wep_modes.get_vel(4,2)
    local vel = game_wep_modes.get_vel(4,mode)
    local vel_frac = 2.0 * vel / max_vel
    if mode == 2 then vel_frac = 1.0 end
    p.draw_bar(wid, 0.56, vel_frac)
    -- --
    local max_radius = game_wep_modes.get_radius(4,3)
    local radius = game_wep_modes.get_radius(4,mode)
    p.draw_bar(wid, 0.52, radius / max_radius)
end

function p.bar_graphs_7(wid, mode)
    local wep = 7
    ga_win_txt(wid, 0.2, 0.64, " DAMAGE PER SEC:")
    ga_win_txt(wid, 0.2, 0.60, "DAMAGE PER AMMO:")
    ga_win_txt(wid, 0.2, 0.56, "   HEALTH STEAL:")
    ga_win_txt(wid, 0.2, 0.52, "       ACCURACY:")
    --
    local max_dps =
        game_wep_modes.get_dps(wep,2)
    local dps = game_wep_modes.get_dps(wep,mode)
    p.draw_bar(wid, 0.64, dps / max_dps)
    --
    local max_dpa = game_wep_modes.get_dpa(wep,1)
    local dpa = game_wep_modes.get_dpa(wep,mode)
    p.draw_bar(wid, 0.60, dpa / max_dpa)
    --
    local max_health_steal_max = game_wep_modes.get_health_bonus(wep, 3)
    local health_steal = game_wep_modes.get_health_bonus(wep, mode)
    p.draw_bar(wid, 0.56, health_steal / max_health_steal_max)
    --
    local accuracy = 1.0 - 8.0 * game_wep_modes.get_spread(wep,mode)
    p.draw_bar(wid, 0.52, accuracy)
end

function p.bar_graphs_9(wid, mode)
    ga_win_txt(wid, 0.2, 0.64, " DAMAGE PER SEC:")
    ga_win_txt(wid, 0.2, 0.60, "DAMAGE PER AMMO:")
    ga_win_txt(wid, 0.2, 0.56, "       VELOCITY:")
    ga_win_txt(wid, 0.2, 0.52, "         RADIUS:")
    -- --
    local max_dps = game_wep_modes.get_dps(9,3)
    local dps = game_wep_modes.get_dps(9,mode)
    p.draw_bar(wid, 0.64, dps / max_dps)
    -- --
    local max_dpa = game_wep_modes.get_dpa(9,1)
    local dpa = game_wep_modes.get_dpa(9,mode)
    p.draw_bar(wid, 0.60, dpa / max_dpa)
    -- --
    local max_vel = game_wep_modes.get_vel(9,2)
    local vel = game_wep_modes.get_vel(9,mode)
    local vel_frac = vel / max_vel
    p.draw_bar(wid, 0.56, vel_frac)
    -- --
    local max_radius = game_wep_modes.get_radius(9,2)
    local radius = game_wep_modes.get_radius(9,mode)
    p.draw_bar(wid, 0.52, radius / max_radius)
end

--more!!!

function p.list_sel_to_wep_mode(wid, sel)
    local sel_name1 = ga_win_widget_small_list_get_entry(wid, sel)
    local sel_name2 = p.strip_option(sel_name1)
    local wep_num = ga_get_i("temp.xar.stats7.win_num")
    local sel_mode = game_wep_modes.wep_mode_name_to_num(wep_num, sel_name2)
    return sel_mode
end

function p.__process_input(wid)
    if ga_win_widget_go_back_button_process_input(wid) then
        ga_window_pop()
        return
    end

    local click_sel = game_win_top_bar.buttons_process_input_helper(wid)

    game_win_top_bar.input(wid, 7)

    ga_init_i("temp.xar.stats7.win_num", 1)
    local wep_num = ga_get_i("temp.xar.stats7.win_num")

    local click_wep_num = -1
    if( click_sel == "GUN 1" ) then click_wep_num = 1 end
    if( click_sel == "GUN 2" ) then click_wep_num = 2 end
    if( click_sel == "GUN 3" ) then click_wep_num = 3 end
    if( click_sel == "GUN 4" ) then click_wep_num = 4 end
    if( click_sel == "GUN 5" ) then click_wep_num = 5 end
    if( click_sel == "GUN 6" ) then click_wep_num = 6 end
    if( click_sel == "GUN 7" ) then click_wep_num = 7 end
    if( click_sel == "GUN 8" ) then click_wep_num = 8 end
    if( click_sel == "GUN 9" ) then click_wep_num = 9 end
    if( click_sel == "GUN 0" ) then click_wep_num = 10 end
    if( click_wep_num >= 0 ) then
        ga_set_i("temp.xar.stats7.win_num", click_wep_num)
        p.init_list_widget(wid, click_wep_num)
    end

    local sel = ga_win_widget_small_list_process_input(wid)
    if sel >= 0 then
        local sel_mode = p.list_sel_to_wep_mode(wid, sel)
        game_wep_modes.equip_mode(wep_num, sel_mode)
        p.init_list_widget(wid, sel_mode)
    end

    --Switching sub windows.
    if ga_win_key_pressed(wid, "LEFT")  and wep_num > 1 then
        wep_num = wep_num - 1
        ga_set_i("temp.xar.stats7.win_num", wep_num)
        p.init_list_widget(wid, wep_num)
    end
    if ga_win_key_pressed(wid, "RIGHT") and wep_num < 10 then
        wep_num = wep_num + 1
        ga_set_i("temp.xar.stats7.win_num", wep_num)
        p.init_list_widget(wid, wep_num)
    end

    local sel = ga_win_widget_small_list_get_selected(wid)
    local sel_mode = p.list_sel_to_wep_mode(wid, sel)
    if( sel_mode < 1 ) then sel_mode = 1 end --Uh oh!

    ga_init_i("temp.xar.stats7.wep_mode", 1)
    ga_set_i("temp.xar.stats7.wep_mode", sel_mode)

    --Setting the colors correctly.
    color_green = std.vec(0.0, 1.0, 0.0)
    color_cyan = std.vec(0.0, 1.0, 1.0)
    for i = 1,10 do
        local color = color_cyan
        if( i == wep_num ) then color = color_green end
        ga_win_widget_button_set_color(wid, 100+i, color)
    end
end
