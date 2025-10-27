function p.__get_mesh()
    return "trophy"
end

function p.payload(level, bp)
    local name = ga_bent_get_param_s(level, bp)
    local str = ga_get_s("community_xar_fbw.trophies")
    local pos = win_cxar_trophies.map[name]
    if pos == nil then
        return
    end
    local genesis = game_genesis.enabled()
    local trophy_name = "CXar"
    if game_trophy.starts_with_vowell(trophy_name) then
        ga_hud_msg("You Got An " .. trophy_name .. " Trophy", 5.0)
    else
        ga_hud_msg("You Got A " .. trophy_name .. " Trophy", 5.0)
    end
    if str:sub(pos,pos) == "1" then
        --Already has this trophy.
        ga_play_sound("pickup_gold")
        --
        game_msg.add("You already have this trophy: 10 gold")
        --
        max_gold = ga_get_i("xar.player.gold.max")
        old_gold = ga_get_i("xar.player.gold.amount")
        new_gold = old_gold + 10
        if( new_gold > max_gold ) then new_gold = max_gold end
        ga_set_i("xar.player.gold.amount", new_gold)
    else
        --Does not have this trophy.
        ga_play_sound("fanfare_short")
        --
        if genesis then
            game_msg.add("New trophy bonus: 200 gold")
        else
            game_msg.add("New trophy bonus: 200 gold + 4 health upgrades") 
        end
        --
        game_trophy.give_gold(200)
        --
        if not genesis then
            std.set_bydelta_i("xar.player.health.level", 2)
            std.set_bydelta_i("xar.player.health.regen_level", 2)

            game_msg.add("New trophy bonus: 200% health + armor")
            game_trophy.get_200_health_armor()
        end
        ga_set_s("community_xar_fbw.trophies", str:sub(1, pos-1) .. "1" .. str:sub(pos+1))
    end
    game_bent.remove_perm(level, bp)
end

function p.__get_touch_dist()
    local dist = ga_get_f("xar.normal_bent_touch_dist")
    return dist
end

function p.__get_can_use(level, bp)
    return true
end

function p.__get_use_msg(level, bp)
    return "Trophy"
end

function p.__on_use(level, bp)
    p.payload(level, bp)
end

function p.__on_touch(level, bp)
    p.payload(level, bp)
end

function p.on_telekinesis(level, bp)
    p.payload(level, bp)
end
