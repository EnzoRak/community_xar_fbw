function p.__on_start(wid)
    ga_win_widget_mutable_text_box_start(wid, 0.4, 0.6, 0.45, 0.55, 0.01, 0.02, std.vec(0.5,0.5,0), "")
end
function p.__on_end(wid)
    ga_win_widget_mutable_text_box_end(wid)
end
function p.__render(wid)
    ga_win_set_background_default(wid)

    ga_win_set_char_size(wid, 0.02, 0.04)
    ga_win_txt_center(wid, 0.06, "Go Back (ESC or F)")
end

function p.__process_input(wid)
    if( ga_win_key_pressed(wid, "ESC") or
        ga_win_key_pressed(wid, "F") or
        ga_win_mouse_pressed(wid, true) )
    then
        ga_play_sound("menu_back")
        ga_window_pop()
    end

    if game_key.pressed_or_spammed(wid, "ENTER") then
        --Removing the door.
        game_debug.place_a_block(ga_win_widget_mutable_text_box_get_text(wid))
        ga_window_pop()
    end
end
