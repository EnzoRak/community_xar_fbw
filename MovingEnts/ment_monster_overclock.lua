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
--            Type Init Functions
-------------------------------------------------

function p.create_shrink_warning_secondary(id)
    game_ment_type_init.helper_default_shooting_secondary(id)
    ia_ment_new_static_var_b(id, "secondary_shoots", true)
    ia_ment_new_static_var_f(id, "secondary_shoot_period", 1.0)
    ia_ment_new_static_var_b(id, "secondary_shoot_only_same_level", true)
    ia_ment_new_static_var_s(id, "secondary_shoot_proj_type", "ment_monster_marine_proj")
    ia_ment_new_static_var_f(id, "secondary_shoot_proj_speed", 0.0)
    ia_ment_new_static_var_f(id, "secondary_shoot_proj_ttl", 1.0)
    ia_ment_new_static_var_i(id, "secondary_shoot_proj_damage", 1)
    ia_ment_new_static_var_s(id, "secondary_shoot_alt_attack_icon", "icon_shrink_warning")
end

function p.__type_init(id)
    game_ment_type_init.monster(id)
    ia_ment_set_builtin_var_f(id, "__respawn_length", 60*60)
    ia_ment_set_builtin_var_f(id, "__radius", 3.0)
    ia_ment_set_builtin_var_s(id, "__mesh", "MonsterOverseer")
    ia_ment_new_var_i(id, "health", 8, 60.0)
    ia_ment_new_static_var_f(id, "dps", 10.0)
    ia_ment_new_static_var_s(id, "sound_death", "die_overseer")
    ia_ment_new_static_var_i(id, "xp_override", 100)
    --ia_ment_new_static_var_s(id, "die_drop_bent", "bent_gold_1")
    ia_ment_new_static_var_s(id, "identity_str", "Overclock")
    --
    ia_ment_new_static_var_b(id, "shoots", true)
    ia_ment_new_static_var_f(id, "shoot_period", 5.0)
    ia_ment_new_static_var_b(id, "shoot_period_lvlinv", true)
    ia_ment_new_static_var_b(id, "shoot_only_different_level", true)
    ia_ment_new_static_var_s(id, "shoot_proj_type", "ment_monster_overseer_proj")
    ia_ment_new_static_var_f(id, "shoot_proj_speed", 0.0)
    ia_ment_new_static_var_f(id, "shoot_proj_ttl", 10.0)
    ia_ment_new_static_var_i(id, "shoot_proj_damage", 50)
    --
    ment_monster_overseer.create_shrink_warning_secondary(id)
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