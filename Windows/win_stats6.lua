function p.__on_start(wid)
    local go_back_button_y = 0.02
    local w = 0.02
    local h = 0.04
    local go_back_msg = "Return To Game (ESC)"
    ga_win_widget_go_back_button_start(
        wid, go_back_button_y, w, h, go_back_msg)

    game_win_top_bar.create_stats_buttons(wid, 6)
    p.create_tab_buttons(wid)
end

p.num_pages = 13

function p.create_tab_buttons(wid)
    local num_buttons = p.num_pages
    local delta_x = 1.0 / num_buttons
    local x = 0.0
    local y = 0.94
    local w = 0.0075
    local h = 0.02
    ga_win_widget_button_start(wid, 101, x, y, w, h, "YW")
    ga_win_widget_button_start(wid, 102, x, y, w, h, "MID")
    ga_win_widget_button_start(wid, 103, x, y, w, h, "I1")
    ga_win_widget_button_start(wid, 104, x, y, w, h, "I2 A")
    ga_win_widget_button_start(wid, 105, x, y, w, h, "I2 B")
    ga_win_widget_button_start(wid, 106, x, y, w, h, "I3 A")
    ga_win_widget_button_start(wid, 107, x, y, w, h, "I3 B")
    ga_win_widget_button_start(wid, 108, x, y, w, h, "BUR")
    ga_win_widget_button_start(wid, 109, x, y, w, h, "SPACE")
    ga_win_widget_button_start(wid, 110, x, y, w, h, "BULK")
    ga_win_widget_button_start(wid, 111, x, y, w, h, "MYANTIS")
    ga_win_widget_button_start(wid, 112, x, y, w, h, "HELL")
    ga_win_widget_button_start(wid, 113, x, y, w, h, "NWP")
    
    for i = 1,num_buttons do
        local center_x = (i - 1 + 0.5) * delta_x
        ga_win_widget_button_center_x_at(wid, 100 + i, center_x)
        ga_win_widget_button_set_color(wid, 100 + i, std.vec(0.0, 1.0, 1.0))
    end

    ga_win_widget_button_start(wid, 999, 0.01, 0.01, w, h, "Open CXar Trophies")
    ga_win_widget_button_set_color(wid, 999, std.vec(0,1,1))
end

function p.draw_trophy(wid, grid, row, col, name)
    have_trophy = ga_get_b("xar.player.trophy." .. name)
    debug = false
    --debug = true --DEBUGGING!!!
    if have_trophy or debug then
        tex_name = "trophy_" .. name
    else
        tex_name = "trophy_do_not_have"
    end
    --
    big_width = grid.max_x - grid.min_x
    big_height = grid.max_y - grid.min_y
    delta_x = big_width / (grid.num_x - 1)
    delta_y = big_height / (grid.num_y - 1)
    x = grid.min_x + (delta_x * col)
    y = grid.max_y - (delta_y * row)
    quad_min_x = x - (grid.trophy_width / 2)
    quad_max_x = x + (grid.trophy_width / 2)
    quad_min_y = y - (grid.trophy_height / 2)
    quad_max_y = y + (grid.trophy_height / 2)
    ga_win_quad(
        wid, 
        quad_min_x,
        quad_min_y,
        quad_max_x,
        quad_max_y,
        tex_name);
end

function p.__render(wid)
    ga_init_i("temp.xar.stats5.win_num", 1)

    ga_win_set_background(wid, std.vec(0.0, 0.0, 0.0), 0.95)

    game_win_top_bar.create_stats_buttons_bot_line(wid)
    
    ga_win_set_char_size(wid, 0.02, 0.04)
    ga_win_txt_center(wid, 0.88, "TROPHIES")

    ga_win_set_char_size(wid, 0.01, 0.02)
    ga_win_txt_center(wid, 0.84, "USE LEFT / RIGHT ARROWS")

    ga_win_set_char_size(wid, 0.02, 0.04)

    type_y = 0.76

    grid = {
        min_x = 0.25,
        max_x = 0.75,
        num_x = 4,
        min_y = 0.16,
        max_y = 0.66,
        num_y = 4,
        trophy_width = 0.13,
        trophy_height = 0.16}

    win_num = ga_get_i("temp.xar.stats5.win_num")
    if win_num == 1 then
        ga_win_txt_center(wid, type_y, "YING WORLD TROPHIES")
        p.draw_trophy(wid, grid, 0,0, "library_ying")
        p.draw_trophy(wid, grid, 0,1, "noob_flower") 
        p.draw_trophy(wid, grid, 0,2, "small_yellow_flower")
        p.draw_trophy(wid, grid, 0,3, "jumbo_yellow_flower")
        p.draw_trophy(wid, grid, 1,0, "ying_island_1")
        p.draw_trophy(wid, grid, 1,1, "ying_island_2")
        p.draw_trophy(wid, grid, 1,2, "ying_island_3")
        p.draw_trophy(wid, grid, 1,3, "ying_island_4")
        p.draw_trophy(wid, grid, 2,0, "small_cannon_pyramid")
        p.draw_trophy(wid, grid, 2,1, "large_cannon_pyramid")
        p.draw_trophy(wid, grid, 2,2, "ying_exit_maze")
        p.draw_trophy(wid, grid, 2,3, "ying_flower")
        p.draw_trophy(wid, grid, 3,0, "ying_tower")
        p.draw_trophy(wid, grid, 3,1, "sponge_pure")
        --more!!!
    end
    if win_num == 2 then
        ga_win_txt_center(wid, type_y, "MIDWAY TROPHIES")
        p.draw_trophy(wid, grid, 0,0, "richmond")
        p.draw_trophy(wid, grid, 0,1, "richmond_sewers")
        p.draw_trophy(wid, grid, 0,2, "tau_caves_map")
        p.draw_trophy(wid, grid, 0,3, "richmond_caves")
        p.draw_trophy(wid, grid, 1,0, "stoney_cave_1")
        p.draw_trophy(wid, grid, 1,1, "stoney_cave_2")
        p.draw_trophy(wid, grid, 1,2, "stoney_cave_3")
        p.draw_trophy(wid, grid, 1,3, "stoney_church")
        p.draw_trophy(wid, grid, 2,0, "blackberry")
        p.draw_trophy(wid, grid, 2,1, "black_cube")
        p.draw_trophy(wid, grid, 2,2, "jericho")
        p.draw_trophy(wid, grid, 2,3, "catacombs")
        p.draw_trophy(wid, grid, 3,0, "orange")
        p.draw_trophy(wid, grid, 3,1, "tweed_cave")
        p.draw_trophy(wid, grid, 3,2, "ice_cube")
        p.draw_trophy(wid, grid, 3,3, "blue_bubble")
    end
    if win_num == 3 then
        ga_win_txt_center(wid, type_y, "I1 TROPHIES")
        p.draw_trophy(wid, grid, 0,0, "blue_bubble_breach")
        p.draw_trophy(wid, grid, 0,1, "botany_lab_1")
        p.draw_trophy(wid, grid, 0,2, "botany_lab_2")
        p.draw_trophy(wid, grid, 0,3, "botany_lab_3")
        p.draw_trophy(wid, grid, 1,0, "botany_lab_4")
        p.draw_trophy(wid, grid, 1,1, "botany_lab_5")
        p.draw_trophy(wid, grid, 1,2, "botany_lab_6")
        p.draw_trophy(wid, grid, 1,3, "library_i1")
        p.draw_trophy(wid, grid, 2,0, "lighthouse")
        p.draw_trophy(wid, grid, 2,1, "infinity_flower")
        p.draw_trophy(wid, grid, 2,2, "williston")
        p.draw_trophy(wid, grid, 2,3, "williston_caves")
        p.draw_trophy(wid, grid, 3,0, "bristol")
        p.draw_trophy(wid, grid, 3,1, "emp_castle")
        p.draw_trophy(wid, grid, 3,2, "zube_castle")
        --more!!!
    end
    if win_num == 4 then
        ga_win_txt_center(wid, type_y, "I2 TROPHIES PART 1")
        p.draw_trophy(wid, grid, 0,0, "library_i2")
        p.draw_trophy(wid, grid, 0,1, "wig_prison")
        p.draw_trophy(wid, grid, 0,2, "montreal")
        p.draw_trophy(wid, grid, 0,3, "toronto")
        p.draw_trophy(wid, grid, 1,0, "toronto_underground")
        p.draw_trophy(wid, grid, 1,1, "danville")
        p.draw_trophy(wid, grid, 1,2, "small_blue_flower_1")
        p.draw_trophy(wid, grid, 1,3, "small_blue_flower_2")
        p.draw_trophy(wid, grid, 2,0, "willow_tree")
        p.draw_trophy(wid, grid, 2,1, "willow_tree_dark")
        p.draw_trophy(wid, grid, 2,2, "mystic_vine")
        p.draw_trophy(wid, grid, 2,3, "raspberry")
        p.draw_trophy(wid, grid, 3,0, "weed_rings")
        p.draw_trophy(wid, grid, 3,1, "blue_mushroom")
        p.draw_trophy(wid, grid, 3,2, "fanatic_spire")
        p.draw_trophy(wid, grid, 3,3, "creeping_jeni")
    end
    if win_num == 5 then
        ga_win_txt_center(wid, type_y, "I2 TROPHIES PART 2")
        p.draw_trophy(wid, grid, 0,0, "violets")
        --more!!!
    end
    if win_num == 6 then
        ga_win_txt_center(wid, type_y, "I3 TROPHIES PART 1")
        p.draw_trophy(wid, grid, 0,0, "library_i3")
        p.draw_trophy(wid, grid, 0,1, "colchester")
        p.draw_trophy(wid, grid, 0,2, "large_white_flower")
        p.draw_trophy(wid, grid, 0,3, "red_maze_flower")
        p.draw_trophy(wid, grid, 1,0, "jackfruit")
        p.draw_trophy(wid, grid, 1,1, "cactus")
        p.draw_trophy(wid, grid, 1,2, "aladdin_cave")
        p.draw_trophy(wid, grid, 1,3, "desert_cave")
        p.draw_trophy(wid, grid, 2,0, "desert_flower")
        p.draw_trophy(wid, grid, 2,1, "salmon_mushroom")
        p.draw_trophy(wid, grid, 2,2, "black_mushroom")
        p.draw_trophy(wid, grid, 2,3, "yellow_mushroom")
        p.draw_trophy(wid, grid, 3,0, "red_mushroom")
        p.draw_trophy(wid, grid, 3,1, "river")
        p.draw_trophy(wid, grid, 3,2, "tangerine")
        p.draw_trophy(wid, grid, 3,3, "st_i3_treetop")
    end
    if win_num == 7 then
        ga_win_txt_center(wid, type_y, "I3 TROPHIES PART 2")
        p.draw_trophy(wid, grid, 0,0, "inner_tree")
        p.draw_trophy(wid, grid, 0,1, "deep_sliver_maze")
        --more!!!
    end
    if win_num == 8 then
        ga_win_txt_center(wid, type_y, "BURLINGTON TROPHIES")
        p.draw_trophy(wid, grid, 0,0, "burlington_cols")
        p.draw_trophy(wid, grid, 0,1, "burlington")
        p.draw_trophy(wid, grid, 0,2, "tegan_garden")
        p.draw_trophy(wid, grid, 0,3, "green_apple_club")
        --more!!!
    end
    if win_num == 9 then
        ga_win_txt_center(wid, type_y, "SPACE TROPHIES")
        p.draw_trophy(wid, grid, 0,0, "library_space")
        p.draw_trophy(wid, grid, 0,1, "moon_alpha")
        p.draw_trophy(wid, grid, 0,2, "moon_beta")
        p.draw_trophy(wid, grid, 0,3, "moon_gamma")
        p.draw_trophy(wid, grid, 1,0, "moon_tau")
        p.draw_trophy(wid, grid, 1,1, "moon_ice")
        p.draw_trophy(wid, grid, 1,2, "moon_fire_rate")
        p.draw_trophy(wid, grid, 1,3, "planet_small_minigun")
        p.draw_trophy(wid, grid, 2,0, "planet_clay")
        p.draw_trophy(wid, grid, 2,1, "sun")
        p.draw_trophy(wid, grid, 2,2, "sponge_alpha")
        --more!!!
    end
    if win_num == 10 then
        ga_win_txt_center(wid, type_y, "THE BULK TROPHIES")
        p.draw_trophy(wid, grid, 0,0, "ice_castle")
        --more!!!
    end
    if win_num == 11 then
        ga_win_txt_center(wid, type_y, "MYLANTIS TROPHIES")
        p.draw_trophy(wid, grid, 0,0, "mylantis")
        p.draw_trophy(wid, grid, 0,1, "farmhouse")
        p.draw_trophy(wid, grid, 0,2, "laser_genesis")
        p.draw_trophy(wid, grid, 0,3, "sapphire_maze")
        p.draw_trophy(wid, grid, 1,0, "sponge_beta")
        p.draw_trophy(wid, grid, 1,1, "topaz")
        p.draw_trophy(wid, grid, 1,2, "iolite")
        p.draw_trophy(wid, grid, 1,3, "emerald")
        p.draw_trophy(wid, grid, 2,0, "denver")
        p.draw_trophy(wid, grid, 2,1, "amethyst_maze")
        p.draw_trophy(wid, grid, 2,2, "edge_of_world")
        --more!!!
    end
    if win_num == 12 then
        ga_win_txt_center(wid, type_y, "HELL TROPHIES")
        p.draw_trophy(wid, grid, 0,0, "hell_flower")
        p.draw_trophy(wid, grid, 0,1, "inner_core")
        p.draw_trophy(wid, grid, 0,2, "credits")
        --more!!!
    end
    if win_num == 13 then
        ga_win_txt_center(wid, type_y, "NO WAYPOINT TROPHIES")
        p.draw_trophy(wid, grid, 0,0, "small_white_flower")
        p.draw_trophy(wid, grid, 0,1, "small_black_flower")
        p.draw_trophy(wid, grid, 0,2, "apple_tree")
        p.draw_trophy(wid, grid, 1,0, "health_tower")
        p.draw_trophy(wid, grid, 1,1, "alpha_cube")
        --more!!!
    end
end

function p.__process_input(wid)
    if ga_win_widget_go_back_button_process_input(wid) then
        ga_window_pop()
        return
    end

    local click_sel = game_win_top_bar.buttons_process_input_helper(wid)

    game_win_top_bar.input(wid, 6)

    if click_sel == "Open CXar Trophies" then ga_window_push("win_cxar_trophies") return end

    num = ga_get_i("temp.xar.stats5.win_num")
    if click_sel == "YW"        then num = 1 end
    if click_sel == "MID"       then num = 2 end
    if click_sel == "I1"        then num = 3 end
    if click_sel == "I2 A"      then num = 4 end
    if click_sel == "I2 B"      then num = 5 end
    if click_sel == "I3 A"      then num = 6 end
    if click_sel == "I3 B"      then num = 7 end
    if click_sel == "BUR"       then num = 8 end
    if click_sel == "SPACE"     then num = 9 end
    if click_sel == "BULK"      then num = 10 end
    if click_sel == "MYANTIS"   then num = 11 end
    if click_sel == "HELL"      then num = 12 end
    if click_sel == "NWP"       then num = 13 end
    if ( ( ga_win_mouse_wheel_down(wid) or ga_win_key_pressed(wid, "LEFT")  ) and num > 1 ) then num = num - 1 end
    if ( ( ga_win_mouse_wheel_up(wid)   or ga_win_key_pressed(wid, "RIGHT") ) and num < p.num_pages ) then num = num + 1 end
    ga_set_i("temp.xar.stats5.win_num", num)

    --Setting the tab colors correctly.
    color_green = std.vec(0.0, 1.0, 0.0)
    color_cyan = std.vec(0.0, 1.0, 1.0)
    for i = 1,p.num_pages do
        local color = color_cyan
        if( i == num ) then color = color_green end
        ga_win_widget_button_set_color(wid, 100+i, color)
    end
end
