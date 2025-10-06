function p.__get_can_use(level, bp)
    return true
end

function p.__get_use_msg(level, bp)
    return "Input code"
end

function p.__on_use(level, bp)
    ga_play_sound_menu("use")
    ga_window_push("win_code")
    win_code.code = ga_bent_get_param_s(level,bp)
    win_code.level = level
end