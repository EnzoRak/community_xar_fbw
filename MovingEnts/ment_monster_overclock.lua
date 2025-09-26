--if the player is seen by monster and is smaller, half fire period, unless it is less than 0.04, then shoot twice, double player discrete change from last position
--if player is larger and seen, double fire period, half discrete change from last position 
--at least that's the plan
--ill do this later?
-------------------------------------------------
--              Damage AND Health
-------------------------------------------------

function p.xar_get_level_mod_damage_in(delta)
    if delta == 0 then return 1.0 end
    return (1.0 / 50.0)
end
-------------------------------------------------
--            Type Init Function
-------------------------------------------------

function p.__type_init(id)
    game_ment_type_init.monster(id)
    ia_ment_set_builtin_var_f(id, "__respawn_length", 60*60)
    ia_ment_set_builtin_var_f(id, "__radius", 3.0)
    ia_ment_set_builtin_var_s(id, "__mesh", "ment_chewing_gum") --change?
    ia_ment_new_var_i(id, "health", 8, 60.0)
    ia_ment_new_static_var_f(id, "dps", 10.0)
    ia_ment_new_static_var_s(id, "sound_death", "die_overseer")
    ia_ment_new_static_var_i(id, "xp_override", 100)
    ia_ment_new_static_var_s(id, "identity_str", "Overclock")

    ia_ment_new_static_var_b(id, "emp_immune", true) --Emp, but not freeze immune.
    ia_ment_new_static_var_b(id, "freeze_immune", true) --Emp, but not freeze immune.
    local aura_radius = 8.0
    ia_ment_new_static_var_f(id, "damage_aura_duration", 1.0)
    ia_ment_new_var_f(id, "damage_aura_next_time", 0.0, 60.0)
    ia_ment_new_static_var_f(id, "damage_aura_radius", aura_radius)

    ia_ment_new_static_var_b(id, "damage_aura_only_same_level", true)
    ia_ment_set_builtin_var_f(id, "__gas_cloud_period", 0.05)
    ia_ment_set_builtin_var_f(id, "__gas_cloud_radius", aura_radius)
    ia_ment_set_builtin_var_f(id, "__gas_cloud_trigger_dist", 64.0)

    ia_ment_set_builtin_var_b(id, "__collides", true)
    --
    ia_ment_new_var_b(id, "picture_aura_has", true, 60.0)
    ia_ment_new_static_var_s(id, "picture_aura_picture", "crossbones")
    ia_ment_new_static_var_f(id, "picture_aura_radius", 1000)
    ia_ment_new_static_var_b(id, "picture_aura_only_same_level", true)
    ia_ment_new_var_f(id, "picture_aura_next_time", 0.0, 60.0)
    
    game_ment_type_init.helper_default_shooting_secondary(id)
    ia_ment_new_static_var_s(id, "secondary_shoot_alt_attack_icon", "icon_shrink_warning")
end

-------------------------------------------------
--              Inst Functions
-------------------------------------------------

function p.__on_add_to_live_world(inst_id)
    game_ment_add_to_live.monster(inst_id)
end

function p.__on_alarm(inst_id, alarm_name)
    game_ment_alarms.monster(inst_id, alarm_name)
end

function p.__on_die(inst_id)
    game_ment_die.main(inst_id)
end

--need a custom aura behavior basicallly
function p.__on_update(inst_id, elapsed_time, elapsed_level_time)
    local aura_length = ga_ment_get_f(inst_id, "damage_aura_duration")
    local aura_next_time = ga_ment_get_f(inst_id, "damage_aura_next_time")
    local game_time = ga_get_game_time()
    local the_time = game_time

    if( the_time > aura_next_time + 10*aura_length ) then
        --Setting the next aura time.
        local next_aura_time = the_time + aura_length*ga_randf()
        ga_ment_set_f(inst_id, "damage_aura_next_time", next_aura_time)

        --Adding an alarm.
        ga_ment_set_alarm(inst_id, next_aura_time, "damage_aura_next")
        return
    end

    if( the_time > aura_next_time - 0.1 ) then
        local aura_radius = ga_ment_get_f(inst_id, "damage_aura_radius")
        local start_level = ga_ment_get_i(inst_id, "__start_level")
        if( aura_radius > 0 ) then
            --Doing a radius check.
            local sllp = ga_ment_get_sllp(inst_id)
            local viewer_lp = ga_get_viewer_lp(start_level)
            local dist_to_viewer = std.dist(sllp, viewer_lp)
            if( dist_to_viewer > aura_radius ) then return end
        end

        if( ga_ment_b_exists_and_true(inst_id, "damage_aura_only_same_level") ) then
            player_level = ga_get_viewer_level()
            if( start_level ~= player_level ) then return end
        end
        
        local damage = 0 + ga_get_i("xar.player.health.amount") + ga_get_i("xar.player.armor.amount") + ga_get_i("xar.player.shield.amount")
        --damage aura damage is curved
        -- *0.5 to do half of that every damage_aura_duration = 1 seconds
        --however, if i damage raw, then the curve is not affected
        damage = damage * 0.5
        damage = math.floor(damage)
        local cur_level = ga_ment_get_i(inst_id, "__level")
        local lp = ga_ment_get_lp(inst_id)
        local dir = ga_get_vec_to_viewer(
            cur_level,
            lp)
        local neg_dir = std.vec_scale(dir, -1.0)
        --it needs to be raw.
        game_top2.damage_player_from_dir(true, damage, neg_dir)

        --Setting the next aura time.
        local next_aura_time = the_time + aura_length
        ga_ment_set_f(inst_id, "damage_aura_next_time", next_aura_time)
        --Adding an alarm.
        ga_ment_set_alarm(inst_id, next_aura_time, "damage_aura_next")

        --ga_console_print("Chewing Gum Damage Aura: " .. tostring(damage) .. " damage to player.")
    end
end


function p.__render(inst_id)
    --The radius of the ment on the ment's level.
    local ment_radius = ga_ment_get_radius(inst_id)
    --might wanna multiply
    ga_render_matrix_scaled(ment_radius, ment_radius, ment_radius)
    --
    --Really fast rotation
    local cur_time = ga_get_game_time()
    local speed_mod = 2.0
    local angle1 = cur_time * 50.0 * speed_mod
    local axis1 = std.vec(1.0, 0.0, 0.0)
    ga_render_matrix_rotated(angle1, axis1)
    ga_render_mesh("MonsterSingularityRingLarge")
end
