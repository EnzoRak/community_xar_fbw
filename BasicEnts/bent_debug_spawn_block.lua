function p.__get_can_use(level, bp)
    return true
end

function p.__get_use_msg(level, bp)
    return "Spawn a Block"
end

function p.__on_use(level, bp)
    ga_play_sound_menu("use")
    ga_window_push("win_debug_spawn_block")
end
