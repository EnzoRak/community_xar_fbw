function p.has_effect(level, bp)
    local max_value = 5*ga_get_i("xar.player.health.max")
    local old_value = ga_get_i("xar.player.health.amount")
    return ( old_value < max_value );
end

function p.payload(level, bp)
    local one_hundred_p = ga_get_i("xar.player.health.max")
    local max_value = 5*one_hundred_p
    local old_value = ga_get_i("xar.player.health.amount")
    if ( max_value > old_value ) then
        ga_set_i("xar.player.health.amount", max_value)
        ga_play_sound("pickup_health_mega")
        game_bent.remove_temp(level, bp, 60 * 60)
        game_msg.add("You got max health!")
    end
end

function p.__get_touch_dist()
    return ga_get_f("xar.normal_bent_touch_dist")
end

function p.__on_touch(level, bp)
    p.payload(level, bp)
end

function p.__get_can_use(level, bp)
    return true
end

function p.__get_use_msg(level, bp)
    local core = "To max health (500%)"
    if( p.has_effect(level, bp) ) then return core
    else return "^xff0000" .. core end
end

function p.__on_use(level, bp)
    p.payload(level, bp)
end

function p.on_telekinesis(level, bp)
    p.__on_touch(level, bp)
end
