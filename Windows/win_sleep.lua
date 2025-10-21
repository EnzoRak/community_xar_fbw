--Returns whether or not succeded
function p.payload_one_minute()
    local cost = 5
    if( ga_get_i("xar.player.gold.amount") < cost ) then return false end
    std.set_bydelta_i("xar.player.gold.amount", -cost)
    local old_game_time = ga_get_sys_f("game.time.total")
    local new_game_time = old_game_time + 60.0
    ga_set_sys_f("game.time.total", new_game_time)

    return true
end

function p.payload(sleep_seconds)
    if(ga_get_viewer_chunk_bt() == "XAR_RICHMOND_BEDROOM") then
        --ga_console_print("we are in a richmond bedroom")
    end
    local slept = false
    local sleep_mins = sleep_seconds / 60
    for i = 1,sleep_mins do
        local worked = p.payload_one_minute()
        if worked then
            slept = true
        else
            ga_play_sound("error")
            return
        end
    end
    if slept then
        ga_play_sound_menu("snore")
    end
end

function p.__on_start(wid)
    local min_y = 0.20
    local max_y = 0.70
    local char_w = 0.02
    local char_h = 0.04
    local col = {x=0.0, y=0.5, z=0.5}
    local options = {
        "SLEEP FOR 1 MIN",
        "SLEEP FOR 2 MIN",
        "SLEEP FOR 3 MIN",
        "SLEEP FOR 5 MIN",
        "SLEEP FOR 10 MIN",
        "SLEEP FOR 20 MIN",
        "SLEEP FOR 30 MIN",
        "SLEEP FOR 60 MIN" }
    ga_win_widget_small_list_start(
        wid, min_y, max_y, char_w, char_h,
        col, options)

    local go_back_button_y = 0.06
    local w = 0.02
    local h = 0.04
    local go_back_msg = "Return To Game (ESC or F)"
    ga_win_widget_go_back_button_start(
        wid, go_back_button_y, w, h, go_back_msg)
end

function p.__on_end(wid)
    --Nothing to do.
end

function p.__render(wid)
    ga_win_set_background(wid, std.vec(0.0, 0.0, 0.0), 0.95)

    ga_win_set_char_size(wid, 0.04, 0.08)
    ga_win_txt_center(wid, 0.85, "SLEEP")

    ga_win_set_char_size(wid, 0.02, 0.04)
    ga_win_txt_center(wid, 0.80, "EACH MINUTE YOU SLEEP COSTS 5 GOLD")
end

function p.__process_input(wid)
    if( ga_win_widget_go_back_button_process_input(wid) or
        ga_win_key_pressed(wid, "F") )
    then
        ga_play_sound("menu_back")
        ga_window_pop()
        return
    end
    
    local selection = ga_win_widget_small_list_process_input(wid)
    local sleep_seconds = 0.0
    if( selection == 0 ) then sleep_seconds = 1 * 60.0 end
    if( selection == 1 ) then sleep_seconds = 2 * 60.0 end
    if( selection == 2 ) then sleep_seconds = 3 * 60.0 end
    if( selection == 3 ) then sleep_seconds = 5 * 60.0 end
    if( selection == 4 ) then sleep_seconds = 10 * 60.0 end
    if( selection == 5 ) then sleep_seconds = 20 * 60.0 end
    if( selection == 6 ) then sleep_seconds = 30 * 60.0 end
    if( selection == 7 ) then sleep_seconds = 60 * 60.0 end

    if( sleep_seconds > 0.0 ) then
        p.payload(sleep_seconds)
    end
end
