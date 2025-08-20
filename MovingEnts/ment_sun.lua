-------------------------------------------------
--            Type Init Function
-------------------------------------------------

function p.__type_init(id)
    game_ment_type_init.monster(id)
    ia_ment_set_builtin_var_f(id, "__radius", 1.5)
    ia_ment_set_builtin_var_s(id, "__mesh", "ment_sun")
    --needs a buff on god
    ia_ment_new_var_i(id, "health", 50000, 60.0)
    ia_ment_new_static_var_f(id, "dps", 10.0)
    ia_ment_new_static_var_s(id, "sound_hurt", "hurt_mystic")
    ia_ment_new_static_var_f(id, "sound_hurt_period", 0.7)
    ia_ment_new_static_var_s(id, "sound_death", "die_mystic")
    --[[
    ia_ment_new_static_var_s(id, "die_drop_bent", "bent_upgrade_gun_0_proj_speed")
    ia_ment_new_static_var_s(id, "die_drop_box_txt", "Hole Projectile Speed Upgrade")
    ia_ment_new_static_var_b(id, "die_drop_box_allow", true)
    ia_ment_new_static_var_i(id, "die_drop_extra_levels", 1)
    ]]
    ia_ment_new_static_var_s(id, "identity_str", "Sun God")
    ia_ment_new_var_i(id, "damage", 10, 60.0)
    --
    ia_ment_new_static_var_b(id, "damage_aura_has", true)
    ia_ment_new_static_var_f(id, "damage_aura_duration", 1.0)
    ia_ment_new_static_var_i(id, "damage_aura_damage", 10)
    ia_ment_new_static_var_f(id, "damage_aura_radius", -1.0)
    ia_ment_new_var_f(id, "damage_aura_next_time", 0.0, 60.0)
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
    --ga_block_change_perm()
    game_ment_die.main(inst_id)
end
