function p.__on_start(wid)
    p.make_list(wid)

    local go_back_button_y = 0.06
    local w = 0.02
    local h = 0.04
    local go_back_msg = "Return To Game (ESC or F)"
    ga_win_widget_go_back_button_start(
        wid, go_back_button_y, w, h, go_back_msg)
end

--Helper function.
function p.make_list(wid)

    
    local c1 = game_color_str.color_vec_to_esc(ga_get_sys_v("menu.text_color"))
    local c2 = game_color_str.color_vec_to_esc({x=1.0, y=1.0, z=0.0})
    local c3 = game_color_str.color_vec_to_esc({x=0.0, y=1.0, z=0.0})

    local num2 = ga_get_i("temp.xar.ent.sell_station.gun2")
    local ammo2 = ga_get_i("xar.player.gun2.ammo")
    local color2_vec = ga_get_v("temp.xar.ent.sell_station.gun2_color")
    local color2_str = game_color_str.color_vec_to_esc(color2_vec)
    --
    local num3 = ga_get_i("temp.xar.ent.sell_station.gun3")
    local ammo3 = ga_get_i("xar.player.gun3.ammo")
    local color3_vec = ga_get_v("temp.xar.ent.sell_station.gun3_color")
    local color3_str = game_color_str.color_vec_to_esc(color3_vec)
    --
    local min_y = 0.15
    local max_y = 0.8
    local char_w = 0.015
    local char_h = 0.03
    local col = {x=0.0, y=0.5, z=0.5}
    local options = {
        color2_str .. "Press 1: 1 gold for each " .. num_health .. "% health above 200%",
        color2_str .. "Press 2: 10 gold for each " .. num2 .. " cannon ammo (".. ammo2 .. " left)"}
    ga_win_widget_small_list_start(
        wid, min_y, max_y, char_w, char_h,
        col, options)
    ga_win_widget_small_list_set_use_nums(wid, false)
end

function p.__render(wid)
    ga_win_set_background_default(wid)
    ga_win_set_char_size(wid, 0.03, 0.06)

    local gold = ga_get_i("xar.player.gold.amount")
    local gold_str = game_str.add_commas(gold)
    ga_win_txt_center(wid, 0.85, "GOLD IN INVENTORY = " .. gold_str)

    ga_win_set_char_size(wid, 0.01, 0.02)
    ga_win_txt(wid, 0.0, 0.97, "LSHIFT + ENTER TO")
    ga_win_txt(wid, 0.0, 0.94, "SELL ALL OF A CATEGORY")

    local color = ga_get_sys_v("menu.text_color")
    ga_win_set_front_color(wid, color)
end

--Returns true iff sold something.
function p.sell(wid, str, sell_all)
    if sell_all then
        --Doing it over and over until there is no effect.
        local sold_something = false 
        while true do
            local gold_before = ga_get_i("xar.player.gold.amount")
            local sold_something_now = p.sell_helper(wid, str)
            if( sold_something_now ) then sold_something = true end
            local gold_after = ga_get_i("xar.player.gold.amount")
            if( gold_after == gold_before ) then
                return sold_something
            end
        end
    else
        --Doing it once.
        return p.sell_helper(wid, str)
    end
end

--Returns true iff did not run out of money.
function p.sell_helper(wid, str)
    local gold = ga_get_i("xar.player.gold.amount")
    local starting_gold = gold
    local sold = false

    --Todo: rewrite this function.

    if str == "2" then
        local num = ga_get_i("temp.xar.ent.sell_station.gun2")
        local ammo = ga_get_i("xar.player.gun2.ammo")
        if (ammo >= num) then
            std.set_bydelta_i("xar.player.gun2.ammo", -num)
            gold = gold + 10
            sold = true
        end
    end
    if str == "3" then
        local num = ga_get_i("temp.xar.ent.sell_station.gun3")
        local ammo = ga_get_i("xar.player.gun3.ammo")
        if (ammo >= num) then
            std.set_bydelta_i("xar.player.gun3.ammo", -num)
            gold = gold + 10
            sold = true
        end
    end

    if (gold ~= starting_gold) then
        ga_set_i("xar.player.gold.amount", gold)
    end

    if( sold ) then
        p.make_list(wid)
    end

    return sold
end

function p.__process_input(wid)
    if( ga_win_widget_go_back_button_process_input(wid) or
        ga_win_key_pressed(wid, "F") )
    then
        ga_play_sound("menu_back")
        ga_window_pop()
        return
    end

    local starting_gold = ga_get_i("xar.player.gold.amount")
    local selection = ga_win_widget_small_list_process_input(wid) --Not getting selection yet.
    local sel_name = ""

    if( selection >= 0 ) then
        sel_name = ga_win_widget_small_list_get_entry(wid, selection)
    end
    if game_key.pressed_or_spammed(wid, "ENTER") then
        selection = ga_win_widget_small_list_get_selected(wid)
        sel_name = ga_win_widget_small_list_get_entry(wid, selection)
    end
    --
    local sel_str = ""
    if string.match(sel_name, "Press 2") or game_key.pressed_or_spammed(wid, "2") then 
        p.sell(wid, "2", sell_all)
        ga_win_widget_small_list_set_selected(wid, 1) --Fragile!!!
    end
    if string.match(sel_name, "Press 3") or game_key.pressed_or_spammed(wid, "3") then 
        p.sell(wid, "3", sell_all)
        ga_win_widget_small_list_set_selected(wid, 2) --Fragile!!!
    end

    local ending_gold = ga_get_i("xar.player.gold.amount")

    --Playing a sound based on how much gold way gained.
    --[[
    local gold_diff = ending_gold - starting_gold
    if gold_diff >= 1000 then
        ga_play_sound("pickup_gold_large")
    elseif gold_diff >= 100 then
        ga_play_sound("pickup_gold_medium")
    elseif gold_diff > 0 then
        ga_play_sound("pickup_gold_small")
    end
    ]]
end
