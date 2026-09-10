local main_button_handle = 1

function p.__start(wid)
    local price = ga_get_i("temp.xar.ent.buy_dark_hole.price")
    local txt = "Press ENTER: recharge dark holes for " .. price .. " gold"
    ga_win_widget_button_start(wid, main_button_handle, 0.0, 0.5, 0.02, 0.04, txt)
    ga_win_widget_button_center_x_at(wid, main_button_handle, 0.5)

    local go_back_button_y = 0.06
    local w = 0.02
    local h = 0.04
    local go_back_msg = "Return To Game (ESC or F)"
    ga_win_widget_go_back_button_start(
        wid, go_back_button_y, w, h, go_back_msg)
end

function p.__render(wid)
    ga_win_set_background_default(wid)

    -- local price = ga_get_i("temp.xar.ent.buy_dark_hole.price")
    -- ga_win_txt_center(wid, 0.5,
    --     "Press ENTER: recharge dark holes for " .. price .. " gold")

    local gold = ga_get_i("xar.player.gold.amount")
    local gold_str = game_str.add_commas(gold)
    ga_win_txt_center(wid, 0.9, "GOLD IN INVENTORY = " .. gold_str)

end

function p.__process_input(wid)
    if( ga_win_widget_go_back_button_process_input(wid) or
        ga_win_key_pressed(wid, "F") )
    then
        ga_play_sound("menu_back")
        ga_window_pop()
    end

    local which_button = ga_win_widget_button_process_input(wid)

    if( which_button == main_button_handle or 
        game_key.pressed_or_spammed(wid, "ENTER") )
    then
        local cost = ga_get_i("temp.xar.ent.buy_dark_hole.price")
        local gold = ga_get_i("xar.player.gold.amount")
        local ammo_max = game_wep_modes.get_ammo_max(0)
        local ammo = ga_get_i("xar.player.gun0.ammo")
		if (gold >= cost and
            ammo < ammo_max)
        then
			local new_gold = gold - cost
			ga_set_i("xar.player.gold.amount", new_gold)
			
			for buyCount = ammo,ammo_max do
			
				std.set_bydelta_i("xar.player.gun0.ammo", 1)
				
			end
			
			ga_play_sound("pickup_ammo")
		end
    end
end
