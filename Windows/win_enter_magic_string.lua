function p.__render(wid)
    ga_win_set_background(wid, std.vec(0.0, 0.0, 0.0), 1.0)
    
    ga_win_set_char_size(wid, 0.02, 0.04)
    ga_win_txt_center(wid, 0.8, "Enter space seperated numbers to optional affect RNG")
    ga_win_txt_center(wid, 0.1, "Go Back (ESC)")
end

function p.__on_start(wid)
    ga_win_widget_text_input_start(wid, 0.3, 0.01, 0.04)
    --Only allowing certain chars,
    --that way it is not confusing.
    ga_win_widget_text_input_forbid_all_chars(wid)
    local a_num = string.byte("0")
    local z_num = string.byte("9")
    for char_num = a_num,z_num do
        local char_str = string.char(char_num)
        ga_win_widget_text_input_set_char_allowed(wid, char_str, true)
    end
    ga_win_widget_text_input_set_char_allowed(wid, " ", true)
    ga_win_widget_text_input_set_enable_enter(wid,false)
end

function p.__process_input(wid)
    if( ga_win_key_pressed(wid, "ESC") ) then
        ga_play_sound("menu_back")
        ga_window_pop()
    end

    local entered_str = ga_win_widget_text_input_process_input(wid)
    if( entered_str == "" ) then
        --nothing
    else
        if(entered_str:match("^[0-9 ]*$") ~= nil) then
            ga_set_s("community_xar_fbw.ryf.magic_string", entered_str)
            ga_window_pop()
            ga_window_push("win_random_ying_flower")
        else
            ga_play_sound("error")
        end
    end
end
