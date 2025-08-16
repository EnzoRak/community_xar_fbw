function p.__on_start(wid)
    local go_back_button_y = 0.02
    local w = 0.02
    local h = 0.04
    local go_back_msg = "Return To Game (ESC)"
    ga_win_widget_go_back_button_start(
        wid, go_back_button_y, w, h, go_back_msg)

    game_win_top_bar.create_stats_buttons(wid, 5)
end

function p.__render(wid)
    ga_win_set_background(wid, std.vec(0.0, 0.0, 0.0), 0.95)
    
    ga_win_set_char_size(wid, 0.02, 0.04)
    ga_win_txt_center(wid, 0.88, "DIFFICULTY AND TIME")

    ga_win_set_char_size(wid, 0.015, 0.03)
    local player_name = ga_get_sys_s("game.player.name")
    local player_name_str = "PLAYER NAME: " .. player_name
    ga_win_txt_center(wid, 0.81, player_name_str)

    local diff_num = game_difficulty.num()
    -- local cur_diff = game_difficulty.num_to_human_readable(diff_num)
    local cur_diff_str = "CURRENT DIFFICULTY: " .. game_difficulty.human_readable()
    ga_win_txt(wid, 0.3, 0.71, cur_diff_str)
    local icon_name = "INVALID"
    if( diff_num < 0 ) then icon_name = "icon_easy_" .. tostring(-diff_num) end
    if( diff_num == 0 ) then icon_name = "" end
    if( diff_num > 0 ) then icon_name = "icon_hard_" .. tostring(diff_num) end
    if( icon_name ~= "" ) then
        ga_win_quad(wid, 0.25, 0.69, 0.29, 0.76, icon_name)
    end

    local e_diff_num = game_difficulty.easiest_num()
    local e_diff = game_difficulty.num_to_human_readable(e_diff_num)
    local e_diff_str = "EASIEST USED DIFFICULTY: " .. e_diff
    ga_win_txt(wid, 0.3, 0.61, e_diff_str)
    local icon_name = "INVALID"
    if( e_diff_num < 0 ) then icon_name = "icon_easy_" .. tostring(-e_diff_num) .. "_once" end
    if( e_diff_num == 0 ) then icon_name = "icon_normal_once" end
    if( e_diff_num > 0 ) then icon_name = "icon_hard_" .. tostring(e_diff_num) .. "_once" end
    if( icon_name ~= "" ) then
        ga_win_quad(wid, 0.25, 0.59, 0.29, 0.66, icon_name)
    end

    ga_win_set_char_size(wid, 0.02, 0.04)
    play_time = ga_get_sys_f("game.time.play")
    play_time_str = game_time_helpers.time_str(play_time)
    ga_win_txt_center(wid, 0.37, "PLAY TIME: " .. play_time_str)

    game_time = ga_get_sys_f("game.time.total")
    game_time_str = game_time_helpers.time_str(game_time)
    ga_win_txt_center(wid, 0.30, "GAME TIME: " .. game_time_str)
end

function p.__process_input(wid)
    if ga_win_widget_go_back_button_process_input(wid) then
        ga_window_pop()
        return
    end

    game_win_top_bar.input(wid, 5)
end
