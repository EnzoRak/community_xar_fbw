function p.has_effect(level, bp)
    local max_value = 2*ga_get_i("xar.player.health.max")
    local old_value = ga_get_i("xar.player.health.amount")
    return ( old_value < max_value );
end

function p.payload(level, bp)
    local max_value = 2*ga_get_i("xar.player.health.max")
    local old_value = ga_get_i("xar.player.health.amount")
    local new_value = old_value + math.floor(max_value / 10) --How to cast?
    if( new_value > max_value ) then new_value = max_value end
    if ( new_value > old_value ) then
        ga_set_i("xar.player.health.amount", new_value)
        ga_play_sound("pickup_health_10p")
        game_bent.remove_temp(level, bp, 60 * 60)
        game_msg.add("You got an extra 20% health")
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
    local core = "Extra 20% health"
    if( p.has_effect(level, bp) ) then return core
    else return "^xff0000" .. core end
end

function p.__on_use(level, bp)
    p.payload(level, bp)
end

function p.on_telekinesis(level, bp)
    p.__on_touch(level, bp)
end
