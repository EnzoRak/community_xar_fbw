function p.__on_start(wid)
    local go_back_button_y = 0.02
    local w = 0.02
    local h = 0.04
    local go_back_msg = "Return To Game (ESC)"
    ga_win_widget_go_back_button_start(
        wid, go_back_button_y, w, h, go_back_msg)

    game_win_top_bar.create_stats_buttons(wid, 4)
end

function p.__render(wid)
    ga_win_set_background(wid, std.vec(0.0, 0.0, 0.0), 0.95)

    ga_win_set_front_color_default(wid)
    ga_win_set_char_size(wid, 0.02, 0.04)
    ga_win_txt_center(wid, 0.88, "EXPERIENCE AND GOLD")

    ga_win_set_char_size(wid, 0.015, 0.03)
    local gold = ga_get_i("xar.player.gold.amount")
    ga_win_txt_center(wid, 0.80, "GOLD = " .. game_str.add_commas(gold))

    local xp_level = ga_get_i("xar.experience.level")
    ga_win_txt_center(wid, 0.76, "CURRENT PLAYER LEVEL = ^x00ff00" .. game_str.add_commas(xp_level))

    if xp_level < 500 then
        local to_next_level = ga_get_i("xar.experience.to_next_level")
        ga_win_txt_center(wid, 0.72, "XP TO NEXT LEVEL = " .. game_str.add_commas(to_next_level))
    end

    local total = ga_get_i("xar.experience.total")
    ga_win_txt_center(wid, 0.68, "TOTAL XP = " .. game_str.add_commas(total))

    --
    local player_level = xp_level
    -- ga_print("player experience level = " .. tostring(player_level))
    local last_milestone_level = player_level - (player_level % 10)
    -- ga_print("last_milestone_level = " .. tostring(last_milestone_level))
    local last_claimed_milestone = ga_get_i("xar.experience.last_claimed_milestone_level")
    -- ga_print("last_claimed_milestone = " .. tostring(last_claimed_milestone))
    if( last_claimed_milestone < last_milestone_level ) then
        --Can claim a milestone.
        ga_win_set_front_color(wid, std.vec(0.0,1.0,0.0))
        ga_win_txt_center(wid, 0.60, "PRESS ENTER TO CLAIM THE FOLLOWING BONUS:")
        str = "Level " .. tostring(last_claimed_milestone + 10) .. ": "
            .. game_xp_milestones.milestone_str(last_claimed_milestone + 10)
        -- ga_win_set_char_size(wid, 0.01, 0.02)
        ga_win_set_char_size(wid, 0.009, 0.018)
        ga_win_txt_center(wid, 0.56, str)
    end
    --
    local text_color = ga_get_sys_v("menu.text_color")
    ga_win_set_front_color(wid, text_color)
    ga_win_set_char_size(wid, 0.015, 0.03)
    local max_level = 500
    if( xp_level < max_level or
        last_claimed_milestone < max_level )
    then
        ga_win_txt_center(wid, 0.44, "NEXT MILESTONE UPGRADES:")
        for i = 1,7 do
            local min_y = 0.44 - 0.04*i
            local level = last_claimed_milestone + 10*i
            local milestone_str = game_xp_milestones.milestone_str(level)
            if milestone_str ~= "" then
                str = "Level " .. tostring(level) .. ": "
                    .. milestone_str
                ga_win_set_char_size(wid, 0.009, 0.018)
                ga_win_txt_center(wid, min_y, str)
            end
        end
    else
        ga_win_set_front_color(wid, std.vec(0.0, 1.0, 0.0))
        ga_win_txt_center(wid, 0.44, "YOU ARE AT YOUR MAX PLAYER LEVEL")
        ga_win_txt_center(wid, 0.40, "GOOD JOB!!!")
        ga_win_set_front_color(wid, text_color)
    end
end

function p.__process_input(wid)
    if ga_win_widget_go_back_button_process_input(wid) then
        ga_window_pop()
        return
    end

    game_win_top_bar.input(wid, 4)

    if ga_win_key_pressed(wid, "ENTER") then
        local player_level = ga_get_i("xar.experience.level")
        local last_milestone_level = player_level - (player_level % 10)
        local last_claimed_milestone = ga_get_i("xar.experience.last_claimed_milestone_level")
        ga_print("last_mileston_level = " .. tostring(last_milestone_level))
        ga_print("last_claimed_mileston = " .. tostring(last_claimed_milestone))
        if( last_claimed_milestone < last_milestone_level ) then
            worked = game_xp_milestones.claim_milestone(last_claimed_milestone+10)
            if( worked ) then
                last_claimed_milestone = last_claimed_milestone + 10
                ga_set_i("xar.experience.last_claimed_milestone_level", last_claimed_milestone)
            end
            --more!!!
        end
    end
end
