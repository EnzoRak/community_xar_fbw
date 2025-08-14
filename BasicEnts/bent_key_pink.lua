function p.payload(level, bp)
    local num_sec = ga_bent_get_param_i(level, bp)
    ga_set_b("community_xar_fbw.pink_ascended", true)
    ga_play_sound("pickup_powerup")     --bing bing bing
    ga_play_sound("pickup_powerup")     --bing bing bing
    ga_play_sound("pickup_powerup")     --bing bing bing
    game_bent.remove_temp(level, bp, 1)  
end

function p.__get_touch_dist()
    local dist = ga_get_f("xar.normal_bent_touch_dist")
    return dist
end

function p.__on_touch(level, bp)
    p.payload(level, bp)
end

function p.__get_use_msg(level, bp)
    return "^xFF00FFThe Pink Key^!"
end

function p.__on_use(level, bp)
    p.payload(level, bp)
end

function p.on_telekinesis(level, bp)
    p.payload(level, bp)
end
