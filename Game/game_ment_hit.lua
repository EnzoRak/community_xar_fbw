function p.process_hit_and_got_hit(args)
    -- ga_print("here inside process_hit_and_got_hit")
    local mod_name = ga_ment_get_type(args.source_inst_id)
    local func_name = "xar_process_hit"
    if( _G[mod_name] and
        _G[mod_name][func_name] )
    then
        return _G[mod_name][func_name](args)
    else
        return p.default_xar_process_hit(args)
    end
end

--This is called by p.process_hit_and_got_hit
--iff source_type_name.xar_process_hit does not exist.
function p.default_xar_process_hit(args)
    -- ga_print("in the default xar_process_hit function")
    local exceptions = {}
    return p.process_got_hit(args, exceptions)
end

--This should be called by the default_xar_process_hit
--function, and also my each custom xar_process_hit function.
--The caller should create the exceptions structure,
--adding all needed exceptions to it to pass along the way.
function p.process_got_hit(args, exceptions)
    local target_type_name = ga_ment_get_type(args.target_inst_id)
    -- ga_print("game_ment_hit.process_got_hit")
    -- ga_print("  target_type_name = " .. target_type_name)
    --
    local mod_name = target_type_name
    local func_name = "xar_process_got_hit"
    if( _G[mod_name] and
        _G[mod_name][func_name] )
    then
        return _G[mod_name][func_name](args, exceptions)
    else
        return p.default_xar_process_got_hit(args, exceptions)
    end
end

--This is called by p.process_got_hit
--iff target_type_name.xar_process_got_hit does not exist.
function p.default_xar_process_got_hit(args, exceptions)
    -- ga_print("in the default xar_process_got_hit function")
    return p.process_final(args, exceptions)
end

function p.process_final(args, exceptions)
    local ret = {}
    ret.damage_dealt = 0
    ret.killed = false
    ret.terminal_hit = true

    local source_type = ga_ment_get_type(args.source_inst_id)
    local target_type = ga_ment_get_type(args.target_inst_id)

    --Identity string.
    --When the hit results in the target ment being displayed
    --in the identity bar part of the hud.
    if( ga_ment_static_b_exists_and_true(source_type, "identifies") and
       ga_ment_type_var_exists(target_type, "identity_str") and
       ga_ment_get_static_s(target_type, "identity_str") ~= "" )
    then
        game_ment_identify.maybe(args.target_inst_id)
    end

    local team_id_1 = ga_ment_get_static_i(source_type, "__team_id_source")
    local team_id_2 = ga_ment_get_static_i(target_type, "__team_id_target")
    local wrong_teams = false
    if( team_id_1 == 0 ) then wrong_teams = true end
    if( team_id_2 == 0 ) then wrong_teams = true end
    if( team_id_1 == team_id_2 ) then wrong_teams = true end
    if( wrong_teams ) then
        ret.terminal_hit = false
        return ret
    end

    local compute_damage = false
    if( exceptions.compute_damage == true and
        ga_ment_type_var_exists(source_type, "damage") ) then
        compute_damage = true
    end
    if( game_ment_health.get_ment_has_health(args.target_inst_id) and
        game_ment_health.get_ment_health(args.target_inst_id) and
        ga_ment_type_var_exists(source_type, "damage") and
        exceptions.no_damage ~= true )
    then
        compute_damage = true
    end

    local damage = 0
    if( compute_damage and
        ga_ment_type_var_exists(source_type, "damage") )
    then
        local raw_damage = ga_ment_get_i(args.source_inst_id, "damage")
        local allow_powerus = true
        if( exceptions.no_damage_powerups == true ) then allow_powerus = false end
        damage = raw_damage --In case not set below!
        if( team_id_1 == 1 ) then
            --Damage from the player.
            local def = 0
            if ga_ment_type_var_exists(target_type, "defense") then
                def = ga_ment_get_f(args.target_inst_id, "defense")
            end
            damage = game_damage.calc_damage_from_player(raw_damage, allow_powerus, def)
        end
        if( team_id_2 == 1 ) then
            --Damage to the player.
           damage = game_damage.calc_damage_to_player(raw_damage, allow_powerus) 
        end
        --Damage in modifier.
        if( _G[target_type]["xar_get_level_mod_damage_in"] ) then
            local source_start_lev = ga_ment_get_i(args.source_inst_id, "__start_level")
            local target_start_lev = ga_ment_get_i(args.target_inst_id, "__start_level")
            local delta = source_start_lev - target_start_lev
            local modifier = _G[target_type]["xar_get_level_mod_damage_in"](delta)
            damage = math.floor(modifier * damage)
        end
        --Damage out modifier.
        if( _G[source_type]["xar_get_level_mod_damage_out"] ) then
            local source_start_lev = ga_ment_get_i(args.source_inst_id, "__start_level")
            local target_start_lev = ga_ment_get_i(args.target_inst_id, "__start_level")
            local delta = target_start_lev - source_start_lev
            local modifier = _G[source_type]["xar_get_level_mod_damage_out"](delta)
            local damage = math.floor(modifier * damage)
        end

        --Will be overridden if target's health is changed.
        ret.damage_dealt = damage
    end

    --Making it is a warning shot (because of hive).
    if ga_ment_b_exists_and_true(args.source_inst_id, "hive_attack") then
        game_ment_hive_attack.reg_attack()
        local hive_meter = game_ment_hive_attack.get_meter()
        local hive_delay = ga_ment_get_f(args.source_inst_id, "hive_attack_delay")
        if( -hive_meter < hive_delay ) then
            --Cannot damage because there is a hive delay.
            --Making it a warning shot.
            ret.damage_dealt = 0.0
            local vel = ga_ment_get_v(args.source_inst_id, "__vel")
            local neg_vel = std.vec_scale(vel, -1.0)
            local hive_color = std.vec(1.0, 1.0, 1.0)
            ga_hud_reg_damage_from_dir_color(damage, neg_vel, hive_color)
        end
    end

    --Making it is a warning shot (because of an individual delay).
    if ga_ment_b_exists_and_true(args.source_inst_id, "individual_delay_has") then
        if ga_ment_var_exists(args.source_inst_id, "parent_inst_id") then
            local parent_inst_id = ga_ment_get_i(args.source_inst_id, "parent_inst_id")
            local not_warning = game_ment_individual_shoot_delay.reg_hit(parent_inst_id)
            if not not_warning then
                --Cannot damage because there is an individual delay.
                --Making it a warning shot.
                ret.damage_dealt = 0.0
                local vel = ga_ment_get_v(args.source_inst_id, "__vel")
                local neg_vel = std.vec_scale(vel, -1.0)
                local hive_color = std.vec(1.0, 1.0, 1.0)
                ga_hud_reg_damage_from_dir_color(damage, neg_vel, hive_color)
            end
        end
    end

    --Changing the target's health:
    if( game_ment_health.get_ment_has_health(args.target_inst_id) and
        game_ment_health.get_ment_health(args.target_inst_id) > 0 and
        exceptions.no_damage ~= true )
    then
        --Registering the player from the player.
        game_dps_out.add(damage)

        local target_health_before = game_ment_health.get_ment_health(args.target_inst_id)
        --Should we apply more modifiers to the damage?

        local target_health_after = target_health_before - damage
        -- ga_print("target_health_after = " .. tostring(target_health_after))
        if( target_health_after < 0 ) then target_health_after = 0 end
        --
        ret.damage_dealt = target_health_before - target_health_after

        game_ment_health.set_ment_health(args.target_inst_id, target_health_after)

        --Killing monster if health at the end is not positive.
        if( target_health_after <= 0 ) then
            -- game_kill_count.add_frag()
            ret.killed = true
        end
    end

    --Hurt sound.
    if( ret.damage_dealt > 0 and
        ret.killed == false and
        exceptions.no_hurt_sound ~= true and
        ga_ment_type_var_exists(target_type, "sound_hurt" ) and
        ga_ment_type_var_exists(target_type, "last_sound_hurt") )
    then
        local game_time = ga_get_game_time()
        local last_sound_hurt = ga_ment_get_f(args.target_inst_id, "last_sound_hurt")
        local sound_hurt_period = 0.5
        if( ga_ment_type_var_exists(target_type, "sound_hurt_period") ) then
            sound_hurt_period = ga_ment_get_f(args.target_inst_id, "sound_hurt_period")
        end
        if( game_time - last_sound_hurt > sound_hurt_period ) then
            ga_ment_set_f(args.target_inst_id, "last_sound_hurt", game_time)
            local sound_hurt = ga_ment_get_s(args.target_inst_id, "sound_hurt")
            game_play_monster_hurt_sound.play(sound_hurt)
        end
    end

    --Alternate display icon.
    if( ga_ment_type_var_exists(source_type, "alt_attack_icon") ) then
        local attack_icon = ga_ment_get_s(args.source_inst_id, "alt_attack_icon")
        if( attack_icon ~= "" ) then
            local name = "ment" .. tostring(args.source_inst_id)
            if( ga_ment_b_exists_and_true(args.source_inst_id, "alt_attack_icon_use_parent_name") ) then
                --Need to override the name.
                --Could make this more clean:
                --Could have a var called alt_attack_icon_name_override
                --and have the proj shooting code do the logic.
                local parent_inst_id = ga_ment_get_i(args.source_inst_id, "parent_inst_id")
                name = "ment" .. parent_inst_id
            end
            local vel = ga_ment_get_v(args.source_inst_id, "__vel")
            local dir = std.vec_scale(vel, -1.0)
            if( ga_ment_b_exists_and_true(args.source_inst_id, "attack_icon_use_parent_for_dir" ) ) then
                --Need to override dir.
                local parent_inst_id = ga_ment_get_i(args.source_inst_id, "parent_inst_id")
                dir = ga_ment_vec_to_another_ment(args.target_inst_id, parent_inst_id)
            end
            local duration = 1.1
            ga_hud_reg_dir_tex(name, attack_icon, dir, duration)
        end
    end

    --Spraying a little blood.
    if( exceptions["no_blood"] ~= true ) then
        game_ment_blood.blood_hurt(args.target_inst_id, ret.damage_dealt)
    end

    -- ga_print("done with process_final function")
    -- ga_print("ret.terminal_hit = " .. tostring(ret.terminal_hit))

    return ret
end
