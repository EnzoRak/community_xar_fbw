function p.__render(wid)
    ga_win_set_background(wid, std.vec(0.0, 0.0, 0.0), 1.0)
    
    ga_win_set_char_size(wid, 0.02, 0.04)
    ga_win_txt_center(wid, 0.8, "Attempting to exit the game while in the")
    ga_win_txt_center(wid, 0.74, " middle of this counts as cheating, for real.  ")

end

function p.__on_start(wid)
    p.make_list(wid)

    local go_back_button_y = 0.06
    local w = 0.02
    local h = 0.04
    local go_back_msg = "Return To Game (ESC or F)"
    ga_win_widget_go_back_button_start(
        wid, go_back_button_y, w, h, go_back_msg)
end

--Helper function. (Refresher)
function p.make_list(wid)
    --
    local randyingf = "Enable"
    if(ga_get_b("community_xar_fbw.ryf.enabled") == true) then
        randyingf = "Disable"
    end
    local min_y = 0.15
    local max_y = 0.6
    local char_w = 0.015
    local char_h = 0.03
    local col = {x=0.0, y=0.5, z=0.5}
    local d = ga_get_b("community_xar_fbw.ryf.exclude_qsg")
    local dd = ""
    if d then
        dd = "Include"
    else
        dd = "Exclude"
    end
    local options = 
    {
        "" .. randyingf .. " Random Ying Flower",
        "Set Magic String (Affects RNG) (Current: '"..ga_get_s("community_xar_fbw.ryf.magic_string").."')",
        dd .. " Quicksand Grass",
        "Start Teleportation Sequence"
    }
    ga_win_widget_small_list_start(
        wid, min_y, max_y, char_w, char_h,
        col, options)
    ga_win_widget_small_list_set_use_nums(wid, false)
    ga_win_widget_small_list_mute_sound(wid, "select")
end


function p.__process_input(wid)
    if( ga_win_widget_go_back_button_process_input(wid) or ga_win_key_pressed(wid, "F")) then
        ga_play_sound("menu_back")
        ga_window_pop_all()
        return
    end

    
    local selection = ga_win_widget_small_list_process_input(wid) --Not getting selection yet.
    local sel_name = ""
    if( selection >= 0 ) then
        sel_name = ga_win_widget_small_list_get_entry(wid, selection)
    end
    if game_key.pressed_or_spammed(wid, "ENTER") then
        selection = ga_win_widget_small_list_get_selected(wid)
    end
    local sel_name = ga_win_widget_small_list_get_entry(wid, selection)
    if(sel_name:find("Flower")) then
        ga_set_b("community_xar_fbw.ryf.enabled", not ga_get_b("community_xar_fbw.ryf.enabled"))
        p.make_list(wid)
        ga_win_widget_small_list_set_selected(wid, 0) --Fragile!!!
    elseif(sel_name:find("Magic String")) then
        ga_window_pop()
        ga_window_push("win_enter_magic_string")
        p.make_list(wid)
        ga_win_widget_small_list_set_selected(wid, 1) --Fragile!!!
    elseif(sel_name:find("Quicksand Grass")) then
        ga_set_b("community_xar_fbw.ryf.exclude_qsg", not ga_get_b("community_xar_fbw.ryf.exclude_qsg"))
        p.make_list(wid)
        ga_win_widget_small_list_set_selected(wid, 2) --Fragile!!!
    elseif(sel_name:find("Teleportation")) then
        if(ga_get_b("community_xar_fbw.ryf.enabled") == false) then
            ga_play_sound("error")
            ---return
        else
            ga_window_pop()
            game_tele_random_ying_flower.main()
        end
        p.make_list(wid)
        ga_win_widget_small_list_set_selected(wid, 3) --Fragile!!!
    end
end
