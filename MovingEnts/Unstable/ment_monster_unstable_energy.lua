-------------------------------------------------
--            Type Init Function
-------------------------------------------------

function p.__type_init(id)
    game_ment_type_init.monster(id)
    ia_ment_set_builtin_var_f(id, "__respawn_length", 60*60)
    ia_ment_set_builtin_var_f(id, "__radius", 0.5)
    ia_ment_set_builtin_var_s(id, "__mesh", "")
    ia_ment_new_var_i(id, "health", 1000, 60.0)
    ia_ment_new_static_var_f(id, "xp_mod", 3) --High!
    ia_ment_new_static_var_f(id, "dps", 1000.0)
    ia_ment_new_static_var_b(id, "emp_immune", true) --Emp, but not freeze immune.
    ia_ment_new_static_var_s(id, "sound_hurt", "shoot_4_1")
    ia_ment_new_static_var_f(id, "sound_hurt_period", 1.0)
    ia_ment_new_static_var_s(id, "sound_death", "shoot_4_2")
    ia_ment_new_static_var_s(id, "identity_str", "Unstable Energy")
    local aura_radius = 8.0
    ia_ment_new_static_var_b(id, "damage_aura_has", true)
    ia_ment_new_static_var_f(id, "damage_aura_duration", 1.0)
    ia_ment_new_static_var_i(id, "damage_aura_damage", 3000)
    ia_ment_new_static_var_f(id, "damage_aura_radius", aura_radius)
    ia_ment_new_static_var_b(id, "damage_aura_only_same_level", true)
    ia_ment_new_var_f(id, "damage_aura_next_time", 0.0, 60.0)
    ia_ment_set_builtin_var_f(id, "__gas_cloud_period", 0.05)
    ia_ment_set_builtin_var_f(id, "__gas_cloud_radius", aura_radius)
    ia_ment_set_builtin_var_f(id, "__gas_cloud_trigger_dist", 64.0)
    --
    ia_ment_set_builtin_var_b(id, "__homing", true)
    ia_ment_set_builtin_var_f(id, "__homing_speed", 20.0)
    ia_ment_set_builtin_var_f(id, "__homing_min_dist", 4.0)
    ia_ment_set_builtin_var_b(id, "__collides", false)
    ia_ment_set_builtin_var_b(id, "__point_block_correct", true)
    ia_ment_set_builtin_var_b(id, "__ment_correct", true)
    --
    ia_ment_new_var_b(id, "picture_aura_has", true, 60.0)
    ia_ment_new_static_var_s(id, "picture_aura_picture", "crossbones")
    ia_ment_new_static_var_f(id, "picture_aura_radius", 1000)
    ia_ment_new_static_var_b(id, "picture_aura_only_same_level", true)
    ia_ment_new_var_f(id, "picture_aura_next_time", 0.0, 60.0)
end

-------------------------------------------------
--              Inst Functions
-------------------------------------------------

function p.__on_add_to_live_world(inst_id)
    game_ment_add_to_live.monster(inst_id)
end

function p.__on_render(inst_id)
    --The radius of the ment on the ment's level.
    local ment_radius = ga_ment_get_radius(inst_id)
    ga_render_matrix_scaled(ment_radius, ment_radius, ment_radius)
    --
    --The rest is slightly different from green shrinker rings.
    local cur_time = ga_get_game_time()
    local speed_mod = 1.0
    --
    local angle1 = cur_time * 50.0 * speed_mod
    local axis1 = std.vec(1.0, 0.0, 0.0)
    ga_render_matrix_rotated(angle1, axis1)
    ga_render_mesh("MonsterUnstableEnergyRingLarge")
    --
    local angle2 = cur_time * 90.0 * speed_mod
    local axis2 = std.vec(0.0, 1.0, 0.0)
    ga_render_matrix_rotated(angle2, axis2)
    ga_render_mesh("MonsterUnstableEnergyRingMed")
    --
    local angle3 = cur_time * 200.0 * speed_mod
    local axis3 = std.vec(1.0, 0.0, 0.0)
    ga_render_matrix_rotated(angle3, axis3)
    ga_render_mesh("MonsterUnstableEnergyRingSmall")
end


function p.__on_alarm(inst_id, alarm_name)
    game_ment_alarms.monster(inst_id, alarm_name)
end
