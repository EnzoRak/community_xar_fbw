-------------------------------------------------
--            Type Init Function
-------------------------------------------------

-- Name     HP     DPS
--
-- giga     1B
-- mega     300M
-- high     100M
-- elite    30M
-- adept    10M
-- grand    3M
-- major    1M           red
-- greater  300K         orange
-- normal   100K   1000  brown
-- lesser   30K          yellow
-- minor    10K          white/tan

function p.__type_init(id)
    game_ment_type_init.monster(id)
    ia_ment_set_builtin_var_f(id, "__respawn_length", 60*60)
    ia_ment_set_builtin_var_f(id, "__radius", 1.75)
    ia_ment_set_builtin_var_s(id, "__mesh", "MonsterFlowery")
    ia_ment_new_var_i(id, "health", 99999999, 60.0)
    ia_ment_new_static_var_f(id, "xp_mod", 10) --High!
    ia_ment_new_static_var_f(id, "dps", 1000.0)
    ia_ment_new_static_var_b(id, "emp_immune", true) --Emp, but not freeze immune.
    ia_ment_new_static_var_s(id, "sound_hurt", "hurt_flowery")
    ia_ment_new_static_var_f(id, "sound_hurt_period", 1.0)
    ia_ment_new_static_var_s(id, "sound_death", "die_flowery")
    ia_ment_new_static_var_s(id, "identity_str", "Flowery")
    local aura_radius = 8.0
    ia_ment_new_static_var_b(id, "damage_aura_has", true)
    ia_ment_new_static_var_f(id, "damage_aura_duration", 1.0)
    ia_ment_new_static_var_i(id, "damage_aura_damage", 1000)
    ia_ment_new_static_var_f(id, "damage_aura_radius", aura_radius)
    ia_ment_new_static_var_b(id, "damage_aura_only_same_level", true)
    ia_ment_new_var_f(id, "damage_aura_next_time", 0.0, 60.0)
    ia_ment_set_builtin_var_f(id, "__gas_cloud_period", 0.05)
    ia_ment_set_builtin_var_f(id, "__gas_cloud_radius", aura_radius)
    ia_ment_set_builtin_var_f(id, "__gas_cloud_trigger_dist", 64.0)
    --
    ia_ment_set_builtin_var_b(id, "__homing", true)
    ia_ment_set_builtin_var_f(id, "__homing_speed", 8.0)
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

function p.__on_alarm(inst_id, alarm_name)
    game_ment_alarms.monster(inst_id, alarm_name)
end
