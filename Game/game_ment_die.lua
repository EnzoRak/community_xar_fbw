--Should be called within the die function of a ment.
function p.main(inst_id)
    local mod_name = ga_ment_get_type(inst_id)
    local func_name = "on_die"
    if( _G[mod_name] and
        _G[mod_name][func_name] )
    then
        --It has a custom die function.
        _G[mod_name][func_name](inst_id)
    else
        --Using the default die function.
        p.default(inst_id)
    end
end

--Should be called within the die function of a ment.
function p.default(inst_id)
    local ment_type = ga_ment_get_type(inst_id)
    
    if ga_ment_var_exists(inst_id, "identity_str") and win_fractalbase.map[ga_ment_get_static_s(ment_type, "identity_str")] then
        local discovered = ga_get_s("community_xar_fbw.fractalbase.enemies_discovered")
        local idx = win_fractalbase.map[ga_ment_get_static_s(ment_type, "identity_str")]
        if discovered:sub(idx,idx) ~= "3" then
            ga_set_s("community_xar_fbw.fractalbase.enemies_discovered", discovered:sub(1,idx-1) .. "3" .. discovered:sub(idx+1))
        end
    end

    --Adding experience points.
    game_xp.ment_add(inst_id)

    --Dropping a bent or drop box.
    if  ga_ment_type_var_exists(ment_type, "die_drop_bent")
    then
        local drop_bent = ga_ment_get_static_s(ment_type, "die_drop_bent")
        --
        local drop_bent_param_i = 0
        if( ga_ment_type_var_exists(ment_type, "die_drop_bent_param_i") ) then
            drop_bent_param_i = ga_ment_get_static_i(ment_type, "die_drop_bent_param_i")
        end
        --
        local drop_bent_param_s = ""
        if( ga_ment_type_var_exists(ment_type, "die_drop_bent_param_s") ) then
            drop_bent_param_s = ga_ment_get_static_s(ment_type, "die_drop_bent_param_s")
        end
        --
        local drop_extra_levels = 0
        if( ga_ment_type_var_exists(ment_type, "die_drop_extra_levels") ) then
            drop_extra_levels = ga_ment_get_static_i(ment_type, "die_drop_extra_levels")
        end
        --
        local drop_box_allow = false
        if  ga_ment_type_var_exists(ment_type, "die_drop_box_allow") then
            drop_box_allow = ga_ment_get_static_b(ment_type, "die_drop_box_allow")
        end
        --
        local drop_box_txt = "NOT SET"
        if  ga_ment_type_var_exists(ment_type, "die_drop_box_txt") then
            drop_box_txt = ga_ment_get_static_s(ment_type, "die_drop_box_txt")
        end
        -- --
        local start_level = ga_ment_get_i(inst_id, "__start_level")
        local sllp = ga_ment_get_sllp(inst_id)

        ga_print("game_ment_die.default: drop_bent_param_i = " .. tostring(drop_bent_param_i))
        ga_print("game_ment_die.default: drop_bent_param_s = " .. tostring(drop_bent_param_s))

        game_ment_drop.drop_general(
            start_level, sllp,
            drop_bent,
            drop_bent_param_i,
            drop_bent_param_s,
            drop_extra_levels,
            drop_box_allow,
            drop_box_txt)
    end

    local death_anim = ga_ment_get_s(inst_id, "__death_anim")

    --Blood explosion.
    --(Not doing if in dark-hole type death).
    if( death_anim == "" ) then
        game_ment_blood.die_explosion(inst_id)
    end

    --Sound.
    local death_sound = "monster_death"
    if( ga_ment_type_var_exists(ment_type, "sound_death") and
        death_anim == "" )
    then
        death_sound = ga_ment_get_static_s(ment_type, "sound_death")
    end
    game_play_monster_die_sound.play(death_sound)
end
